import {useState, useEffect} from 'react';
import {Card, CardContent, Typography, Grid, Button, Box} from "@mui/material";
import AssignmentTurnedInIcon from '@mui/icons-material/AssignmentTurnedIn';
import DescriptionIcon from '@mui/icons-material/Description';
import {ShowSnackbar} from '../../../../layout/snackBar';
import { ModalDefault } from '../../../../layout/modal';
import CampaignIcon from '@mui/icons-material/Campaign';
import LockOpenIcon from '@mui/icons-material/LockOpen';
import {LoaderModal} from "../../../../layout/loader";
import PublicarResultados from './publicarResultados';
import instance from '../../../../layout/instance';
import CerrarElecciones from './cerrarElecciones';
import GenerarActasPdf from './generarActasPdf';
import LockIcon from '@mui/icons-material/Lock';
import OpenElecciones from './openElecciones';

export default function AbrirVotacion(){

    const [modal, setModal] = useState({open : false, vista:5, titulo:'', tamano:'bigFlot'});
    const [loader, setLoader] = useState(true);
    const [data, setData] = useState([]);

    const cerrarModal = () =>{
        setModal({open : false, vista:5,  titulo:'', tamano:'bigFlot'});
    }

    const modales = [
                        <OpenElecciones cerrarModal={cerrarModal} />,
                        <GenerarActasPdf url='/admin/eleccion/delegado/generar/acta/inicio/PDF' cerrarModal={cerrarModal} /> ,
                        <CerrarElecciones cerrarModal={cerrarModal} />,
                        <GenerarActasPdf url='/admin/eleccion/delegado/generar/acta/cierre/PDF' cerrarModal={cerrarModal} /> ,
                        <PublicarResultados cerrarModal={cerrarModal} />
                    ];

    const tituloModal = ['','Generar acta de inicio en formato PDF','', 'Generar acta de cierre en formato PDF'];

    const abrirModal = ( tipo) =>{
        setModal({open: true, vista: tipo, titulo: tituloModal[tipo], tamano: (tipo === 1 || tipo === 3) ? 'mediumFlotPdf': 'smallFlot'});
    }

    const inicio = () =>{
        setLoader(true);
        instance.get('/admin/eleccion/delegado/abrir/votacion/list').then(res=>{
            (res.success) ? setData(res.data) : ShowSnackbar(res.message, 'error');
            setLoader(false);
        })
    }

    useEffect(()=>{inicio();}, []);

    if(loader){
        return <LoaderModal />
    }

    return (
        <Box >
            <Typography component={'h2'} className={'titleGeneral'}>{data.titulo}
	        </Typography>
            <Grid container justifyContent="center">
                <Grid size={{ xs: 12 }}>
                    <Card elevation={0} sx={{border: '1px solid',borderColor: 'divider', borderRadius: 3 }}>
                        <CardContent>

                            <Grid container spacing={1.5}>
                                <Grid size={{ xs: 12, sm: 6, md: 2.4 }}>
                                    <Button fullWidth className="btnElecciones btnAbrir"
                                        startIcon={<LockOpenIcon />}
                                        onClick={() => abrirModal(0)}
                                        sx={{ py: 1.5 }}
                                        disabled={!data.habilitarAbrirEleccion}>
                                        Abrir elección
                                    </Button>
                                </Grid>

                                <Grid size={{ xs: 12, sm: 6, md: 2.4 }}>
                                    <Button fullWidth className="btnElecciones btnActa"
                                        startIcon={<DescriptionIcon />}
                                        onClick={() => abrirModal(1)}
                                        sx={{ py: 1.5 }} 
                                        disabled={!data.habilitarActaInicio}>
                                        Acta de inicio
                                    </Button>
                                </Grid>

                                <Grid size={{ xs: 12, sm: 6, md: 2.4 }}>
                                    <Button fullWidth className="btnElecciones btnCerrar"
                                        startIcon={<LockIcon />}
                                        onClick={() => abrirModal(2)}
                                        sx={{ py: 1.5 }} 
                                        disabled={!data.habilitarCerrarEleccion}>
                                        Cerrar elección
                                    </Button>
                                </Grid>

                                <Grid size={{ xs: 12, sm: 6, md: 2.4 }}>
                                    <Button fullWidth className="btnElecciones btnActa"
                                        startIcon={<AssignmentTurnedInIcon />}
                                        onClick={() => abrirModal(3)}
                                        sx={{ py: 1.5 }} 
                                        disabled={!data.habilitarActaCierre}>
                                        Acta de cierre
                                    </Button>
                                </Grid>

                                <Grid size={{ xs: 12, sm: 6, md: 2.4 }}>
                                    <Button fullWidth className="btnElecciones btnPublicar"
                                        startIcon={<CampaignIcon />}
                                        onClick={() => abrirModal(4)}
                                        sx={{ py: 1.5 }} 
                                        disabled={!data.habilitarPublicarResultados}>
                                        Publicar resultados
                                    </Button>
                                </Grid>

                            </Grid>
                        </CardContent>
                    </Card>
                </Grid>
            </Grid>

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