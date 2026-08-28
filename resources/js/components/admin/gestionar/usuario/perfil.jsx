import {useState, useEffect} from 'react';
import { Button, Grid, TextField, Box } from '@mui/material';
import { ShowSnackbar } from '../../../layout/snackBar';
import { yupResolver } from "@hookform/resolvers/yup";
import { LoaderModal } from "../../../layout/loader";
import instance from '../../../layout/instance';
import SaveAs from '@mui/icons-material/SaveAs';
import { useForm } from "react-hook-form";
import * as yup from "yup";

const schema = yup.object({
        documento:   yup.string().required('El número de documento es obligatorio').min(6, 'El número de documento debe tener al menos 6 caracteres').max(15, 'El número de documento no puede exceder los 15 caracteres'),
        nombre:      yup.string().required('El nombre es obligatorio').min(4, 'El nombre de usuario debe tener al menos 4 caracteres').max(50, 'El nombre de usuario no puede exceder los 50 caracteres'),
        apellido:    yup.string().required('El apellido es obligatorio').min(4, 'El apellido de usuario debe tener al menos 4 caracteres').max(50, 'El apellido de usuario no puede exceder los 50 caracteres'),        
        nickUsuario: yup.string().required('El nick de usuario es obligatorio').min(6, 'El nick de usuario debe tener al menos 6 caracteres').max(15, 'El nick de usuario no puede exceder los 15 caracteres'),
        correo:      yup.string().required("El campo correo es requerido").email("Debe ser un correo válido")       
    });

export default function Perfil(){

       const { register, handleSubmit, setValue, formState: { errors } } = useForm({
                resolver: yupResolver(schema),
                defaultValues: {documento:'', nombre:'', apellido: '', correo: '',  nickUsuario:'' }
            }); 

    const [habilitado, setHabilitado] = useState(true);
    const [loader, setLoader] = useState(true);
    const [data, setData] = useState([]);

    const onSubmit = (formValues) => {
        setLoader(true);
        instance.post('/admin/usuario/actualizar/perfil', formValues).then(res=>{
            let icono = (res.success) ? 'success' : 'error';
            ShowSnackbar(res.message, icono);
            (res.success) ? setHabilitado(false) : null;
            setLoader(false);
        })
    }

    const inicio = () =>{
        setLoader(true);
        instance.get('/admin/usuario/consultar/perfil').then(res=>{
            if(res.success) {
                const data = res.data;
                setValue('documento', data.usuadocumento);
                setValue('apellido', data.usuaapellidos);
                setValue('nickUsuario', data.usuanick);
                setValue('nombre', data.usuanombre);
                setValue('correo', data.usuaemail);
                setData(data);
            } else {
                ShowSnackbar(res.message, 'error');
            } 
            setLoader(false);
        })
    }

    useEffect(()=>{inicio();}, []);

    if(loader){
        return <LoaderModal />
    }

    return (
        <form onSubmit={handleSubmit(onSubmit)} >
            <Grid container spacing={2}>
                <Grid size={{ xs: 12, sm: 3 }}>
                    <TextField
                        label="Documento"
                        fullWidth
                        variant="standard"
                        {...register("documento")}
                        error={!!errors.documento}
                        helperText={errors.documento?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 3 }}>
                    <TextField
                        label="Nombre (s)"
                        fullWidth
                        variant="standard"
                        {...register("nombre")}
                        error={!!errors.nombre}
                        helperText={errors.nombre?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 3 }}>
                    <TextField
                        label="Apellido (s)"
                        fullWidth
                        variant="standard"
                        {...register("apellido")}
                        error={!!errors.apellido}
                        helperText={errors.apellido?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 3 }}>
                    <TextField
                        label="Nick usuario"
                        fullWidth
                        variant="standard"
                        {...register("nickUsuario")}
                        error={!!errors.nickUsuario}
                        helperText={errors.nickUsuario?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 3 }}>
                    <TextField
                        label="Correo"
                        fullWidth
                        variant="standard"
                        {...register("correo")}
                        error={!!errors.correo}
                        helperText={errors.correo?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 3 }} />
                <Grid size={{ xs: 12, sm: 3 }} />

                <Grid size={{ xs: 12, sm: 3 }} style={{textAlign: 'right'}}>
                    <Button type="submit" className={'modalBtn'} disabled={!habilitado} startIcon={<SaveAs />} >
                        Actualizar
                    </Button>
                </Grid>
            </Grid>
        </form>
    )
}