import {useState, useEffect} from 'react';
import {Card, CardContent, Typography, Grid, Button, Box} from "@mui/material";
import PictureAsPdfIcon from '@mui/icons-material/PictureAsPdf';
import { ModalDefault } from '../../../../layout/modal';
import {LoaderModal} from "../../../../layout/loader";
import TokenIcon from '@mui/icons-material/Token';
import VisualizarPdf from '../../visualizarPdf';
import GenerarToken from './generarToken';

export default function List(){

    const [modal, setModal] = useState({open : false, vista:2, titulo:'', tamano:'bigFlot'});
    const [loader, setLoader] = useState(true);

    const cerrarModal = () =>{
        setModal({open : false, vista:2,  titulo:'', tamano:'bigFlot'});
    }

    const modales = [
                        <GenerarToken cerrarModal={cerrarModal} />,
                        <VisualizarPdf id={''} ruta='/admin/organos/eleccion/imprimir/token/PDF' />
                    ];

    const tituloModal = ['', 'Generar token de delegados activos en formato PDF'];

    const abrirModal = (tipo) =>{
        setModal({open: true, vista: tipo, titulo: tituloModal[tipo], tamano: tipo === 0 ? 'smallFlot' : 'mediumFlotPdf'});
    }

    useEffect(() => {
        const timer = setTimeout(() => {
            setLoader(false);
        }, 300);

        return () => clearTimeout(timer);
    }, []);

    if(loader){
        return <LoaderModal />
    }

    return (
        <Box className={'containerSmoll'} >
            <Typography component={'h2'} className={'titleGeneral'}>Generar token
            </Typography>

            <Card elevation={0} sx={{border: '1px solid',borderColor: 'divider', borderRadius: 3 }}>
                <CardContent>
                    <p>Recuerde que solo se genera token para aquellos delegados que se encuentran activos.</p>
                    <Grid container spacing={3}>
                        <Grid size={{ xs: 12, sm: 6 }}>
                            <Button fullWidth className="btnElecciones btnActa"
                                startIcon={<TokenIcon />}
                                onClick={() => abrirModal(0)}
                                sx={{ py: 1.5 }}>
                                Generar token
                            </Button>
                        </Grid>

                        <Grid size={{ xs: 12, sm: 6}}>
                            <Button fullWidth className="btnElecciones btnCerrar"
                                startIcon={<PictureAsPdfIcon />}
                                onClick={() => abrirModal(1)}
                                sx={{ py: 1.5 }}>
                               Imprimir token
                            </Button>
                        </Grid>

                    </Grid>
                </CardContent>
            </Card>

            <ModalDefault
                title   = {modal.titulo}
                content = {modales[modal.vista]}
                close   = {() =>{cerrarModal()}}
                tam     = {modal.tamano}
                abrir   = {modal.open}
            />
        </Box>
    )
}