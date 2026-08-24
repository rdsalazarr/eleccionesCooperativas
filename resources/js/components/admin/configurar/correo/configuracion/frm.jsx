import {useState} from 'react';
import { Button, Grid, Box, TextField } from '@mui/material';
import {ShowSnackbar} from '../../../../layout/snackBar';
import { yupResolver } from "@hookform/resolvers/yup";
import {LoaderModal} from "../../../../layout/loader";
import instance from '../../../../layout/instance';
import SaveAs from '@mui/icons-material/SaveAs';
import { useForm } from "react-hook-form";
import * as yup from "yup";

const schema = yup.object({
        host:     yup.string().required('El host es obligatorio').min(8, 'El host debe tener al menos 3 caracteres').max(40, 'El host no puede exceder los 40 caracteres'),
        usuario:  yup.string().required('El usuario es obligatorio').min(5, 'El usuario debe tener al menos 5 caracteres').max(80, 'El usuario no puede exceder los 80 caracteres'),
        clave:    yup.string().required('La clave es obligatoria').min(8, 'La clave debe tener al menos 8 caracteres').max(20, 'La clave no puede exceder los 20 caracteres'),
        claveApi: yup.string().required('La clave de la API es obligatorio').min(10, 'La clave de la API tener al menos 10 caracteres').max(20, 'La clave de la API no puede exceder los 30 caracteres'),
        puerto:   yup.string().required('El puetto es obligatorio').min(2, 'El puerto debe tener al menos 2 caracteres').max(4, 'El puerto no puede exceder los 4 caracteres'),
    });

export default function Frm({data}){ 

    const { register, handleSubmit, formState: { errors } } = useForm({
                resolver: yupResolver(schema),
                defaultValues:  {codigo: data.incocoid, host: data.incocohost, usuario: data.incocousuario, clave: data.incococlave,
                                claveApi: data.incococlaveapi, puerto: data.incocopuerto }
            });

    const [habilitado, setHabilitado] = useState(true);
    const [loader, setLoader] = useState(false);

    const onSubmit = (formValues) => {
        setLoader(true);
        instance.post('/admin/configuracion/correo/salve', formValues).then(res=>{
            let icono = (res.success) ? 'success' : 'error';
            ShowSnackbar(res.message, icono);
            (res.success) ? setHabilitado(false) : null;
            setLoader(false);
        })
    }

    if(loader){
        return <LoaderModal />
    }

    return (
        <form onSubmit={handleSubmit(onSubmit)} >
            <Grid container spacing={2}>

                <Grid size={{ xs: 12, sm: 6 }}>
                    <TextField
                        label="Host"
                        fullWidth
                        variant="standard"
                        {...register("host")}
                        error={!!errors.host}
                        helperText={errors.host?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 6 }}>
                    <TextField
                        label="Usuario"
                        fullWidth
                        variant="standard"
                        {...register("usuario")}
                        error={!!errors.usuario}
                        helperText={errors.usuario?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 6, md: 4 }}>
                    <TextField
                        label="Clave"
                        fullWidth
                        variant="standard"
                        {...register("clave")}
                        error={!!errors.clave}
                        helperText={errors.clave?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 6, md: 4 }}>
                    <TextField
                        label="Clave de la API"
                        fullWidth
                        variant="standard"
                        {...register("claveApi")}
                        error={!!errors.claveApi}
                        helperText={errors.claveApi?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 6, md: 4 }}>
                    <TextField
                        label="Puerto"
                        fullWidth
                        variant="standard"
                        {...register("puerto")}
                        error={!!errors.puerto}
                        helperText={errors.puerto?.message}
                    />
                </Grid>

            </Grid>

            <Box className={'botonesModal'}>
                <Button type="submit" className={'modalBtn'} disabled={!habilitado} startIcon={<SaveAs />} >
                    {"Actualizar"}
                </Button>
            </Box>
        </form>
    );
}