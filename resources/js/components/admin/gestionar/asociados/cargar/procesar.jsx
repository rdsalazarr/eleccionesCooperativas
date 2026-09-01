import {useState} from 'react';
import procesandoRegistroJson from '../../../../../../images/json/procesando.json';
import {ShowSnackbar} from '../../../../layout/snackBar';
import DoneAllIcon from '@mui/icons-material/DoneAll';
import {LoaderModal} from "../../../../layout/loader";
import instance from '../../../../layout/instance';
import ClearIcon from '@mui/icons-material/Clear';
import {Box, Grid, Button} from "@mui/material";
import { Lottie } from 'lottie-react';

export default function Procesar({cerrarModal}){

    const [habilitado, setHabilitado] = useState(true);
    const [loader, setLoader] = useState(false);

    const continuar = () =>{
        //setLoader(true);
        instance.post('/admin/cargar/asociados/procesar').then(res=>{
            let icono = (res.success) ? 'success' : 'error';
            ShowSnackbar(res.message, icono);
            (res.success) ? setHabilitado(false) : null;
            setLoader(false);
        })
    }

    if(loader){
        return <LoaderModal />
    }

    return (
        <Grid container spacing={2}>
            <Grid size={{ xs: 4, sm: 4, md: 3 }} >
                <Box className='animate__animated animate__rotateIn'>
                    <Lottie src={procesandoRegistroJson} autoplay loop />
                </Box>
            </Grid>

            <Grid size={{ xs: 8, sm: 8, md: 9}}>
                <p className='mensajeModal'>
                    ¿Estás seguro que deseas procesar la lista de estos asociados?
                </p>
            </Grid>

            <Grid size={{ xs: 6}} style={{ marginTop: '-2em'}}>
                <Button onClick={cerrarModal} className='modalBtnRojo floatBtnRojo' disabled={!habilitado}
                    startIcon={<ClearIcon />}> Cancelar
                </Button>
            </Grid>

            <Grid size={{ xs: 6 }} style={{ marginTop: '-2em'}}>
                <Button onClick={continuar} className='modalBtnIconoRight' disabled={!habilitado}
                    endIcon={<DoneAllIcon />}> Aceptar
                </Button>
            </Grid>

        </Grid>
    )
}