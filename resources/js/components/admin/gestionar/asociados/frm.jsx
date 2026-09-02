import {useState, useEffect} from 'react';
import { Button, Grid, Box, TextField, MenuItem } from '@mui/material';
import { ShowSnackbar } from '../../../layout/snackBar';
import { yupResolver } from "@hookform/resolvers/yup";
import { useForm, Controller } from "react-hook-form";
import { LoaderModal } from "../../../layout/loader";
import instance from '../../../layout/instance';
import SaveAs from '@mui/icons-material/SaveAs';
import Save from '@mui/icons-material/Save';
import * as yup from "yup";

const schema = yup.object().shape({
    tipoIdentificacion: yup.string().required('Debe seleccionar un tipo de identificación'),
    documento:          yup.string().required("El documento es obligatorio").min(6, "El documento debe tener mínimo 6 caracteres").max(15, "Máximo 15 caracteres"),
    nombre:             yup.string().required("El nombre es requerido").min(4, "El nombre debe tener mínimo 4 caracteres").max(100, "El nombre debe tener máximo 100 caracteres"),
    correo:             yup.string().required("El campo correo es requerido").email("Debe ser un correo válido").max(80, "Máximo 80 caracteres"),
    fechaNacimiento:    yup.string().required("La fecha de nacimiento es requeria"),
    fechaExpedicion:    yup.string().required("La fecha de expedición es requeria"),
    fechaIngreso:       yup.string().required("La fecha de ingreso a la cooperativa es requeria"),
    telefono:           yup.string().nullable().max(20, "Máximo 20 caracteres"),
    celular:            yup.string().nullable().max(20, "Máximo 20 caracteres"),
    agencia:            yup.string().required('Debe seleccionar una agencia'),
    genero:             yup.string().required("El genero es obligatorio"),
    estado:             yup.string().required("El campo activo es obligatorio"),
});

export default function Frm({data, tipo}) {

    const { register, handleSubmit, reset, control, formState: { errors } } = useForm({
        resolver: yupResolver(schema),
        defaultValues: tipo !== 'I'
            ? { codigo: data.asocid, tipoIdentificacion: data.tipideid, documento: data.asocnumerodocumento, nombre:data.asocnombrecompleto, 
                correo:data.asocemail, fechaNacimiento: data.asocfechanacimiento, fechaExpedicion: data.asocfechaexpedicion, fechaIngreso: data.asocfechaingreso, 
                telefono: data.actasoctelefonoaid, celular: data.asoccelular, agencia: data.agenid, genero: data.asocgenero, estado: data.asocactivo, tipo: tipo }
            : { codigo: '000', tipoIdentificacion: '', documento: '', nombre:'', correo:'', fechaNacimiento:'', fechaExpedicion: '', fechaIngreso: '',
                telefono:'', celular:'', agencia:'', genero:'', estado:'1', tipo: tipo }
    });

    const [tiposIdentificaciones, setTiposIdentificaciones] = useState([]);
    const [habilitado, setHabilitado] = useState(true);
    const [agencias, setAgencias] = useState([]);
    const [loader, setLoader] = useState(false);

    const onSubmit = (formValues) => {
        setLoader(true);
        instance.post('/admin/asociados/salve', formValues).then(res => {
            let icono = res.success ? 'success' : 'error';
            ShowSnackbar(res.message, icono);
            (tipo !== 'I' && res.success) ? setHabilitado(false) : null; 
            (tipo === 'I' && res.success) ? reset({codigo: '000', tipoIdentificacion: '', documento: '', nombre:'', correo:'', fechaNacimiento:'',
                                            fechaExpedicion: '', fechaIngreso: '', telefono:'', celular:'', agencia:'', genero:'', estado:'', tipo: tipo }) : null;
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
                                    maxLength: 15
                                }
                            }}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 6 }}>
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

                <Grid size={{ xs: 12, sm: 3 }}>
                    <Controller
                        name="fechaNacimiento"
                        fullWidth
                        control={control}
                        render={({ field }) => (
                            <TextField
                                label="Fecha de nacimiento"
                                type="date"
                                variant="standard"
                                fullWidth
                                {...field}
                                error={!!errors.fechaNacimiento}
                                helperText={errors.fechaNacimiento?.message}
                                slotProps={{inputLabel: { shrink: true } }}
                            />
                        )}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 3 }}>
                    <Controller
                        name="fechaExpedicion"
                        fullWidth
                        control={control}
                        render={({ field }) => (
                            <TextField
                                label="Fecha de expedición"
                                type="date"
                                variant="standard"
                                fullWidth
                                {...field}
                                error={!!errors.fechaExpedicion}
                                helperText={errors.fechaExpedicion?.message}
                                slotProps={{inputLabel: { shrink: true } }}
                            />
                        )}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 3 }}>
                    <Controller
                        name="fechaIngreso"
                        fullWidth
                        control={control}
                        render={({ field }) => (
                            <TextField
                                label="Fecha de ingreso"
                                type="date"
                                variant="standard"
                                fullWidth
                                {...field}
                                error={!!errors.fechaIngreso}
                                helperText={errors.fechaIngreso?.message}
                                slotProps={{inputLabel: { shrink: true } }}
                            />
                        )}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 3 }}>
                   <TextField
                        label="Teléfono fijo"
                        fullWidth
                        variant="standard"
                        {...register("telefono")}
                        error={!!errors.telefono}
                        helperText={errors.telefono?.message}
                        slotProps={{
                                htmlInput: {
                                    autoComplete: "off",
                                    maxLength: 20
                                }
                            }}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 3 }}>
                   <TextField
                        label="Teléfono celular"
                        fullWidth
                        variant="standard"
                        {...register("celular")}
                        error={!!errors.celular}
                        helperText={errors.celular?.message}
                        slotProps={{
                                htmlInput: {
                                    autoComplete: "off",
                                    maxLength: 20
                                }
                            }}
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
                        slotProps={{
                                htmlInput: {
                                    autoComplete: "off",
                                    maxLength: 80
                                }
                            }}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 2 }}>
                    <Controller
                        name="agencia"
                        control={control}
                        render={({ field }) => (
                            <TextField
                                select
                                label="Agencia"
                                fullWidth
                                variant="standard"
                                {...field}
                                error={!!errors.agencia}
                                helperText={errors.agencia?.message}
                            >
                                <MenuItem value="">Seleccione</MenuItem>
                                {agencias.map(res => (
                                    <MenuItem value={res.agenid} key={res.agenid}> {res.agennombre}</MenuItem>
                                ))}
                            </TextField>
                        )}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 2 }}>
                    <Controller
                        name="genero"
                        control={control}
                        render={({ field }) => (
                            <TextField
                                select
                                label="Género"
                                fullWidth
                                variant="standard"
                                {...field}
                                error={!!errors.genero}
                                helperText={errors.genero?.message}
                            >
                                <MenuItem value="">Seleccione</MenuItem>
                                <MenuItem value="M">Masculino</MenuItem>
                                <MenuItem value="F">Femenino</MenuItem>
                            </TextField> 
                        )}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 2 }}>
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