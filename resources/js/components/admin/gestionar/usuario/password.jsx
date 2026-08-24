import { useState } from 'react';
import { Button, Grid, Box, TextField } from '@mui/material';
import { ShowSnackbar } from '../../../layout/snackBar';
import { yupResolver } from "@hookform/resolvers/yup";
import { LoaderModal } from "../../../layout/loader";
import SaveIcon from '@mui/icons-material/Save';
import instance from '../../../layout/instance';
import { useForm } from "react-hook-form";
import * as yup from "yup";

const schema = yup.object({
    password:    yup.string().required("Campo obligatorio").min(8, "Debe tener mínimo 8 caracteres"),
    repPassword: yup.string().required("Campo obligatorio").oneOf([yup.ref('password')], "Las contraseñas no coinciden")
});

export default function Perfil() {

    const { register, handleSubmit, reset, formState: { errors } } = useForm({
        resolver: yupResolver(schema),
        defaultValues: { password: '', repPassword: '' }
    });

    const [habilitado, setHabilitado] = useState(true);
    const [loader, setLoader] = useState(false);

    const onSubmit = (formValues) => {
        setLoader(true); 
        instance.post('/admin/usuario/actualizar/password', formValues).then(res=>{
            let icono = (res.success) ? 'success' : 'error';
            ShowSnackbar(res.message, icono);
            if (res.success) {
                setHabilitado(false);
                reset({ password: '', repPassword: '' });
            }
            setLoader(false);
        })
    }

    if (loader) {
        return <LoaderModal />;
    }

    return (
        <form onSubmit={handleSubmit(onSubmit)}>
            <Box style={{ width: '70%', margin: 'auto' }}>
                <Grid container spacing={2}>

                    <Grid size={{ xs: 12, sm: 12, md: 7 }}>
                        <p>La contraseña debe cumplir con los siguientes requisitos:</p>
                        <ul>
                            <li>Debe tener entre 8 y 20 caracteres de longitud.</li>
                            <li>Debe incluir al menos una letra mayúscula.</li>
                            <li>Debe incluir al menos una letra minúscula.</li>
                            <li>Debe contener al menos un número.</li>
                            <li>Debe incluir al menos un carácter especial, como *, #, o !.</li>
                            <li>No debe tener números ni letras consecutivas.</li>
                        </ul>
                    </Grid>

                    <Grid size={{ xs: 12, sm: 12, md: 5 }}>
                        <Grid container spacing={2}>

                            <Grid size={{ xs: 12 }}>
                                <TextField
                                    label="Contraseña"
                                    fullWidth
                                    variant="standard"
                                    type="password"
                                    {...register("password")}
                                    error={!!errors.password}
                                    helperText={errors.password?.message}
                                />
                            </Grid>

                            <Grid size={{ xs: 12 }}>
                                <TextField
                                    label="Rep - Contraseña"
                                    fullWidth
                                    variant="standard"
                                    type="password"
                                    {...register("repPassword")}
                                    error={!!errors.repPassword}
                                    helperText={errors.repPassword?.message}
                                />
                            </Grid>

                        </Grid>

                        <Box className={'botonesModal'}>
                            <Button
                                type="submit"
                                className={'modalBtn'}
                                disabled={!habilitado}
                                startIcon={<SaveIcon />}
                            >
                                Guardar
                            </Button>
                        </Box>

                    </Grid>
                </Grid>
            </Box>
        </form>
    );
}