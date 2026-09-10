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
                defaultValues: {codigo:'', delegadoId:"", documento: "", nombreJurado: "", tipoPersona: "", tipo: "1" }
            });

    const [juradosAsignados, setJuradosAsignados] = useState([]);
    const [indiceEditar, setIndiceEditar] = useState(null);
    const [delegados, setDelegados] = useState([]);
    const [loader, setLoader] = useState(true);
    const [titulo, setTitulo] = useState('');
    const [tipo, setTipo] = useState('I');
    
    const adicionarFila = () => {
        const documento = getValues('documento');
        const tipo      = getValues('tipo');

        if (!documento) {
            setError('documento', { type: 'manual', message: 'Debe ingresar el documento' });
            return;
        }
        clearErrors('documento');

        if (!tipo) {
            setError('tipo', { type: 'manual', message: 'Debe seleccionar el tipo' });
            return;
        }
        clearErrors('tipo');
    
        const resultDelegados = delegados.filter((data) => data.deledocumento == documento);
        if (resultDelegados.length === 0) {
            ShowSnackbar('Este documento no se encuentra en la lista de delegados activos', 'error');
            return;
        }

        const nombreJurado         = resultDelegados[0].nombreCompleto;
        const delegadoId           = resultDelegados[0].deleid;
        const tipoPersona          = tipo === '1' ? 'Jurado' : 'Testigo';
        let nuevosJuradosAsignados = [...juradosAsignados];
  
        if (indiceEditar !== null) {
            nuevosJuradosAsignados[indiceEditar] = {
                ...nuevosJuradosAsignados[indiceEditar],
                delegadoId,
                documento,
                nombreJurado,
                tipoPersona,
                tipo,
            };
        } else {  
            if (juradosAsignados.some(data => data.documento == documento)) {
                ShowSnackbar('Este registro ya fue adicionado', 'error');
                return;
            }

            nuevosJuradosAsignados.push({
                identificador: '',
                delegadoId:   delegadoId,
                documento:    documento,
                nombreJurado: nombreJurado,
                tipoPersona:  tipoPersona,
                tipo:   tipo,
                estado: 'I'
            });
        }

        setJuradosAsignados(nuevosJuradosAsignados);
        limpiarFormulario();
    };

    const limpiarFormulario = () => {
        setValue('documento', '');
        setValue('tipo', '1');
        clearErrors();
        setIndiceEditar(null);
    };

    const editarFila = (index) => {
        const fila = juradosAsignados[index];

        if (fila.estado === 'D') {
            ShowSnackbar('No se puede actualizar el jurado porque actualmente está marcado para eliminar.', 'warning' );
            return;
        }

        setValue('documento', fila.documento);
        setValue('tipo', fila.tipo);
        setIndiceEditar(index);
    };

    const eliminarFila = (id) =>{

        if (indiceEditar === id) {
            ShowSnackbar('No se puede eliminar el jurado porque actualmente está siendo editado.', 'warning' );
            return;
        }

        let newJuradosAsignados = []; 
        juradosAsignados.map((res,i) =>{
            if(res.estado === 'U' && i === id){
                newJuradosAsignados.push({ identificador:res.identificador, delegadoId:res.delegadoId, documento: res.documento, nombreJurado: res.nombreJurado, tipoPersona: res.tipoPersona, tipo: res.tipo, estado: 'D' }); 
            }else if(res.estado === 'D' && i === id){
                newJuradosAsignados.push({identificador:res.identificador, delegadoId:res.delegadoId, documento: res.documento, nombreJurado: res.nombreJurado, tipoPersona: res.tipoPersona, tipo: res.tipo, estado: 'U'});
            }else if((res.estado === 'D' || res.estado === 'U') && i !== id){
                newJuradosAsignados.push({identificador:res.identificador, delegadoId:res.delegadoId, documento: res.documento, nombreJurado: res.nombreJurado, tipoPersona: res.tipoPersona, tipo: res.tipo, estado:res.estado});
            }else{
                if(i != id){
                    newJuradosAsignados.push({identificador:res.identificador, delegadoId:res.delegadoId, documento: res.documento, nombreJurado: res.nombreJurado, tipoPersona: res.tipoPersona, tipo: res.tipo, estado: 'I' });
                }
            }
        })
        setJuradosAsignados(newJuradosAsignados);
    }

    const onSubmit = (formValues) => {

        if(juradosAsignados.length === 0){
            ShowSnackbar('Debe adicionar como mínimo un jurado', 'error');
            return;
        }

        const payload = {
            ...formValues,
            juradosAsignados: juradosAsignados
        };

        setLoader(true); 
        instance.post('/admin/organos/eleccion/jurados/salve', payload).then(res=>{
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
                setValue('codigo', res.id);
                setTitulo(res.titulo);
                if(res.jurados.length > 0){
                    let nuevosJuradosAsignados = [];
                    res.jurados.forEach(function(data){
                        nuevosJuradosAsignados.push({
                            identificador: data.oreljuid,
                            delegadoId:    data.deleid,
                            documento:     data.deledocumento,
                            nombreJurado:  data.nombreCompleto,
                            tipoPersona:   data.tipoJurado,
                            tipo:          data.oreljuesjurado,
                            estado: 'U'
                        });
                    });
                    setJuradosAsignados(nuevosJuradosAsignados);
                    setTipo('U');
                }
            } else{
                ShowSnackbar(res.message, 'error');
            }  
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

                        <Grid size={{ xs: 12 }}>
                            <Box className='divisionFormulario'>
                                Consultar jurado
                            </Box>
                        </Grid>

                        <Grid size={{ xs: 6, sm: 4, md: 4}}>
                            <TextField
                                label="Documento"
                                type="number"
                                fullWidth
                                variant="standard"
                                {...register("documento")}
                                error={!!errors.documento}
                                helperText={errors.documento?.message}
                                slotProps={{
                                        htmlInput: {
                                            autoComplete: "off",
                                            maxLength: 15
                                        },
                                        inputLabel: { shrink: true },
                                    }}
                            />
                        </Grid>

                        <Grid size={{ xs: 6, sm: 3, md: 3}}>
                            <Controller
                                name="tipo"
                                control={control}
                                render={({ field }) => (
                                    <TextField
                                        select
                                        label="Tipo"
                                        fullWidth
                                        variant="standard"
                                        {...field}
                                        error={!!errors.tipo}
                                        helperText={errors.tipo?.message}
                                    >
                                        <MenuItem value="">Seleccione</MenuItem>
                                        <MenuItem value={"1"}>Jurado</MenuItem>
                                        <MenuItem value={"0"}>Testigo</MenuItem>
                                    </TextField>
                                )}
                            />
                        </Grid>

                        <Grid size={{ xs: 6, sm: 3, md: 3 }}>
                            <Button type={"button"} className={'modalBtnIcono'}
                                startIcon={indiceEditar !== null ? <Edit className='icono' /> : <Add className='icono' /> } onClick={() => {adicionarFila()}}> {indiceEditar !== null ? 'Actualizar' : 'Agregar'}
                            </Button>
                        </Grid>

                        {(juradosAsignados.length > 0) ?
                            <Fragment>
                                <Grid size={{ xs: 12 }}>
                                    <Box className='divisionFormulario'>
                                        Jurados asignados
                                    </Box>
                                </Grid>

                                <Grid size={{ xs: 12 }}>
                                    <Table className={'tableAdicional'} sx={{width: '94%', margin:'auto'}} sm={{maxHeight: '98%', margin:'auto'}} >
                                        <TableHead>
                                            <TableRow>
                                                <TableCell>Documento</TableCell>
                                                <TableCell>Nombre</TableCell>
                                                <TableCell>Tipo</TableCell>
                                                <TableCell style={{width: '5%'}} className='cellCenter'>Editar </TableCell>
                                                <TableCell style={{width: '5%'}} className='cellCenter'>Eliminar </TableCell>
                                            </TableRow>
                                        </TableHead>
                                        <TableBody>
                                        { juradosAsignados.map((data, a) => {
                                            return(
                                                <TableRow key={'rowD-' +a} className={(data['estado'] == 'D')? 'tachado': null}>

                                                    <TableCell>
                                                        {data['documento']}
                                                    </TableCell>

                                                    <TableCell>
                                                        {data['nombreJurado']}
                                                    </TableCell>

                                                    <TableCell>
                                                        {data['tipoPersona']}
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