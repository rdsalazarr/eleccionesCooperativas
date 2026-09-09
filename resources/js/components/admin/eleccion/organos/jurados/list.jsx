import {useState, useEffect, Fragment} from 'react';
import { Button, Grid, Card, Typography, MenuItem, Box, TextField, Icon, Table, TableHead, TableBody, TableRow, TableCell } from '@mui/material';
import {ShowSnackbar} from '../../../../layout/snackBar';
import { useForm, Controller } from "react-hook-form";
import {LoaderModal} from "../../../../layout/loader";
import instance from '../../../../layout/instance';
import SaveAs from '@mui/icons-material/SaveAs';
import Edit from '@mui/icons-material/Edit';
import Save from '@mui/icons-material/Save';
import Add from '@mui/icons-material/Add';

export default function List(){

    const { register, handleSubmit, getValues, setError, clearErrors, control, watch, setValue, formState: { errors } } = useForm({    
                defaultValues: { diaNotificacion: "" }
            });

    const [diasNotificacion, setDiasNotificacion] = useState([]);
    const [indiceEditar, setIndiceEditar] = useState(null);
    const [delegados, setDelegados] = useState([]);
    const [loader, setLoader] = useState(true);
    const [jurados, setJurados] = useState([]);
    const [titulo, setTitulo] = useState('');
    const [tipo, setTipo] = useState('I');

    const adicionarFila = () => {
        const diaNotificacion = getValues('diaNotificacion');

        if (!diaNotificacion) {
            setError('diaNotificacion', {type: 'manual',  message: 'Debe ingresar el dia' });
            return;
        }
        clearErrors('diaNotificacion');

        let nuevosDiasNotificacion = [...diasNotificacion];
        if (indiceEditar !== null) {
            nuevosDiasNotificacion[indiceEditar] = {
                ...nuevosDiasNotificacion[indiceEditar],
                diaNotificacion,
            };
        }else{
            if (diasNotificacion.some(rango => rango.diaNotificacion == diaNotificacion)) {
                ShowSnackbar('Este registro ya fue adicionado', 'error');
                return;
            }
            nuevosDiasNotificacion.push({ identificador: '', diaNotificacion: diaNotificacion,  estado: 'I'});
        }

        setDiasNotificacion(nuevosDiasNotificacion);
        limpiarFormulario();
    };

    const limpiarFormulario = () => {
        setValue('diaNotificacion', '');
        clearErrors();
        setIndiceEditar(null);
    };

    const editarFila = (index) => {
        const fila = diasNotificacion[index];

        if (fila.estado === 'D') {
            ShowSnackbar('No se puede actualizar el día de notificación porque actualmente está marcado para eliminar.', 'warning' );
            return;
        }

        setValue('diaNotificacion', fila.diaNotificacion);

        setIndiceEditar(index);
    };

    const eliminarFila = (id) =>{

        if (indiceEditar === id) {
            ShowSnackbar('No se puede eliminar el día de notificación porque actualmente está siendo editado.', 'warning' );
            return;
        }

        let newDiasNotificacion = []; 
        diasNotificacion.map((res,i) =>{
            if(res.estado === 'U' && i === id){
                newDiasNotificacion.push({ identificador:res.identificador, diaNotificacion: res.diaNotificacion, estado: 'D' }); 
            }else if(res.estado === 'D' && i === id){
                newDiasNotificacion.push({identificador:res.identificador, diaNotificacion: res.diaNotificacion, estado: 'U'});
            }else if((res.estado === 'D' || res.estado === 'U') && i !== id){
                newDiasNotificacion.push({identificador:res.identificador, diaNotificacion: res.diaNotificacion, estado:res.estado});
            }else{
                if(i != id){
                    newDiasNotificacion.push({identificador:res.identificador, diaNotificacion: res.diaNotificacion, estado: 'I' });
                }
            }
        })
        setDiasNotificacion(newDiasNotificacion);
    }

    const onSubmit = (formValues) => {

        if(diasNotificacion.length === 0){
            ShowSnackbar('Debe adicionar como mínimo una día de notificación', 'error');
            return;
        }

        const payload = {
            ...formValues,
            diasNotificacion: diasNotificacion
        };

        setLoader(true); 
        instance.post('/admin/dias/notificacion/salve', payload).then(res=>{
            let icono = (res.success) ? 'success' : 'error';
            ShowSnackbar(res.message, icono);
            if (res.success) {
                setTimeout(() => {
                    inicio();
                }, 300);
            }else{
               setLoader(false); 
            }
        })
    }

    const inicio = () =>{
        setLoader(true);
        instance.get('/admin/organos/eleccion/jurados/list').then(res=>{
            if(res.success) {
                setDelegados(res.delegados);
                 setJurados(res.jurados);
                setTitulo(res.titulo);      
                
            } else{
                ShowSnackbar(res.message, 'error');
            } 

            /*if(res.data.length > 0){
                let nuevosDiasNotificacion = [];
                res.data.forEach(function(rango){
                    nuevosDiasNotificacion.push({
                        identificador:   rango.dianotid,
                        diaNotificacion: rango.dianotdias,
                        estado: 'U'
                    });
                });
                setDiasNotificacion(nuevosDiasNotificacion);
               setTipo('U');
            }*/
            setLoader(false);
        }) 
    }

    useEffect(()=>{inicio() }, []);

    if(loader){
        return <LoaderModal />
    }

    return (
        <Box className={'containerSmoll'}>
            <Box>
                <Typography component={'h2'} className={'titleGeneral'}>{titulo}</Typography>
            </Box>
            <Card className={'cardContainer'}>
                <form onSubmit={handleSubmit(onSubmit)} >
                    <Grid container spacing={2}  sx={{ justifyContent: 'center', alignItems: 'center' }}>

                        <Grid size={{ xs: 8, sm: 9, md: 4}}>
                            <Controller
                                name="diaNotificacion"
                                fullWidth
                                control={control}
                                render={({ field }) => (
                                    <TextField
                                        label="Días de notificación"
                                        type="number"
                                        variant="standard"
                                        fullWidth
                                        {...field}
                                        error={!!errors.diaNotificacion}
                                        helperText={errors.diaNotificacion?.message}
                                        onChange={(e) => {
                                            const value = e.target.value;
                                            if (value === '' || (Number(value) <= 99 && value.length <= 2)) {
                                                field.onChange(value);
                                                clearErrors('diaNotificacion');
                                            }
                                        }}
                                    />
                                )}
                            />
                        </Grid>

                        <Grid size={{ xs: 4, sm: 3, md: 3 }}>
                            <Button type={"button"} className={'modalBtnIcono'}
                                startIcon={indiceEditar !== null ? <Edit className='icono' /> : <Add className='icono' /> } onClick={() => {adicionarFila()}}> {indiceEditar !== null ? 'Actualizar' : 'Agregar'}
                            </Button>
                        </Grid>

                        {(diasNotificacion.length > 0) ?
                            <Fragment>
                                <Grid size={{ xs: 12 }}>
                                    <Box className='divisionFormulario'>
                                        Listado de días asignados
                                    </Box>
                                </Grid>

                                <Grid size={{ xs: 12 }}>
                                    <Table className={'tableAdicional'} sx={{width: '60%', margin:'auto'}} sm={{maxHeight: '90%', margin:'auto'}} >
                                        <TableHead>
                                            <TableRow>
                                                <TableCell>Día</TableCell>
                                                <TableCell style={{width: '5%'}} className='cellCenter'>Editar </TableCell>
                                                <TableCell style={{width: '5%'}} className='cellCenter'>Eliminar </TableCell>
                                            </TableRow>
                                        </TableHead>
                                        <TableBody>
                                        { diasNotificacion.map((rango, a) => {
                                            return(
                                                <TableRow key={'rowD-' +a} className={(rango['estado'] == 'D')? 'tachado': null}>

                                                    <TableCell>
                                                        {rango['diaNotificacion']}
                                                    </TableCell>

                                                    <TableCell className='cellCenter'>
                                                        <Icon key={'iconUpdate'+a} className={'icon top green'}
                                                                onClick={() => {editarFila(a);}}
                                                            >edit</Icon>
                                                    </TableCell>

                                                    <TableCell className='cellCenter'>
                                                        <Icon key={'iconDelete'+a} className={'icon top red'}
                                                                onClick={() => {eliminarFila(a);}}
                                                            >clear</Icon>
                                                    </TableCell>
                                                </TableRow>
                                                );
                                            })
                                        }
                                        </TableBody>
                                    </Table>
                                </Grid>

                                <Grid size={{ xs: 12 }}>
                                    <Box className={'botonesModal'}>
                                        <Button type="submit" className={'modalBtn'} startIcon={(tipo === 'I') ? <Save /> : <SaveAs />} >
                                            {(tipo === 'I') ? "Guardar" : "Actualizar"}
                                        </Button>
                                    </Box>
                                </Grid>

                            </Fragment>
                        : 
                            <Grid size={{ xs: 12 }}>
                                <Box style={{textAlign: 'center', fontSize: '1.5em', color: '#8b8b8b', fontWeight: '600'}}>
                                    <b>No existen registros para mostrar</b>
                                </Box> 
                            </Grid>
                        }

                    </Grid>

                </form>
            </Card>
        </Box>
    )
}