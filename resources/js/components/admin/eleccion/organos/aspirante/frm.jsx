import {useState, useEffect, Fragment} from 'react';
import { Button, Grid, Box, TextField, Icon, Table, TableHead, TableBody, TableRow, TableCell } from '@mui/material';
import {ShowSnackbar} from '../../../../layout/snackBar';
import {LoaderModal} from "../../../../layout/loader";
import instance from '../../../../layout/instance';
import SaveAs from '@mui/icons-material/SaveAs';
import Save from '@mui/icons-material/Save';
import Add from '@mui/icons-material/Add';
import { useForm } from "react-hook-form";

export default function Frm({data}){

    const { register, handleSubmit, getValues, setError, clearErrors, control, watch, setValue, formState: { errors } } = useForm({
                defaultValues: {tipoOrgano:data?.tiporgid, organoEleccion:data?.orgeleid,  delegadoId:"", documento: "", nombreDelegado: "", orden: "" }
            });

    const [delegadosParticipantes, setDelegadosParticipantes] = useState([]);
    const [delegados, setDelegados] = useState([]);
    const [loader, setLoader] = useState(true);
    const [tipo, setTipo] = useState('I');

    const adicionarFila = () => {
        const documento = getValues('documento');

        if (!documento) {
            setError('documento', { type: 'manual', message: 'Debe ingresar el documento' });
            return;
        }
        clearErrors('documento');
    
        const resultDelegados = delegados.filter((data) => data.deledocumento == documento);
        if (resultDelegados.length === 0) {
            ShowSnackbar('Este documento no se encuentra en la lista de delegados', 'error');
            return;
        }

        const nombreDelegado          = resultDelegados[0].nombreCompleto;
        const delegadoId              = resultDelegados[0].deleid;
        let newDelegadosParticipantes = [...delegadosParticipantes];  

        if (delegadosParticipantes.some(data => data.documento == documento)) {
            ShowSnackbar('Este registro ya fue adicionado', 'error');
            return;
        }

        const orden = delegadosParticipantes
                        .filter(data => data.estado !== 'D')
                        .reduce((max, data) => Math.max(max, Number(data.orden) || 0), 0) + 1;

        newDelegadosParticipantes.push({
            identificador: '',
            delegadoId:     delegadoId,
            documento:      documento,
            nombreDelegado: nombreDelegado,
            orden:  orden,
            estado: 'I'
        });    

        setDelegadosParticipantes(newDelegadosParticipantes);
        limpiarFormulario();
    };

    const limpiarFormulario = () => {
        setValue('documento', '');
        clearErrors();
    };

    const eliminarFila = (id) => {

        let newDelegadosParticipantes = delegadosParticipantes.map((res, i) => {

            if (i !== id) {
                return {
                    identificador: res.identificador,
                    delegadoId: res.delegadoId,
                    documento: res.documento,
                    nombreDelegado: res.nombreDelegado,
                    orden: res.orden,
                    estado: res.estado
                };
            }

            if (res.estado === 'U') {
                return {
                    identificador: res.identificador,
                    delegadoId: res.delegadoId,
                    documento: res.documento,
                    nombreDelegado: res.nombreDelegado,
                    orden: res.orden,
                    estado: 'D'
                };
            }

            if (res.estado === 'D') {
                return {
                    identificador: res.identificador,
                    delegadoId: res.delegadoId,
                    documento: res.documento,
                    nombreDelegado: res.nombreDelegado,
                    orden: res.orden,
                    estado: 'U'
                };
            }

            // Si es un registro nuevo, simplemente se elimina
            return null;

        }).filter(Boolean);

        // Recalcular orden únicamente de los registros activos
        let orden = 1;
        newDelegadosParticipantes = newDelegadosParticipantes.map(res => {
            if (res.estado !== 'D') {
                return {
                    ...res,
                    orden: orden++
                };
            }
            return res;
        });

        setDelegadosParticipantes(newDelegadosParticipantes);
    };

    const onSubmit = (formValues) => {

        if(delegadosParticipantes.length === 0){
            ShowSnackbar('Debe adicionar como mínimo un delegado', 'error');
            return;
        }

        const payload = {
            ...formValues,
            delegadosParticipantes: delegadosParticipantes
        };

        setLoader(true); 
        instance.post('/admin/organos/eleccion/aspirantes/salve', payload).then(res=>{
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
        instance.post('/admin/organos/eleccion/aspirantes/list/datos', {tipoOrgano:data?.tiporgid, organoEleccion:data?.orgeleid}).then(res=>{
            if(res.success) {
                setDelegados(res.delegados);
                if(res.delegadosParticipantes.length > 0){
                    let newDelegadoParticipantes = [];
                    res.delegadosParticipantes.forEach(function(data){
                        newDelegadoParticipantes.push({
                            identificador:  data.orelpaid,
                            delegadoId:     data.deleid,
                            documento:      data.deledocumento,
                            nombreDelegado: data.nombreCompleto,
                            orden:          data.orelpaordenparticipacion,
                            estado: 'U'
                        });
                    });
                    setDelegadosParticipantes(newDelegadoParticipantes);
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
        <Box>
            <Grid container spacing={2}>
                <Grid size={{ xs: 12, sm: 4}}>
                    <Box className='frmTexto'>
                        <label>Tipo órgano</label>
                        <span>{data.tiporgnombre}</span>
                    </Box>
                </Grid>

                <Grid size={{ xs: 12, sm: 8}}>
                    <Box className='frmTexto'>
                        <label>Órgano de elección</label>
                        <span>{data.orgeletitulo}</span>
                    </Box>
                </Grid>
            </Grid>

            <form onSubmit={handleSubmit(onSubmit)} >
                <Grid container spacing={2}  sx={{ justifyContent: 'center', alignItems: 'center' }}>

                    <Grid size={{ xs: 12 }}>
                        <Box className='divisionFormulario'>
                            Consultar delegado
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

                    <Grid size={{ xs: 6, sm: 3, md: 3 }}>
                        <Button type={"button"} className={'modalBtnIcono'}
                            startIcon={<Add className='icono' />} onClick={() => {adicionarFila()}}> {'Agregar'}
                        </Button>
                    </Grid>

                    {(delegadosParticipantes.length > 0) ?
                        <Fragment>
                            <Grid size={{ xs: 12 }}>
                                <Box className='divisionFormulario'>
                                    Delegados inscritos al tipo de órgano {data.tiporgnombre}
                                </Box>
                            </Grid>

                            <Grid size={{ xs: 12 }}>
                                <Table className={'tableAdicional'} sx={{width: '94%', margin:'auto'}} sm={{maxHeight: '98%', margin:'auto'}} >
                                    <TableHead>
                                        <TableRow>
                                            <TableCell>Documento</TableCell>
                                            <TableCell>Nombre</TableCell>
                                            <TableCell>Oden</TableCell>
                                            <TableCell style={{width: '5%'}} className='cellCenter'>Eliminar </TableCell>
                                        </TableRow>
                                    </TableHead>
                                    <TableBody>
                                    { delegadosParticipantes.map((data, a) => {
                                        return(
                                            <TableRow key={'rowD-' +a} className={(data['estado'] == 'D')? 'tachado': null}>

                                                <TableCell>
                                                    {data['documento']}
                                                </TableCell>

                                                <TableCell>
                                                    {data['nombreDelegado']}
                                                </TableCell>

                                                <TableCell>
                                                    {data['orden']}
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
                                <b>No existen registros adicionados</b>
                            </Box> 
                        </Grid>
                    }

                </Grid>

            </form>
        </Box>
    )
}