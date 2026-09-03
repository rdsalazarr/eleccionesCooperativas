import {useState, useEffect} from 'react';
import { Button, Grid, Box, TextField, MenuItem } from '@mui/material';
import {Dropzone, ContentFile} from '../../../../layout/dropzone';
import {ShowSnackbar} from '../../../../layout/snackBar';
import { yupResolver } from "@hookform/resolvers/yup";
import { useForm, Controller } from "react-hook-form";
import {LoaderModal} from "../../../../layout/loader";
import instance from '../../../../layout/instance';
import SaveAs from '@mui/icons-material/SaveAs';
import Save from '@mui/icons-material/Save';
import * as yup from "yup";

const schema = yup.object({
        tipoIdentificacion:  yup.string().required('Debe seleccionar un tipo de identificación'),
        documento:       yup.string().required("El documento es obligatorio").min(6, "El documento debe tener mínimo 6 caracteres").max(15, "Máximo 15 caracteres"),
        primerNombre:    yup.string().required("El primer nombre es obligatorio").min(3, "El primer nombre debe tener mínimo 3 caracteres").max(40, "Máximo 40 caracteres"),
        segundoNombre:   yup.string().nullable().max(40, "Máximo 40 caracteres"),
        primerApellido:  yup.string().required("El primer apellido es obligatorio").min(3, "El primer apellido debe tener mínimo 3 caracteres").max(40, "Máximo 40 caracteres"),
        segundoApellido: yup.string().nullable().max(40, "Máximo 40 caracteres"),
        correo:          yup.string().required("El campo correo es requerido").email("Debe ser un correo válido").max(80, "Máximo 80 caracteres"),
        celular:         yup.string().nullable().max(20, "Máximo 20 caracteres"),
    });

export default function Frm({data, tipo}){

    const { register, handleSubmit, getValues, setError, clearErrors, reset, control, setValue, formState: { errors } } = useForm({
           resolver: yupResolver(schema),
           defaultValues: tipo !== 'I'
               ? { codigo: data.eldeasid, tipoIdentificacion: data.tipideid, documento: data.eldeasdocumento, primerNombre:data.eldeasprimernombre,
                   segundoNombre:data.eldeassegundonombre, primerApellido:data.eldeasprimerapellido, segundoApellido:data.eldeassegundoapellido, 
                   correo:data.eldeascorreo,  celular:data.eldeastelefono, estado:data.eldeasactivo, tipo: tipo }
               : { codigo: '000', tipoIdentificacion: '', documento: '', primerNombre: '', segundoNombre: '', primerApellido: '', 
                    segundoApellido: '', correo: '', celular: '', estado:'1', tipo: tipo }
       });
    
    const [tipoIdentificaciones, setTipoIdentificaciones] = useState([]);
    const [formDataFile, setFormDataFile] = useState({ fotos: []});
    const rutaFoto  = ( tipo !== 'I') ? data.rutaFoto : null;
    const [habilitado, setHabilitado] = useState(true);
    const [loader, setLoader] = useState(false);

    const handleFiles = (nombre, files) => {
        setFormDataFile((prev) => ({
            ...prev,
            [nombre]: [...prev[nombre], ...files],
        }));
    }

    const removeFile = (nombre, fileName) => {
        setFormDataFile((prev) => ({
            ...prev,
            [nombre]: prev[nombre].filter(file => file.name !== fileName),
        }));
    }

    const onSubmit = (formValues) => {
        const payload = {
            ...formValues,
            foto: formDataFile.fotos.length > 0 ? formDataFile.fotos[0].file : null,
        };

        //setLoader(true);
        instance.post('/admin/eleccion/delegado/registrar/aspirante/salve', payload).then(res=>{
            let icono = (res.success) ? 'success' : 'error';
            ShowSnackbar(res.message, icono);
            (tipo !== 'I' && res.success) ? setHabilitado(false) : null;
            (tipo === 'I' && res.success) ? reset({codigo: '000', tipoIdentificacion: '', documento: '', primerNombre: '', segundoNombre: '', primerApellido: '', 
                                                    segundoApellido: '', correo: '', celular: '', estado:'1', tipo: tipo  }) : null;
            (res.success) ? setFormDataFile({ fotos: []}) : null;
            setLoader(false);
        })
    }

    useEffect(()=>{
        setLoader(true);
        instance.post('/admin/eleccion/delegado/registrar/aspirante/list/datos', {codigo: data?.eldeasid || '000', tipo:tipo}).then(res=>{
            (res.success) ? setTipoIdentificaciones(res.tipoIdentificaciones) : ShowSnackbar(res.message, 'error');
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
                                {tipoIdentificaciones.map(res=>{
                                    return <MenuItem value={res.tipideid} key={res.tipideid}> {res.tipidenombre}</MenuItem>
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
                        {...register("primerNombre")}
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
                        {...register("segundoNombre")}
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
                        {...register("primerApellido")}
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

                <Grid size={{ xs: 12, sm: 2 }}>
                   <TextField
                        label="Segundo apellido"
                        fullWidth
                        variant="standard"
                        {...register("segundoApellido")}
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

                <Grid size={{ xs: 12, sm: 2 }}>
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
                                <MenuItem value={"1"}>Sí</MenuItem>
                                <MenuItem value={"0"}>No</MenuItem>
                            </TextField> 
                        )}
                    />
                </Grid>

            </Grid>
   
            <Grid container spacing={4} style={{marginTop:'1em', paddingRight: '1em' }}>
                <Grid size={{ xs: 12, sm: 5}}>
                    <Dropzone
                        nombre="fotos"
                        accept={['.png','.jpg']}
                        maxFiles={1}
                        label="Arrastra y suelta o elige el foto en formato png ó jpg"
                        handleFiles={handleFiles}
                        maxFileSize={1000000}
                        currentFiles={formDataFile.fotos}
                    />
                </Grid>

                {rutaFoto !== null ? (
                    <Grid size={{ xs: 6, sm: 2 }} style={{ textAlign: 'center' }}>
                        <Box className='frmTexto'>
                            <label>Foto actual</label>
                            <img
                                src={rutaFoto}
                                alt="Foto"
                                className='imgLogoGeneral'
                            />
                        </Box>
                    </Grid>
                ) : null}

                <Grid size={{ xs: 6, sm: 5 }}>
                    <Box className='filesContainer'>
                        {formDataFile.fotos.map((file, a) =>{
                            return <ContentFile file={file} label={"fotos"} name={file.name} remove={removeFile} key={'ContentFile-' +a}/>
                        })}
                    </Box>
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