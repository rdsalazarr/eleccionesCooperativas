import {useState, Fragment, useEffect} from 'react';
import { Button, Grid, TextField, Icon, Table, TableHead, TableBody, TableRow, TableCell, Box } from '@mui/material';
import { ShowSnackbar } from '../../../../../layout/snackBar';
import { LoaderModal } from "../../../../../layout/loader";
import { yupResolver } from "@hookform/resolvers/yup";
import instance from '../../../../../layout/instance';
import Save from '@mui/icons-material/Save';
import Add from '@mui/icons-material/Add';
import { useForm } from "react-hook-form";
import * as yup from "yup";

const schema = yup.object().shape({
    documento: yup.string().nullable(),
    nombre:    yup.string().nullable(),
    cargo:     yup.string().nullable()
});  

export default function Frm({data}) {

     const { register, handleSubmit, getValues, setError, clearErrors, setValue, formState: { errors } } = useForm({
        resolver: yupResolver(schema),
        defaultValues: { codigo: data.eldeagid, documento: '', nombre: '', cargo:'', nombreAgencia: data.agennombre}
    });

    const [juradosAgencias, setJuradosAgencias] = useState([]);
    const [habilitado, setHabilitado] = useState(true);
    const [loader, setLoader] = useState(false);

    const adicionarFila = () => {
        const documento = getValues('documento');
        const nombre    = getValues('nombre');
        const cargo     = getValues('cargo');

        if (!documento) {
            setError('documento', {type: 'manual',  message: 'Debe ingresar el documento' });
            return;
        }
        clearErrors('documento');

        if (!nombre) {
            setError('nombre', {type: 'manual',  message: 'Debe ingresar el nombre' });
            return;
        }
        clearErrors('nombre');

         if (!cargo) {
            setError('cargo', {type: 'manual',  message: 'Debe ingresar el cargo' });
            return;
        }
        clearErrors('cargo');

        if (juradosAgencias.some(data => data.documento == documento)) {
            ShowSnackbar('Este registro ya fue adicionado', 'error');
            return;
        }

        let newJuradosAgencias = [...juradosAgencias];
        newJuradosAgencias.push({identificador: '', documento: documento, nombre: nombre, cargo: cargo, nombreAgencia: data.agennombre, estado: 'I'});
        setJuradosAgencias(newJuradosAgencias);
        setValue('documento', '');
        setValue('nombre', '');
        setValue('cargo', '');
    };

    const eliminarFila = (id) =>{
        let newJuradosAgencias = [];
        juradosAgencias.map((res,i) =>{
            if(res.estado === 'U' && i === id){
                newJuradosAgencias.push({ identificador:res.identificador, nombreAgencia: res.nombreAgencia, documento: res.documento, nombre:res.nombre, cargo: res.cargo, estado: 'D' });
            }else if(res.estado === 'D' && i === id){
                newJuradosAgencias.push({identificador:res.identificador, nombreAgencia: res.nombreAgencia, documento: res.documento, nombre:res.nombre, cargo: res.cargo, estado: 'U'});
            }else if((res.estado === 'D' || res.estado === 'U') && i !== id){
                newJuradosAgencias.push({identificador:res.identificador, nombreAgencia: res.nombreAgencia, documento: res.documento, nombre:res.nombre, cargo: res.cargo, estado:res.estado});
            }else{
                if(i != id){
                    newJuradosAgencias.push({identificador:res.identificador, nombreAgencia: res.nombreAgencia, documento: res.documento, nombre:res.nombre, cargo: res.cargo, estado: 'I' });
                }
            }
        })
        setJuradosAgencias(newJuradosAgencias);
    }

    const onSubmit = (formValues) => {

        if(juradosAgencias.length === 0){
            ShowSnackbar('Debe adicionar como mínimo un jurado para la agencia '+data.agennombre, 'error');
            return
        }

        const payload = {
            ...formValues,
            jurados: juradosAgencias
        };

        setLoader(true);
        instance.post('/admin/eleccion/delegado/gestion/asignar/jurados/salve', payload).then(res => {
            let icono = res.success ? 'success' : 'error';
            ShowSnackbar(res.message, icono);
            (res.success) ? setHabilitado(false) : null; 
            setLoader(false);
        });
    };

    useEffect(()=>{
        setLoader(true);
        instance.post('/admin/eleccion/delegado/gestion/asignar/jurados/list', {codigo: data.eldeagid}).then(res=>{
            if(res.success){
                let newJuradosAgencias = [];
                res.juradosAgencias.forEach(function(data){
                    newJuradosAgencias.push({
                        identificador: data.eldeajid,
                        documento:     data.eldeajdocumento,
                        nombre:        data.eldeajnombre,
                        cargo:         data.eldeajcargo,
                        nombreAgencia: data.agennombre,
                        estado: 'U'
                    });
                });
                setJuradosAgencias(newJuradosAgencias);
            }
            setLoader(false);
        })
    }, []);

    if (loader) {
        return <LoaderModal />;
    }

    return (
        <form onSubmit={handleSubmit(onSubmit)}>

            <Grid container spacing={2}>

                <Grid size={{ xs: 12 }}>
                    <Box className='divisionFormulario'>
                        Asignar jurados a la elección de delegados
                    </Box>
                </Grid>

                 <Grid size={{ xs: 12, sm: 3 }}>
                    <TextField
                        label="Documento"
                        fullWidth
                        variant="standard"
                        {...register("documento")}
                        error={!!errors.documento}
                        helperText={errors.documento?.message}
                        slotProps={{
                                htmlInput: {
                                    autoComplete: "off",
                                    maxLength: 50
                                }
                            }}
                    />
                </Grid>

                <Grid size={{ xs: 6, sm: 4 }}>
                    <TextField
                        label="Nombre"
                        fullWidth
                        variant="standard"
                        {...register("nombre")}
                        error={!!errors.nombre}
                        helperText={errors.nombre?.message}
                        slotProps={{
                                htmlInput: {
                                    autoComplete: "off",
                                    maxLength: 100
                                }
                            }}
                    />
                </Grid>

                <Grid size={{ xs: 6, sm: 3 }}>
                    <TextField
                        label="Cargo"
                        fullWidth
                        variant="standard"
                        {...register("cargo")}
                        error={!!errors.cargo}
                        helperText={errors.cargo?.message}
                        slotProps={{
                                htmlInput: {
                                    autoComplete: "off",
                                    maxLength: 50
                                }
                            }}
                    />
                </Grid>

                <Grid size={{ xs: 6, sm: 2 }} style={{textAlign: 'center'}}>
                    <Button type={"button"} className={'modalBtnIcono'} 
                        startIcon={<Add className='icono' />} onClick={() => {adicionarFila()}}> {"Agregar"}
                    </Button>
                </Grid>

                {(juradosAgencias.length > 0) ?
                    <Fragment>
                        <Grid size={{ xs: 12 }}>
                            <Box className='divisionFormulario'>
                                Información de las agencias asignada a la elección de delegados
                            </Box>
                        </Grid>

                        <Grid size={{ xs: 12 }}>
                            <Table className={'tableAdicional'} sx={{width: '90%', margin:'auto'}} sm={{maxHeight: '96%', margin:'auto'}} >
                                <TableHead>
                                    <TableRow>
                                        <TableCell>Agencia</TableCell>
                                        <TableCell>Documento</TableCell>
                                        <TableCell>Nombre</TableCell>
                                        <TableCell>Cargo</TableCell>
                                        <TableCell style={{width: '10%'}} className='cellCenter'>Acción </TableCell>
                                    </TableRow>
                                </TableHead>
                                <TableBody>
                                { juradosAgencias.map((data, a) => {
                                    return(
                                        <TableRow key={'rowD-' +a} className={(data['estado'] == 'D') ? 'tachado': null}>
                                            <TableCell>
                                                {data['nombreAgencia']}
                                            </TableCell> 

                                            <TableCell>
                                                {data['documento']}
                                            </TableCell> 

                                             <TableCell>
                                                {data['nombre']}
                                            </TableCell> 

                                            <TableCell>
                                                {data['cargo']}
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

            <Box className={'botonesModal'} style={{marginTop:'1em'}}>
                <Button type="submit" className={'modalBtn'} disabled={!habilitado} startIcon={<Save />} >
                    {"Guardar"}
                </Button>
            </Box>

        </form>
    );
}