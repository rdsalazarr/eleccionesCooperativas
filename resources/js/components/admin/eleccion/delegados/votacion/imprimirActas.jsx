import {useState, useEffect} from 'react';
import {Card, CardContent, Typography, Grid, Button, Box} from "@mui/material";
import AssignmentTurnedInIcon from '@mui/icons-material/AssignmentTurnedIn';
import DescriptionIcon from '@mui/icons-material/Description';
import {ShowSnackbar} from '../../../../layout/snackBar';
import { ModalDefault } from '../../../../layout/modal';
import {LoaderModal} from "../../../../layout/loader";
import instance from '../../../../layout/instance';
import GenerarActasPdf from './generarActasPdf';

export default function ImprimirActas(){

    const [modal, setModal] = useState({open : false, vista:2, titulo:'', tamano:'bigFlot'});
    const [eleccionId, setEleccionId] = useState(null);
    const [loader, setLoader] = useState(true);
    const [data, setData] = useState([]);

    const cerrarModal = () =>{
        setModal({open : false, vista:2,  titulo:'', tamano:'bigFlot'});
    }

    const modales = [
                        <GenerarActasPdf id={eleccionId} ruta='/admin/eleccion/delegado/imprimir/actas/inicio/PDF' /> ,
                        <GenerarActasPdf id={eleccionId} ruta='/admin/eleccion/delegado/imprimir/actas/cierre/PDF' /> 
                    ];

    const tituloModal = ['Generar acta individual de inicio en formato PDF', 'Generar acta individual de cierre en formato PDF'];

    const abrirModal = ( tipo) =>{
        setModal({open: true, vista: tipo, titulo: tituloModal[tipo], tamano: 'mediumFlotPdf'});
    }

    const inicio = () =>{
        setLoader(true);
        instance.get('/admin/eleccion/delegado/imprimir/actas/list').then(res=>{
            console.log(res);
            (res.success) ? (setData(res.data), setEleccionId(res.data.id)) : ShowSnackbar(res.message, 'error');
            setLoader(false);
        })
    }

    useEffect(()=>{inicio();}, []);

    if(loader){
        return <LoaderModal />
    }

    return (
        <Box className={'containerSmoll'} >
            <Typography component={'h2'} className={'titleGeneral'}>{data.titulo}
            </Typography>

            <Card elevation={0} sx={{border: '1px solid',borderColor: 'divider', borderRadius: 3 }}>
                <CardContent>

                    <Grid container spacing={3}>

                        <Grid size={{ xs: 12, sm: 6 }}>
                            <Button fullWidth className="btnElecciones btnActa"
                                startIcon={<DescriptionIcon />}
                                onClick={() => abrirModal(0)}
                                sx={{ py: 1.5 }} 
                                disabled={!data.habilitarActaInicio}>
                                Acta de inicio
                            </Button>
                        </Grid>


                        <Grid size={{ xs: 12, sm: 6}}>
                            <Button fullWidth className="btnElecciones btnCerrar"
                                startIcon={<AssignmentTurnedInIcon />}
                                onClick={() => abrirModal(1)}
                                sx={{ py: 1.5 }} 
                                disabled={!data.habilitarActaCierre}>
                                Acta de cierre
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