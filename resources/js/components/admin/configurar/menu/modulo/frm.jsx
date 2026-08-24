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
        nombre: yup.string().required("El nombre es obligatorio").min(4, "Debe tener mínimo 4 caracteres").max(30, "Máximo 30 caracteres"),
        icono:  yup.string().required("El ícono es obligatorio").min(4, "Debe tener mínimo 4 caracteres").max(30, "Máximo 30 caracteres"),
        orden:  yup.number().required("El orden es obligatorio").typeError("Debe ser un número").max(99, "Máximo 99"),
        estado: yup.string().required("El estado es obligatorio"),
    });

export default function Frm({data, tipo}){

    const { register, handleSubmit, reset, control, formState: { errors } } = useForm({
                resolver: yupResolver(schema),
                defaultValues: tipo !== 'I'
                    ? {codigo: data.moduid,    nombre: data.modunombre, orden: data.moduorden,
                        icono: data.moduicono, estado: data.moduactivo, tipo: tipo }
                    : {codigo: "000", nombre: "", orden: "", icono: "", estado: "1", tipo: tipo }
            });

    const [habilitado, setHabilitado] = useState(true);
    const [loader, setLoader] = useState(true);

    const onSubmit = (formValues) => {
        setLoader(true);
        instance.post('/admin/modulo/salve', formValues).then(res => {
            let icono = res.success ? 'success' : 'error';
            ShowSnackbar(res.message, icono);
            (tipo === 'I' && res.success) ? reset({codigo: "000", nombre: "", orden: parseInt(formValues.orden || 0) + 1, icono: "", estado: "1", tipo: tipo }) : null;
            (tipo !== 'I' && res.success) ? setHabilitado(false) : null;  
            setLoader(false);
        });
    };

    useEffect(() => {
        const timer = setTimeout(() => {
            setLoader(false);
        }, 300);

        return () => clearTimeout(timer);
    }, []);

    if(loader){
        return <LoaderModal />
    }

    return (
        <form onSubmit={handleSubmit(onSubmit)}>
            <Grid container spacing={2}>
                <Grid size={{ xs: 12 }}>
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
                                    maxLength: 30
                                }
                            }}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 5}}>
                    <TextField
                        label="Ícono"
                        fullWidth
                        variant="standard"
                        {...register("icono")}
                        error={!!errors.icono}
                        helperText={errors.icono?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 4 }}>
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