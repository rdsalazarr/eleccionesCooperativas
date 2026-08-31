import {useState, Fragment} from 'react';
import { Button, Grid, MenuItem, Box, TextField } from '@mui/material';
import {Dropzone, ContentFile} from '../../../layout/dropzone';
import {ShowSnackbar} from '../../../layout/snackBar';
import { yupResolver } from "@hookform/resolvers/yup";
import { useForm, Controller } from "react-hook-form";
import {LoaderModal} from "../../../layout/loader";
import instance from '../../../layout/instance';
import SaveAs from '@mui/icons-material/SaveAs';
import Save from '@mui/icons-material/Save';
import * as yup from "yup";

const schema = yup.object({
        nombre:         yup.string().required('El nombre es obligatorio').min(3, 'El nombre debe tener al menos 3 caracteres').max(50, 'El nombre no puede exceder los 50 caracteres'),
        votosPersona:   yup.number().required('El voto por persona es obligatorio').typeError("Debe ser un número").max(99, "Máximo 99"),
        totalPrincipal: yup.number().required('El total principal es obligatorio').typeError("Debe ser un número").max(99, "Máximo 99"),
        totalSuplente:  yup.number().required('El total suplente es obligatorio').typeError("Debe ser un número").max(99, "Máximo 99"),
        estado:         yup.string().required('El estado es obligatorio')
    });

export default function Frm({data, tipo}){

    const { register, handleSubmit, reset, control, formState: { errors } } = useForm({
                resolver: yupResolver(schema),
                defaultValues: tipo !== 'I'
                    ? {codigo: data.tiporgid, nombre: data.tiporgnombre, votosPersona: data.tiporgvotosporpersona, totalPrincipal: data.tiporgtotalprincipales,
                        totalSuplente: data.tiporgtotalsuplente, logo: data.tiporglogo, estado: data.tiporgactivo, tipo: tipo }
                    : {codigo: "000", nombre: '', votosPersona: "", totalPrincipal: '', totalSuplente: "", logo: '', estado: "1", tipo: tipo }
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
        instance.post('/admin/tipo/organo/salve', payload).then(res=>{
            let icono = (res.success) ? 'success' : 'error';
            ShowSnackbar(res.message, icono);
            (tipo !== 'I' && res.success) ? setHabilitado(false) : null;
            (tipo === 'I' && res.success) ? reset({codigo: "000", nombre: '', votosPersona: "", totalPrincipal: '', totalSuplente: "", logo: '', estado: "1", tipo: tipo }) : null;
            (res.success) ? setFormDataFile({ logos: []}) : null;
            setLoader(false);
        })
    }

    if(loader){
        return <LoaderModal />
    }

    return (
        <form onSubmit={handleSubmit(onSubmit)} >
            <Grid container spacing={2}>

                <Grid size={{ xs: 12, sm: 6, md: 3  }}>
                    <TextField
                        label="Nombre"
                        fullWidth
                        variant="standard"
                        {...register("nombre")}
                        error={!!errors.nombre}
                        helperText={errors.nombre?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 6, md: 3 }}>
                    <TextField
                        label="Votos por persona"
                        type="number"
                        fullWidth
                        variant="standard"
                        {...register("votosPersona")}
                        error={!!errors.votosPersona}
                        helperText={errors.votosPersona?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 6, md: 3 }}>
                    <TextField
                        label="Total principal"
                        type="number"
                        fullWidth
                        variant="standard"
                        {...register("totalPrincipal")}
                        error={!!errors.totalPrincipal}
                        helperText={errors.totalPrincipal?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 6, md: 3 }}>
                    <TextField
                        label="Total suplente"
                        type="number"
                        fullWidth
                        variant="standard"
                        {...register("totalSuplente")}
                        error={!!errors.totalSuplente}
                        helperText={errors.totalSuplente?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 6, md: 3 }}>
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

            <Grid container spacing={4} style={{marginTop:'1em', paddingRight: '1em' }}>
                <Grid size={{ xs: 12, sm: 5}}>
                    <Dropzone
                        nombre="logos"
                        accept={['.png']}
                        maxFiles={1}
                        label="Arrastra y suelta o elige el logo en formato png"
                        handleFiles={handleFiles}
                        maxFileSize={1000000}
                    />
                </Grid>

                {rutaLogo !== null ? (
                    <Grid size={{ xs: 6, sm: 2 }} style={{ textAlign: 'center' }}>
                        <Box className='frmTexto'>
                            <label>Logo actual</label>
                            <img
                                src={rutaLogo}
                                alt="Logo"
                                className='imgLogoGeneral'
                            />
                        </Box>
                    </Grid>
                ) : null}

                <Grid size={{ xs: 6, sm: 5 }}>
                    <Box className='filesContainer'>
                        {formDataFile.logos.map((file, a) =>{
                            return <ContentFile file={file} label={"logos"} name={file.name} remove={removeFile} key={'ContentFile-' +a}/>
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