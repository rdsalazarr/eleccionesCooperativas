import {useState, useEffect, useRef} from 'react';
import { Button, Grid, MenuItem, Box, TextField } from '@mui/material';
import { ShowSnackbar } from '../../../../layout/snackBar';
import { LoaderModal } from "../../../../layout/loader";
import { useForm, Controller } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";
import instance from '../../../../layout/instance';
import { Editor } from '@tinymce/tinymce-react';
import SaveAs from '@mui/icons-material/SaveAs';
import Save from '@mui/icons-material/Save';
import * as yup from "yup";

const schema = yup.object({
    nombre:    yup.string().required("El nombre es obligatorio").max(50, 'El nombre no puede exceder los 50 caracteres'),
    asunto:    yup.string().required("El asunto es obligatorio").max(120, 'El asunto no puede exceder los 120 caracteres'),
    piePagina: yup.string().required("Campo obligatorio"),
    copia:     yup.string().required("Campo obligatorio"),
    contenido: yup.string().required("Debe ingresar el contenido")
});

export default function Frm({ data, tipo }) {

    const editorRef = useRef(null);  

    const {register, handleSubmit, reset, control, formState: { errors }
            } = useForm({
                resolver: yupResolver(schema),
                defaultValues: tipo !== 'I'
                    ? { codigo:    data.innocoid,        nombre: data.innoconombre,             asunto: data.innocoasunto,
                        contenido: data.innococontenido, piePagina: data.innocoenviarpiepagina, copia: data.innocoenviarcopia, tipo: tipo
                    }
                    : {codigo: '000', nombre: '', asunto: '', contenido: '', piePagina: '1',copia: '0',tipo: tipo
                    }
            });

    const [habilitado, setHabilitado] = useState(true);
    const [loader, setLoader] = useState(true);

    const onSubmit = (formValues) => {

        const contenido = editorRef.current?.getContent();
        if (!contenido) {
            ShowSnackbar("Debe ingresar el contenido del documento", 'error');
            return;
        }

        const payload = {
            ...formValues,
            contenido: contenido
        };

        setLoader(true);
        instance.post('/admin/notificacion/correo/salve', payload).then(res => {
            let icono = res.success ? 'success' : 'error';
            ShowSnackbar(res.message, icono);
            (tipo !== 'I' && res.success) ? setHabilitado(false) : null; 
            (tipo === 'I' && res.success) ? reset({codigo: '000', nombre: '', asunto: '', contenido: '', piePagina: '1', copia: '0', tipo: tipo }) : null;
            setLoader(false);
        });
    };

    useEffect(() => {
        const timer = setTimeout(() => {
            setLoader(false);
        }, 300);

        return () => clearTimeout(timer);
    }, []);

    if (loader) {
        return <LoaderModal />;
    }

    return (
        <form onSubmit={handleSubmit(onSubmit)}>

            <Grid container spacing={2}>

                <Grid size={{ xs: 12, sm: 6, md: 4 }}>
                    <TextField
                        label="Nombre"
                        fullWidth
                        variant="standard"
                        {...register("nombre")}
                        error={!!errors.nombre}
                        helperText={errors.nombre?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 6, md: 4 }}>
                    <TextField
                        label="Asunto"
                        fullWidth
                        variant="standard"
                        {...register("asunto")}
                        error={!!errors.asunto}
                        helperText={errors.asunto?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 6, md: 2 }}>
                    <Controller
                        name="piePagina"
                        control={control}
                        render={({ field }) => (
                            <TextField
                                select
                                label="Pie página"
                                fullWidth
                                variant="standard"
                                {...field}
                                error={!!errors.piePagina}
                                helperText={errors.piePagina?.message}
                            >
                                <MenuItem value="">Seleccione</MenuItem>
                                <MenuItem value="1">Sí</MenuItem>
                                <MenuItem value="0">No</MenuItem>
                            </TextField>
                        )}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 6, md: 2 }}>
                    <Controller
                        name="copia"
                        control={control}
                        render={({ field }) => (
                            <TextField
                                select
                                label="Enviar copia"
                                fullWidth
                                variant="standard"
                                {...field}
                                error={!!errors.copia}
                                helperText={errors.copia?.message}
                            >
                                <MenuItem value="">Seleccione</MenuItem>
                                <MenuItem value="1">Sí</MenuItem>
                                <MenuItem value="0">No</MenuItem>
                            </TextField>
                        )}
                    />
                </Grid>

                <Grid size={{ xs: 12 }}>
                    <label className={'labelEditor'}>Contenido</label>

                    <Controller
                        name="contenido"
                        control={control}
                        render={({ field }) => (
                            <Editor
                                onInit={(evt, editor) => {
                                    editorRef.current = editor;
                                }}
                                value={field.value}
                                onEditorChange={(content) => {
                                    field.onChange(content);
                                }}
                                init={{
                                    language: 'es',
                                    height:   600,
                                    menubar: false,
                                    license_key: 'gpl',
                                    object_resizing : true,
                                    browser_spellcheck: true,
                                    spellchecker_language: 'es',
                                    spellchecker_wordchar_pattern: /[^\s,\.]+/g ,
                                    plugins: 'advlist autolink lists link image charmap preview anchor searchreplace visualblocks code fullscreen insertdatetime media table wordcount',
                                    toolbar: 'undo redo | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist | link | table'
                                }}
                            />
                        )}
                    />

                    {errors.contenido && (
                        <span style={{ color: 'red' }}>
                            {errors.contenido.message}
                        </span>
                    )}
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