import {useState} from 'react';
import PublicarResultadosJson from '../../../../../../images/json/publicarResultados.json';
import ArrowForwardIosIcon from '@mui/icons-material/ArrowForwardIos';
import {ShowSnackbar} from '../../../../layout/snackBar';
import {LoaderModal} from "../../../../layout/loader";
import instance from '../../../../layout/instance';
import ClearIcon from '@mui/icons-material/Clear';
import {Box, Grid, Button} from "@mui/material";
import { Lottie } from 'lottie-react';

export default function PublicarResultados({id, cerrarModal}){

    const [habilitado, setHabilitado] = useState(true);
    const [loader, setLoader] = useState(false);

    const continuar = () =>{
        setLoader(true);
        instance.post('/admin/eleccion/delegado/procesar/evento', {codigo: id, tipo: 'PUBLICAR'}).then(res=>{
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
            <Grid size={{ xs: 4, sm: 4, md: 2 }}>
                <Box className='animate__animated animate__rotateIn'>
                    <Lottie src={PublicarResultadosJson} autoplay loop />
                </Box>
            </Grid>

            <Grid size={{ xs: 8, sm: 8, md: 8}}>
                <p className='mensajeModal'>
                    ¿Esta seguro que desea publicar los resultados de estas votaciones?
                </p>
            </Grid>

            <Grid size={{ xs: 6}} style={{ marginTop: '-4em'}}>
                <Button onClick={cerrarModal} className='modalBtnRojo floatBtnRojo' disabled={!habilitado}
                    startIcon={<ClearIcon />}> Cancelar
                </Button>
            </Grid>

            <Grid size={{ xs: 6 }} style={{ marginTop: '-4em'}}>
                <Button onClick={continuar} className='modalBtnIconoRight' disabled={!habilitado}
                    endIcon={<ArrowForwardIosIcon />}> Continuar
                </Button>
            </Grid>

        </Grid>
    )
}