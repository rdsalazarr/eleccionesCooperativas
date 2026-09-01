import {useState} from 'react';
import {Dropzone, ContentFile} from '../../../../layout/dropzone';
import {ShowSnackbar} from '../../../../layout/snackBar';
import {LoaderModal} from "../../../../layout/loader";
import instance from '../../../../layout/instance';
import { Button, Grid, Box } from '@mui/material';
import Save from '@mui/icons-material/Save';
import { useForm} from "react-hook-form";

export default function CargarAsociado(){

    const { handleSubmit, reset, formState: { errors } } = useForm({
                defaultValues: {codigo: "000"}
            });

    const [formDataFile, setFormDataFile] = useState({ archivos: []});
    const [habilitado, setHabilitado] = useState(true);
    const [loader, setLoader] = useState(false);
    const fecha = new Date();
    const fechaActual = `${String(fecha.getDate()).padStart(2, '0')}/${String(
                                fecha.getMonth() + 1
                            ).padStart(2, '0')}/${fecha.getFullYear()}`;

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
        if(formDataFile.archivos.length === 0){
            ShowSnackbar("Debe seleccionar el archivo en los formato válido", 'error');
            return;
        }

        const payload = {
            ...formValues,
            archivo:    formDataFile.archivos.length > 0 ? formDataFile.archivos[0].file : null,
        };

        setLoader(true); 
        instance.post('/admin/cargar/asociados/salve', payload).then(res=>{
            let icono = (res.success) ? 'success' : 'error';
            ShowSnackbar(res.message, icono);
            (res.success) ? setHabilitado(false) : null;
            (res.success) ? reset({codigo: "000"}) : null;
            (res.success) ? setFormDataFile({ archivos: []}) : null;
            setLoader(false);
        })
    }

    if(loader){
        return <LoaderModal />
    }

    return (
        <form onSubmit={handleSubmit(onSubmit)} >
            <Grid container spacing={4} >
                <Grid size={{ xs: 12}}>
                <p>Para subir masivamente los Asociados debe tener en cuenta lo siguiente:</p>
                <ul>
                    <li>Debe ser un archivo en Excel o en formato .CSV o .XLS </li>
                    <li>La estructura del archivo debe contener el orden siguiente: Agencia, Tipo de identificación, Número de identificación, Nombre completo, Fecha de nacimiento, Fecha de expedición de documento, Email, Teléfono, Celular</li>
                    <li>El formato de la fecha debe ser ({fechaActual})</li>
                    <li>No tiene que llevar encabezado</li>
                </ul>
                </Grid>
                	
                <Grid size={{ xs: 12, sm: 5}}>
                    <Dropzone
                        nombre="archivos"
                        accept={['.csv','.xls','.xlsx']}
                        maxFiles={1}
                        label="Arrastra y suelta o elige el archivo en formato csv o xls"
                        handleFiles={handleFiles}
                        maxFileSize={2000000}
                    />
                </Grid>

                <Grid size={{ xs: 6, sm: 5 }}>
                    <Box className='filesContainer'>
                        {formDataFile.archivos.map((file, a) =>{
                            return <ContentFile file={file} label={"archivos"} name={file.name} remove={removeFile} key={'ContentFile-' +a}/>
                        })}
                    </Box>
                </Grid>
            </Grid>

            <Box className={'botonesModal'}>
                <Button type="submit" className={'modalBtn'} disabled={!habilitado} startIcon={<Save /> } >
                    {"Guardar"}
                </Button>
            </Box>
        </form>
    )
}