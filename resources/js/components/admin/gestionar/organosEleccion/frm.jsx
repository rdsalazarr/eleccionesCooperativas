import {useState, Fragment, useEffect} from 'react';
import { Button, Grid, MenuItem, TextField, Icon, Table, TableHead, TableBody, TableRow, TableCell, Box } from '@mui/material';
import {ShowSnackbar} from '../../../layout/snackBar';
import { yupResolver } from "@hookform/resolvers/yup";
import { useForm, Controller } from "react-hook-form";
import {LoaderModal} from "../../../layout/loader";
import instance from '../../../layout/instance';
import SaveAs from '@mui/icons-material/SaveAs';
import Save from '@mui/icons-material/Save';
import Add from '@mui/icons-material/Add';
import * as yup from "yup";

const schema = yup.object({
        titulo:     yup.string().required('El título es obligatorio').min(6, 'El título debe tener al menos 6 caracteres').max(150, 'El título no puede exceder los 150 caracteres'),
        lugar:      yup.string().required('El lugar es obligatorio').min(4, 'El lugar debe tener al menos 4 caracteres').max(100, 'El lugar no puede exceder los 100 caracteres'),
        periodo:    yup.string().required('El período es obligatorio').min(6, 'El período debe tener al menos 6 caracteres').max(20, 'El período no puede exceder los 20 caracteres'),
        estado:     yup.string().required('El campo estado es obligatorio'),
        tipoOrgano: yup.string().nullable(),
    });

export default function Frm({data, tipo}){

    const { register, handleSubmit, getValues, setError, clearErrors, reset, control, setValue, formState: { errors } } = useForm({
                resolver: yupResolver(schema),
                defaultValues: tipo !== 'I'
                    ? {codigo:data.orgeleid,     titulo:data.orgeletitulo, lugar:data.orgelelugar,  periodo:data.orgeleperiodo, 
                        estado:data.orgeleactivo, tipoOrgano:'', tipo:tipo }
                    : {codigo:'000', titulo:'', lugar:'', periodo: '',  estado:'1', tipoOrgano:'', tipo: tipo }
            }); 

    const [tipoOrganosElecciones, setTipoOrganosElecciones] = useState([]);
    const [habilitado, setHabilitado] = useState(true);
    const [tipoOrganos, setTipoOrganos] = useState([]);
    const [loader, setLoader] = useState(true);

    const adicionarFila = () => {
        const tipoOrganoSeleccionado = getValues('tipoOrgano');

        if (!tipoOrganoSeleccionado) {
            setError('tipoOrgano', {type: 'manual',  message: 'Debe seleccionar un tipo de órgano' });
            return;
        }
        clearErrors('tipoOrgano');

        if (tipoOrganosElecciones.some(tipo => tipo.tipoOrgano == tipoOrganoSeleccionado)) {
            ShowSnackbar('Este registro ya fue adicionado', 'error');
            return;
        }

        const resultTipoOrganos      = tipoOrganos.filter((tipo) => tipo.tiporgid == tipoOrganoSeleccionado);
        let newTipoOrganosElecciones = [...tipoOrganosElecciones];
        newTipoOrganosElecciones.push({ identificador: '', tipoOrgano: tipoOrganoSeleccionado, nombreTipoOrgano: resultTipoOrganos[0].tiporgnombre, estado: 'I'});
        setTipoOrganosElecciones(newTipoOrganosElecciones);
        setValue('tipoOrgano', '');
    };

    const eliminarFila = (id) =>{
        let newTipoOrganosElecciones = []; 
        tipoOrganosElecciones.map((res,i) =>{
            if(res.estado === 'U' && i === id){
                newTipoOrganosElecciones.push({ identificador:res.identificador, tipoOrgano: res.tipoOrgano, nombreTipoOrgano:res.nombreTipoOrgano, estado: 'D' }); 
            }else if(res.estado === 'D' && i === id){
                newTipoOrganosElecciones.push({identificador:res.identificador, tipoOrgano: res.tipoOrgano, nombreTipoOrgano:res.nombreTipoOrgano, estado: 'U'});
            }else if((res.estado === 'D' || res.estado === 'U') && i !== id){
                newTipoOrganosElecciones.push({identificador:res.identificador, tipoOrgano: res.tipoOrgano, nombreTipoOrgano:res.nombreTipoOrgano, estado:res.estado});
            }else{
                if(i != id){
                    newTipoOrganosElecciones.push({identificador:res.identificador, tipoOrgano: res.tipoOrgano, nombreTipoOrgano:res.nombreTipoOrgano, estado: 'I' });
                }
            }
        })
        setTipoOrganosElecciones(newTipoOrganosElecciones);
    }

    const onSubmit = (formValues) => {
        if(tipoOrganosElecciones.length === 0){
            ShowSnackbar('Debe adicionar como mínimo un tipo de órgano', 'error');
            return
        }

        const payload = {
            ...formValues,
            tiposOrganos: tipoOrganosElecciones
        };

        setLoader(true);
        instance.post('/admin/organo/eleccion/salve', payload).then(res=>{
            let icono = (res.success) ? 'success' : 'error';
            ShowSnackbar(res.message, icono);
            (tipo !== 'I' && res.success) ? setHabilitado(false) : null;
            (tipo === 'I' && res.success) ? reset({codigo:'000', titulo:'', lugar:'', periodo: '', estado:'1', tipoOrgano:'', tipo: tipo}) : null;
            setLoader(false);
        })
    }
 
    useEffect(()=>{
        setLoader(true);
        instance.post('/admin/organo/eleccion/list/datos', {codigo: data?.orgeleid || '000', tipo:tipo}).then(res=>{
            setTipoOrganos(res.tipoOrganos);
            if(tipo === 'U' && res.success){
                let newTipoOrganosElecciones = [];
                res.tipoOrganosElecciones.forEach(function(data){
                    newTipoOrganosElecciones.push({
                        identificador:    data.oreltoid,
                        tipoOrgano:       data.tiporgid,
                        nombreTipoOrgano: data.tiporgnombre,
                        estado: 'U'
                    });
                });
                setTipoOrganosElecciones(newTipoOrganosElecciones);
            }
            setLoader(false);
        })
    }, []);

    if(loader){
        return <LoaderModal />
    }

    return (
       <form onSubmit={handleSubmit(onSubmit)} >
            <Grid container spacing={2}>

                <Grid size={{ xs: 12, sm: 6  }}>
                    <TextField
                        label="Título"
                        fullWidth
                        variant="standard"
                        {...register("titulo")}
                        error={!!errors.titulo}
                        helperText={errors.titulo?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 6  }}>
                    <TextField
                        label="Lugar"
                        fullWidth
                        variant="standard"
                        {...register("lugar")}
                        error={!!errors.lugar}
                        helperText={errors.lugar?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 6 }}>
                    <TextField
                        label="Período"
                        fullWidth
                        variant="standard"
                        {...register("periodo")}
                        error={!!errors.periodo}
                        helperText={errors.periodo?.message}
                    />
                </Grid>     

                <Grid size={{ xs: 12, sm: 3 }}>
                    <Controller
                        name="estado"
                        control={control}
                        render={({ field }) => (
                            <TextField
                                select
                                label="Activo"
                                fullWidth
                                variant="standard"
                                {...field}
                                error={!!errors.estado}
                                helperText={errors.estado?.message}
                            >
                                <MenuItem value="">Seleccione</MenuItem>
                                <MenuItem value={"1"}>Sí</MenuItem>
                                <MenuItem value={"0"}>No</MenuItem>
                            </TextField> 
                        )}
                    />
                </Grid>

                <Grid size={{ xs: 12 }}>
                    <Box className='divisionFormulario'>
                        Asignar tipo de órganos
                    </Box>
                </Grid>

                <Grid size={{ xs: 1, sm: 1, md: 2}}>
                </Grid>

                <Grid size={{ xs: 11, sm: 11, md: 8 }}>
                    <Controller
                        name="tipoOrgano"
                        control={control}
                        render={({ field }) => (
                            <TextField
                                select
                                label="Tipo de órgano"
                                fullWidth
                                variant="standard"
                                {...field}
                                error={!!errors.tipoOrgano}
                                helperText={errors.tipoOrgano?.message}
                            >
                                <MenuItem value="">Seleccione</MenuItem>
                                {tipoOrganos.map(res=>{
                                    return <MenuItem value={res.tiporgid} key={res.tiporgid}> {res.tiporgnombre}</MenuItem>
                                })}
                            </TextField> 
                        )}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 12, md: 2 }}>
                    <Button type={"button"} className={'modalBtnIcono'} 
                        startIcon={<Add className='icono' />} onClick={() => {adicionarFila()}}> {"Agregar"}
                    </Button>
                </Grid>

                {(tipoOrganosElecciones.length > 0) ?
                    <Fragment>
                        <Grid size={{ xs: 12 }}>
                            <Box className='divisionFormulario'>
                                Tipo de órganos asignados al órgano de elección
                            </Box>
                        </Grid>

                        <Grid size={{ xs: 12 }}>
                            <Table className={'tableAdicional'} md={{width: '70%', margin:'auto'}}  sx={{width: '80%', margin:'auto'}} sm={{maxHeight: '90%', margin:'auto'}} >
                                <TableHead>
                                    <TableRow>
                                        <TableCell style={{width: '90%'}}>Nombre del tipo de órgano</TableCell>
                                        <TableCell style={{width: '10%'}} className='cellCenter'>Acción </TableCell>
                                    </TableRow>
                                </TableHead>
                                <TableBody>
                                { tipoOrganosElecciones.map((rolUsuar, a) => {
                                    return(
                                        <TableRow key={'rowD-' +a} className={(rolUsuar['estado'] == 'D')? 'tachado': null}>
                                            <TableCell>
                                                {rolUsuar['nombreTipoOrgano']}
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
                    </Fragment>
                : null }

            </Grid>

            <Box className={'botonesModal'}>
                <Button type="submit" className={'modalBtn'} disabled={!habilitado} startIcon={(tipo === 'I') ? <Save /> : <SaveAs />} >
                    {(tipo === 'I') ? "Guardar" : "Actualizar"}
                </Button>
            </Box>
        </form>
    );
}