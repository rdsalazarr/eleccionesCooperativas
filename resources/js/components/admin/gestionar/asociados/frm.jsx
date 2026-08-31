import {useState, useEffect} from 'react';
import { Button, Grid, Box, TextField } from '@mui/material';
import { ShowSnackbar } from '../../../layout/snackBar';
import { yupResolver } from "@hookform/resolvers/yup";
import { LoaderModal } from "../../../layout/loader";
import instance from '../../../layout/instance';
import SaveAs from '@mui/icons-material/SaveAs';
import Save from '@mui/icons-material/Save';
import { useForm } from "react-hook-form";
import * as yup from "yup";

const schema = yup.object().shape({
    titulo: yup.string().required("El título es requerido").min(4, "El título debe tener mínimo 4 caracteres").max(190, "El título debe tener máximo 190 caracteres"),
    contenido: yup.string().required("El contenido es requerido").min(4, "El contenido debe tener mínimo 4 caracteres").max(3950, "El contenido debe tener máximo 3950 caracteres"),
});

export default function Frm({data, tipo}) {

    const { register, handleSubmit, reset, formState: { errors } } = useForm({
        resolver: yupResolver(schema),
        defaultValues: tipo !== 'I'
            ? { codigo: data.actaid, titulo: data.actatitulo, contenido: data.actacontenido, tipo: tipo }
            : { codigo: '000', titulo: '', contenido: '', tipo: tipo }
    });

    const [tiposIdentificaciones, setTiposIdentificaciones] = useState([]);
    const [habilitado, setHabilitado] = useState(true);
    const [agencias, setAgencias] = useState([]);
    const [loader, setLoader] = useState(false);

    const onSubmit = (formValues) => {
        setLoader(true);
        instance.post('/admin/asociado/salve', formValues).then(res => {
            let icono = res.success ? 'success' : 'error';
            ShowSnackbar(res.message, icono);
            (tipo !== 'I' && res.success) ? setHabilitado(false) : null; 
            (tipo === 'I' && res.success) ? reset({codigo: '000', titulo: '', contenido: '', tipo: tipo }) : null;
            setLoader(false);
        });
    };

    useEffect(()=>{
        setLoader(true);
        instance.post('/admin/asociados/list/datos', {codigo: data?.asocid || '000', tipo:tipo}).then(res=>{
            setTiposIdentificaciones(res.tiposIdentificaciones); 
            setAgencias(res.agencias); 
            setLoader(false);
        })
    }, []);

    if (loader) {
        return <LoaderModal />;
    }

    return (
        <form onSubmit={handleSubmit(onSubmit)}>

            <Grid container spacing={2}>

                <Grid size={{ xs: 12, sm: 6, md: 3 }}>
                    <Controller
                        name="tipoIdentificacion"
                        control={control}
                        render={({ field }) => (
                            <TextField
                                select
                                label="Tipo de identificación"
                                fullWidth
                                variant="standard"
                                {...field}
                                error={!!errors.tipoIdentificacion}
                                helperText={errors.tipoIdentificacion?.message}
                            >
                                <MenuItem value="">Seleccione</MenuItem>
                                {tiposIdentificaciones.map(res => (
                                    <MenuItem value={res.tipideid} key={res.tipideid}> {res.tipidenombre}</MenuItem>
                                ))}
                            </TextField>
                        )}
                    />
                </Grid>

                <Grid size={{ xs: 12 }}>
                    <TextField
                        label="Título"
                        fullWidth
                        variant="standard"
                        {...register("titulo")}
                        error={!!errors.titulo}
                        helperText={errors.titulo?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12 }}>
                    <TextField
                        multiline
                        minRows={1}
                        fullWidth
                        label="Contenido"
                        variant="standard"
                        sx={{'& textarea': {resize: 'vertical'}}}
                        {...register("contenido")}
                        error={!!errors.contenido}
                        helperText={errors.contenido?.message}
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