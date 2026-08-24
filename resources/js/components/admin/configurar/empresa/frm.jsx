import {useState, useEffect, Fragment} from 'react';
import {Dropzone, ContentFile} from '../../../layout/dropzone';
import { Button, Grid, Box, TextField } from '@mui/material';
import {ShowSnackbar} from '../../../layout/snackBar';
import { yupResolver } from "@hookform/resolvers/yup";
import {LoaderModal} from "../../../layout/loader";
import instance from '../../../layout/instance';
import SaveAs from '@mui/icons-material/SaveAs';
import Save from '@mui/icons-material/Save';
import { useForm } from "react-hook-form";
import * as yup from "yup";

const schema = yup.object({
        nit:       yup.string().required("El nit es obligatorio"),
        nombre:    yup.string().required("El nombre es obligatorio").min(4, "Debe tener mínimo 4 caracteres").max(100, "Máximo 100 caracteres"),
        sigla:     yup.string().nullable().max(20, 'La sigla no puede exceder los 20 caracteres'),
        lema:      yup.string().nullable().max(100, 'El lema no puede exceder los 100 caracteres'),
        ciudad:    yup.string().required("La ciudad es obligatoria").max(100, 'La ciudad no puede exceder los 100 caracteres'),
        direccion: yup.string().nullable().max(80, 'La dirección no puede exceder los 80 caracteres'),
        correo:    yup.string().nullable().email('el correo no tiene una estrúctura válida'),
        telefono:  yup.number().nullable().typeError("Debe ser un número"),
        celular:   yup.number().nullable().typeError("Debe ser un número"),
        url:       yup.string().nullable(),  
    });

export default function Frm({data, tipo}){

    const { register, handleSubmit, reset, formState: { errors } } = useForm({
                resolver: yupResolver(schema),
                defaultValues: tipo !== 'I'
                    ? { codigo: data.emprid, nit: data.emprnit, nombre: data.emprnombre, sigla: data.emprsigla, 
                        lema: data.emprlema, direccion: data.emprdireccion, ciudad: data.emprciudad, telefono: data.emprtelefonofijo, celular: data.emprtelefonocelular, 
                        correo: data.emprcorreo, url: data.emprurl, tipo: tipo }
                    : {codigo: "000", nit: "", nombre: "", sigla: "",  lema: "", direccion: "", ciudad: "",
                        telefono: "", celular: "", correo: "", url: "", tipo: tipo }
            });

    const [formDataFile, setFormDataFile] = useState({ logos: []});
    const rutaLogo  = ( tipo !== 'I') ? data.rutaLogo : null;
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
            logo:    formDataFile.logos.length > 0 ? formDataFile.logos[0].file : null,
        };

        setLoader(true);
        instance.post('/admin/empresa/salve', payload).then(res => {
            let icono = res.success ? 'success' : 'error';
            ShowSnackbar(res.message, icono);
            (tipo === 'I' && res.success) ? reset({codigo: "000", nit: "", nombre: "", sigla: "",  lema: "", direccion: "", ciudad: "",
                                                telefono: "", celular: "", correo: "", url: "",  tipo: tipo }) : null;
            (tipo !== 'I' && res.success) ? setHabilitado(false) : null;  
            setLoader(false);
        });
    };

    if(loader){
        return <LoaderModal />
    }

    return (
        <form onSubmit={handleSubmit(onSubmit)}>
            <Grid container spacing={2}>
                <Grid size={{ xs: 12, sm: 3}}>
                    <TextField
                        label="NIT"
                        fullWidth
                        variant="standard"
                        {...register("nit")}
                        error={!!errors.nit}
                        helperText={errors.nit?.message}
                    />
                </Grid>
 
                <Grid size={{ xs: 12, sm: 6}}>
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

               <Grid size={{ xs: 12, sm: 3}}>
                    <TextField
                        label="Sigla"
                        fullWidth
                        variant="standard"
                        {...register("sigla")}
                        error={!!errors.sigla}
                        helperText={errors.sigla?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 6}}>
                   <TextField
                        label="Lema"
                        fullWidth
                        variant="standard"
                        {...register("lema")}
                        error={!!errors.lema}
                        helperText={errors.lema?.message}
                        slotProps={{
                                htmlInput: {
                                    autoComplete: "off",
                                    maxLength: 100
                                }
                            }}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 3 }}>
                    <TextField
                        label="Ciudad"
                        fullWidth
                        variant="standard"
                        {...register("ciudad")}
                        error={!!errors.ciudad}
                        helperText={errors.ciudad?.message}
                    />
                </Grid> 

                <Grid size={{ xs: 12, sm: 3 }}>
                    <TextField
                        label="Dirección"
                        fullWidth
                        variant="standard"
                        {...register("direccion")}
                        error={!!errors.direccion}
                        helperText={errors.direccion?.message}
                    />
                </Grid> 

                <Grid size={{ xs: 12, sm: 3 }}>
                    <TextField
                        label="Teléfono"
                        type="number"
                        fullWidth
                        variant="standard"
                        {...register("telefono")}
                        error={!!errors.telefono}
                        helperText={errors.telefono?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 3 }}>
                    <TextField
                        label="Celular"
                        type="number"
                        fullWidth
                        variant="standard"
                        {...register("celular")}
                        error={!!errors.celular}
                        helperText={errors.celular?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 3 }}>
                    <TextField
                        label="Correo"
                        type="mail"
                        fullWidth
                        variant="standard"
                        {...register("correo")}
                        error={!!errors.correo}
                        helperText={errors.correo?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 3 }}>
                    <TextField
                        label="URL"
                        fullWidth
                        variant="standard"
                        {...register("url")}
                        error={!!errors.url}
                        helperText={errors.url?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 12, md: 6}}>
                    <Dropzone
                        nombre="logos"
                        accept={['.png']}
                        maxFiles={1}
                        label="Arrastra y suelta o elige el logo de la empresa en formato png"
                        handleFiles={handleFiles}
                        maxFileSize={1000000}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 12, md: 6 }}>
                    <Box className='filesContainer'>
                        {formDataFile.logos.map((file, a) =>{
                            return <ContentFile file={file} label={"logos"} name={file.name} remove={removeFile} key={'ContentFile-' +a}/>
                        })}
                    </Box>
                </Grid>

                {rutaLogo !== null ? (
                    <Fragment>
                        <Grid size={{ xs: 10, sm: 3 }} style={{ textAlign: 'center' }}>
                            <Box className='frmTexto'>
                                <label>Logo institución</label>
                                <img
                                    src={rutaLogo}
                                    alt="Logo"
                                    className='imgLogoInstitucion'
                                />
                            </Box>
                        </Grid>

                        <Grid size={{ xs: 2, sm: 9 }} style={{ textAlign: 'center' }}>
                        </Grid>
                    </Fragment>
                ) : null}

            </Grid>

            <Box className={'botonesModal'}>
                <Button type="submit" className={'modalBtn'} disabled={!habilitado} startIcon={(tipo === 'I') ? <Save /> : <SaveAs />} >
                    {(tipo === 'I') ? "Guardar" : "Actualizar"}
                </Button>
            </Box>
        </form>
    );
}