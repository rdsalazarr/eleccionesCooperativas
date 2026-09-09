import {useState, useEffect} from 'react';
import { Box, Card, Typography, Grid, Button} from '@mui/material';
import TablaGeneral from '../../../../layout/tablaGeneral';
import HowToVoteIcon from '@mui/icons-material/HowToVote';
import {ShowSnackbar} from '../../../../layout/snackBar';
import { ModalDefault } from '../../../../layout/modal';
import {LoaderModal} from "../../../../layout/loader";
import instance from '../../../../layout/instance';
import VisualizarPdf from '../../visualizarPdf';
import GenerarBoletin from './generarBoletin';

export default function BoletinVotacion(){

    const [modal, setModal] = useState({open : false, vista:2, data:{}, titulo:'', tamano:'bigFlot'});
    const [habilitarBoton, setHabilitarBoton] = useState(false);
    const [ocultarBoton, setOcultarBoton] = useState(false);
    const [loader, setLoader] = useState(true);
    const [titulo, setTitulo] = useState('');
    const [data, setData] = useState([]);

    const cerrarModal = () =>{
        setModal({open : false, vista:2, data:{}, titulo:'', tamano:'bigFlot'});
    }

    const modales     = [   <VisualizarPdf id={modal?.data?.eldeboid || null} ruta='/admin/eleccion/delegado/boletin/imprimir/PDF' />,
                            <GenerarBoletin id={modal?.data?.eldeboid || null} cerrarModal={cerrarModal} />
                        ];

    const tituloModal = ['Informe generado en formato PDF'];

    const edit = (data, tipo) =>{
        setModal({open: true, vista: tipo, data:data, titulo: tituloModal[tipo], tamano: (tipo === 1 ) ? 'smallFlot' : 'mediumFlotPdf'});
    }

    const inicio = () =>{
        setLoader(true);
        instance.get('/admin/eleccion/delegado/boletin/list').then(res=>{
            (res.success) ? (setData(res.data),
                             setTitulo(res.titulo),
                             setHabilitarBoton(res.habilitarBoton),
                             setOcultarBoton(res.ocultarBoton)) 
                          : ShowSnackbar(res.message, 'error');
            setLoader(false);
        })
    }

    useEffect(()=>{inicio();}, []);

    if(loader){
        return <LoaderModal />
    }

    return (
        <Box className={'containerMedium'}>
            <Box>
                <Typography component={'h2'} className={'titleGeneral'}>{titulo}</Typography>
            </Box>

            <Card className={'cardContainer'}>

                {(!ocultarBoton) ?
                    <Grid container spacing={1.5}>
                        <Grid size={{ xs: 12, sm: 6, md: 2.4 }} style={{marginBottom:'1em'}}>
                            <Button fullWidth className="btnElecciones btnAbrir"
                                startIcon={<HowToVoteIcon />}
                                onClick={() => edit({}, 1)}
                                sx={{ py: 1.5 }}
                                disabled={!habilitarBoton}>
                                Generar Boletín
                            </Button>
                        </Grid>
                    </Grid>
                : null }

                <Box sx={{maxHeight: '35em', overflow:'auto'}} sm={{maxHeight: '35em', overflow:'auto'}}>
                    <TablaGeneral
                        datos={data}
                        titulo={['Fecha y hora','Número','Total votos','Usuario','PDF']}
                        ver={["eldebofechahora","numeroBoletin","eldebototalvotos","usuario"]}
                        accion={[{tipo: 'B', icono : 'picture_as_pdf', color: 'orange', funcion : (data)=>{edit(data, 0)} },]}
                        funciones={{orderBy: false, search: false, pagination: true}}
                    />
                </Box>

                <ModalDefault
                    title   = {modal.titulo}
                    content = {modales[modal.vista]}
                    close   = {() =>{cerrarModal(), (modal.vista === 1 ) ? inicio() : null;}}
                    tam     = {modal.tamano}
                    abrir   = {modal.open}
                />
            </Card>
        </Box>
    )
}