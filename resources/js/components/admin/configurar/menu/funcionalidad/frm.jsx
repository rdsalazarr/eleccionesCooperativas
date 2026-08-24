import {useState, useEffect} from 'react';
import { Button, Grid, MenuItem, Box, TextField } from '@mui/material';
import {ShowSnackbar} from '../../../../layout/snackBar';
import { yupResolver } from "@hookform/resolvers/yup";
import { useForm, Controller } from "react-hook-form";
import {LoaderModal} from "../../../../layout/loader";
import instance from '../../../../layout/instance';
import SaveAs from '@mui/icons-material/SaveAs';
import Save from '@mui/icons-material/Save';
import * as yup from "yup";

const schema = yup.object({
        modulo: yup.string().required('El módulo es obligatorio'),
        nombre: yup.string().required('El nombre es obligatorio').min(3, 'El nombre debe tener al menos 3 caracteres').max(80, 'El nombre no puede exceder los 80 caracteres'),
        titulo: yup.string().required('El título es obligatorio').min(3, 'El título debe tener al menos 3 caracteres').max(80, 'El título no puede exceder los 80 caracteres'),
        ruta:   yup.string().required('La ruta es obligatoria').min(4, 'La ruta debe tener al menos 4 caracteres').max(60, 'La ruta no puede exceder los 60 caracteres'),
        icono:  yup.string().required('El ícono es obligatorio').min(2, 'El ícono debe tener al menos 2 caracteres').max(30, 'El ícono no puede exceder los 30 caracteres'),
        orden:  yup.number().required('El orden es obligatorio').typeError("Debe ser un número").max(99, "Máximo 99"),
        estado: yup.string().required('El estado es obligatorio')
    });

export default function Frm({data, tipo}){

    const { register, handleSubmit, reset, control, formState: { errors } } = useForm({
                resolver: yupResolver(schema),
                defaultValues: tipo !== 'I'
                    ? {codigo: data.funcid, modulo: data.moduid, nombre: data.funcnombre, orden: data.funcorden,
                         icono: data.funcicono, titulo: data.functitulo, ruta: data.funcruta, estado: String(data.funcactiva), tipo: tipo }
                    : {codigo: "000", modulo: '', nombre: "", orden: 0, icono: "", titulo: 'Gestionar ', ruta: '', estado: "1", tipo: tipo }
            });

    const [habilitado, setHabilitado] = useState(true);
    const [loader, setLoader] = useState(false);
    const [modulos, setModulos] = useState([]);

   const onSubmit = (formValues) => {
        setLoader(true); 
        instance.post('/admin/funcionalidad/salve', formValues).then(res=>{
            let icono = (res.success) ? 'success' : 'error';
            ShowSnackbar(res.message, icono);
            (tipo !== 'I' && res.success) ? setHabilitado(false) : null; 
            (tipo === 'I' && res.success) ? reset({codigo: "000", modulo: formValues.modulo, nombre: "", orden: parseInt(formValues.orden || 0) + 1, icono: "", titulo: "Gestionar ", ruta: "", estado: "1", tipo: tipo}) : null;
            setLoader(false);
        })
    }

    const inicio = () =>{
        setLoader(true);
        instance.post('/admin/funcionalidad/listar/modulos').then(res=>{
            setModulos(res.data);
            setLoader(false);
        }) 
    }

    useEffect(()=>{inicio(); }, []);

    if(loader){
        return <LoaderModal />
    }

    return (
        <form onSubmit={handleSubmit(onSubmit)} >
            <Grid container spacing={2}>

                <Grid size={{ xs: 12, sm: 6, md: 3 }}>
                    <Controller
                        name="modulo"
                        control={control}
                        render={({ field }) => (
                            <TextField
                                select
                                label="Módulo"
                                fullWidth
                                variant="standard"
                                {...field}
                                error={!!errors.modulo}
                                helperText={errors.modulo?.message}
                            >
                                <MenuItem value="">Seleccione</MenuItem>
                                {modulos.map(res => (
                                    <MenuItem value={res.moduid} key={res.moduid}> {res.modunombre}</MenuItem>
                                ))}
                            </TextField>
                        )}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 6, md: 3  }}>
                    <TextField
                        label="Nombre"
                        fullWidth
                        variant="standard"
                        {...register("nombre")}
                        error={!!errors.nombre}
                        helperText={errors.nombre?.message}
                    />
                </Grid> 

                <Grid size={{ xs: 12, sm: 6, md: 3 }}>
                    <TextField
                        label="Título"
                        fullWidth
                        variant="standard"
                        {...register("titulo")}
                        error={!!errors.titulo}
                        helperText={errors.titulo?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 6, md: 3 }}>
                    <TextField
                        label="Ruta"
                        fullWidth
                        variant="standard"
                        {...register("ruta")}
                        error={!!errors.ruta}
                        helperText={errors.ruta?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 6, md: 3 }}>
                    <TextField
                        label="Ícono"
                        fullWidth
                        variant="standard"
                        {...register("icono")}
                        error={!!errors.icono}
                        helperText={errors.icono?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 6, md: 3 }}>
                    <TextField
                        label="Orden"
                        type="number"
                        fullWidth
                        variant="standard"
                        {...register("orden")}
                        error={!!errors.orden}
                        helperText={errors.orden?.message}
                    />
                </Grid> 

                <Grid size={{ xs: 12, sm: 6, md: 3 }}>
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
                                <MenuItem value="1">Sí</MenuItem>
                                <MenuItem value="0">No</MenuItem>
                            </TextField> 
                        )}
                    />
                </Grid>

            </Grid>

            <Box className={'botonesModal'}>
                <Button type="submit" className={'modalBtn'} disabled={!habilitado} startIcon={(tipo === 'I') ? <Save /> : <SaveAs />} >
                    {(tipo === 'I') ? "Guardar" : "Actualizar"}
                </Button>
            </Box>
        </form>
    );
}