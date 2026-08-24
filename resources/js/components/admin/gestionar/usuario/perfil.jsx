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
        nickUsuario: yup.string().required('El nick de usuario es obligatorio').min(6, 'El nick de usuario debe tener al menos 6 caracteres').max(15, 'El nick de usuario no puede exceder los 15 caracteres'),
        correo:      yup.string().required("El campo correo es requerido").email("Debe ser un correo válido")       
    });

export default function Perfil(){

       const { register, handleSubmit, getValues, setError, clearErrors, reset, control, watch, setValue, formState: { errors } } = useForm({
                resolver: yupResolver(schema),
                defaultValues: {codigo:'000', correo: '',  nickUsuario:'' }
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
                setValue('personaId', data.persid);
                setValue('correo', data.usuaemail);
                setValue('nickUsuario', data.usuanick);
                setData(data)
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
                  <Grid size={{ xs: 12, sm: 3  }}>
                    <Box className='frmTexto'>
                        <label>Tipo de identificación</label>
                        <span>{data.tipidenombre}</span>
                    </Box>
                </Grid>

                <Grid size={{ xs: 12, sm: 3  }}>
                    <Box className='frmTexto'>
                        <label>Documento</label>
                        <span>{data.persdocumento}</span>
                    </Box>
                </Grid>

                <Grid size={{ xs: 12, sm: 3  }}>
                    <Box className='frmTexto'>
                        <label>Nombre (s)</label>
                        <span>{data.usuanombre}</span>
                    </Box>
                </Grid>

                <Grid size={{ xs: 12, sm: 3  }}>
                    <Box className='frmTexto'>
                        <label>Apellido (s)</label>
                        <span>{data.usuaapellidos}</span>
                    </Box>
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

                <Grid size={{ xs: 12, sm: 3 }} style={{textAlign: 'right'}}>
                    <Button type="submit" className={'modalBtn'} disabled={!habilitado} startIcon={<SaveAs />} >
                        Actualizar
                    </Button>
                </Grid>
            </Grid>
        </form>
    )
}