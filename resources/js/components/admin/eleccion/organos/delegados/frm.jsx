import {useState, useEffect} from 'react';
import { Button, Grid, Box, TextField, MenuItem } from '@mui/material';
import {ShowSnackbar} from '../../../../layout/snackBar';
import { yupResolver } from "@hookform/resolvers/yup";
import { useForm, Controller } from "react-hook-form";
import {LoaderModal} from "../../../../layout/loader";
import instance from '../../../../layout/instance';
import SaveAs from '@mui/icons-material/SaveAs';
import Save from '@mui/icons-material/Save';
import * as yup from "yup";

const schema = yup.object({
        agencia:         yup.string().required('Debe seleccionar una agencia'),
        documento:       yup.string().required("El documento es obligatorio").min(6, "El documento debe tener mínimo 6 caracteres").max(15, "Máximo 15 caracteres"),
        primerNombre:    yup.string().required("El primer nombre es obligatorio").min(3, "El primer nombre debe tener mínimo 3 caracteres").max(40, "Máximo 40 caracteres"),
        segundoNombre:   yup.string().nullable().max(40, "Máximo 40 caracteres"),
        primerApellido:  yup.string().required("El primer apellido es obligatorio").min(3, "El primer apellido debe tener mínimo 3 caracteres").max(40, "Máximo 40 caracteres"),
        segundoApellido: yup.string().nullable().max(40, "Máximo 40 caracteres"),
        correo:          yup.string().required("El campo correo es requerido").email("Debe ser un correo válido").max(80, "Máximo 80 caracteres"),
        telefono:        yup.string().nullable().max(20, "Máximo 20 caracteres"),
        numeroDelegado:  yup.number().required('Los número de delegado es obligatorio').typeError("Debe ser un número").max(99, "Máximo 99"),
        estado:          yup.string().required('Debe seleccionar un estado'),
    });

export default function Frm({data, tipo}){

    const { register, handleSubmit, reset, control, formState: { errors } } = useForm({
           resolver: yupResolver(schema),
           defaultValues: tipo !== 'I'
               ? { codigo: data.deleid, agencia: data.agenid, documento: data.deledocumento, primerNombre:data.deleprimernombre,
                   segundoNombre:data.delesegundonombre, primerApellido:data.deleprimerapellido, segundoApellido:data.delesegundoapellido, 
                   correo:data.delecorreo, numeroDelegado:data.delenumero,   telefono:data.deletelefono, estado:data.deleactivo, tipo: tipo }
               : { codigo: '000', agencia: '', documento: '', primerNombre: '', segundoNombre: '', primerApellido: '', 
                    segundoApellido: '', numeroDelegado: '',  correo: '', telefono: '', estado:'1', tipo: tipo }
       });
        
    const [habilitado, setHabilitado] = useState(true);
    const [agencias, setAgencias] = useState([]);
    const [loader, setLoader] = useState(false);

    const onSubmit = (formValues) => {
        setLoader(true);
        instance.post('/admin/organos/eleccion/delegados/salve', formValues).then(res=>{
            let icono = (res.success) ? 'success' : 'error';
            ShowSnackbar(res.message, icono);
            (tipo !== 'I' && res.success) ? setHabilitado(false) : null;
            (tipo === 'I' && res.success) ? reset({codigo: '000', agencia: '', documento: '', primerNombre: '', segundoNombre: '', primerApellido: '', 
                                                   segundoApellido: '', numeroDelegado: '',  correo: '', telefono: '', estado:'1', tipo: tipo  }) : null;
            setLoader(false);
        })
    }

    useEffect(()=>{
        setLoader(true);
        instance.post('/admin/organos/eleccion/delegados/list/datos', {codigo: data?.deleid || '000'}).then(res=>{
            (res.success) ? setAgencias(res.agencias) : ShowSnackbar(res.message, 'error');
            setLoader(false);
        })
    }, []);

    if(loader){
        return <LoaderModal />
    }

    return (
        <form onSubmit={handleSubmit(onSubmit)} >
            <Grid container spacing={2}>

                <Grid size={{ xs: 11, sm: 3 }}>
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
                                {agencias.map(res=>{
                                    return <MenuItem value={res.agenid} key={res.agenid}> {res.agennombre}</MenuItem>
                                })}
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

                <Grid size={{ xs: 12, sm: 3 }}>
                   <TextField
                        label="Primer nombre"
                        fullWidth
                        variant="standard"
                        {...register("primerNombre", {
                                                    onChange: (e) => {
                                                        e.target.value = e.target.value.toUpperCase();
                                                    }
                        })}
                        error={!!errors.primerNombre}
                        helperText={errors.primerNombre?.message}
                        slotProps={{
                                htmlInput: {
                                    autoComplete: "off",
                                    maxLength: 40
                                }
                            }}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 3 }}>
                   <TextField
                        label="Segundo nombre"
                        fullWidth
                        variant="standard"
                        {...register("segundoNombre", {
                                                    onChange: (e) => {
                                                        e.target.value = e.target.value.toUpperCase();
                                                    }
                        })}
                        error={!!errors.segundoNombre}
                        helperText={errors.segundoNombre?.message}
                        slotProps={{
                                htmlInput: {
                                    autoComplete: "off",
                                    maxLength: 40
                                }
                            }}
                    />
                </Grid> 

                <Grid size={{ xs: 12, sm: 3 }}>
                   <TextField
                        label="Primer apellido"
                        fullWidth
                        variant="standard"
                        {...register("primerApellido", {
                                                    onChange: (e) => {
                                                        e.target.value = e.target.value.toUpperCase();
                                                    }
                        })}
                        error={!!errors.primerApellido}
                        helperText={errors.primerApellido?.message}
                        slotProps={{
                                htmlInput: {
                                    autoComplete: "off",
                                    maxLength: 40
                                }
                            }}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 3 }}>
                   <TextField
                        label="Segundo apellido"
                        fullWidth
                        variant="standard"
                        {...register("segundoApellido", {
                                                    onChange: (e) => {
                                                        e.target.value = e.target.value.toUpperCase();
                                                    }
                        })}
                        error={!!errors.segundoApellido}
                        helperText={errors.segundoApellido?.message}
                        slotProps={{
                                htmlInput: {
                                    autoComplete: "off",
                                    maxLength: 40
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

                <Grid size={{ xs: 12, sm: 3 }}>
                   <TextField
                        label="Teléfono celular"
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
                        label="Número de delegado"
                        fullWidth
                        type="number"
                        variant="standard"
                        {...register("numeroDelegado")}
                        error={!!errors.numeroDelegado}
                        helperText={errors.numeroDelegado?.message}
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
                                <MenuItem value={"1"}>Sí</MenuItem>
                                <MenuItem value={"0"}>No</MenuItem>
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