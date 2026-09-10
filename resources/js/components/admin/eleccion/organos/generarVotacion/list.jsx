import {useState, useEffect} from 'react';
import { Box, Card, Typography, Grid, Button, Table, TableHead, TableBody, TableRow, TableCell } from '@mui/material';
import FormatListBulletedIcon from '@mui/icons-material/FormatListBulleted';
import LibraryBooksIcon from '@mui/icons-material/LibraryBooks';
import PictureAsPdfIcon from '@mui/icons-material/PictureAsPdf';
import DescriptionIcon from '@mui/icons-material/Description';
import {ShowSnackbar} from '../../../../layout/snackBar';
import { ModalDefault } from '../../../../layout/modal';
import LockOpenIcon from '@mui/icons-material/LockOpen';
import MenuBookIcon from '@mui/icons-material/MenuBook';
import {LoaderModal} from "../../../../layout/loader";
import instance from '../../../../layout/instance';
import CerrarElecciones from './cerrarElecciones';
import AbrirElecciones from './abrirElecciones';
import LockIcon from '@mui/icons-material/Lock';
import VisualizarPdf from '../../visualizarPdf'

export default function List(){

    const [modal, setModal] = useState({open : false, vista:7, data:{}, titulo:'', tamano:'bigFlot'});
    const [loader, setLoader] = useState(true);
    const [titulo, setTitulo] = useState('');
    const [data, setData] = useState([]);

    const cerrarModal = () =>{
        setModal({open : false, vista:7, data:{}, titulo:'', tamano:'bigFlot'});
    }

    const modales = [
                        <VisualizarPdf id={modal?.data?.tiporgid || null} ruta='/admin/organos/eleccion/generar/votacion/imprimir/lista/PDF' /> ,
                        <AbrirElecciones id={modal?.data?.oreltoid || null} cerrarModal={cerrarModal} />,
                        <VisualizarPdf id={modal?.data?.tiporgid || null} ruta='/admin/organos/eleccion/generar/votacion/acta/apertura/PDF' /> ,
                        <CerrarElecciones id={modal?.data?.oreltoid || null} cerrarModal={cerrarModal} />,
                        <VisualizarPdf id={modal?.data?.tiporgid || null} ruta='/admin/organos/eleccion/generar/votacion/lista/resultado/PDF' /> ,
                        <VisualizarPdf id={modal?.data?.tiporgid || null} ruta='/admin/organos/eleccion/generar/votacion/acta/escrutinio/PDF' /> ,
                        <VisualizarPdf id={modal?.data?.tiporgid || null} ruta='/admin/organos/eleccion/generar/votacion/acta/resultado/PDF' /> ,
                    ];

    const tituloModal = ['Generar lista en formato PDF de los delegados aspirantes al órgano de control','','Generar acta de apertura en formato PDF','',
                         'Generar lista de resultados en formato PDF', 'Generar acta de escrutinio en formato PDF', 'Generar acta de resultado en formato PDF' 
                        ];

    const abrirModal = (data, tipo) =>{
        setModal({open: true, vista: tipo, data:data, titulo: tituloModal[tipo], tamano: [1, 3].includes(tipo) ? 'smallFlot' : 'mediumFlotPdf'});
    }

    const inicio = () =>{
        setLoader(true);
        instance.get('/admin/organos/eleccion/generar/votacion/list').then(res=>{
            (res.success) ? (setData(res.data), setTitulo(res.titulo) ) : ShowSnackbar(res.message, 'error');
            setLoader(false);
        })
    }

    useEffect(()=>{inicio();}, []);

    if(loader){
        return <LoaderModal />
    }

    return (
        <Box >
            <Box>
                <Typography component={'h2'} className={'titleGeneral'}>{titulo}</Typography>
            </Box>
            <Card className={'cardContainer'}>
                <Box sx={{maxHeight: '35em', overflow:'auto'}} sm={{maxHeight: '35em', overflow:'auto'}}>
                    <Table className={'tableGeneral'} sx={{width: '99%', margin:'auto'}} >
                        <TableHead>
                            <TableRow>
                                <TableCell>Tipo de órgano</TableCell>
                                <TableCell style={{width: '10%'}}>Total de aspirantes</TableCell>
                                <TableCell>Evento</TableCell>
                            </TableRow>
                        </TableHead>
                        <TableBody>
                        { data.map((res, a) => {
                            return(
                                <TableRow key={'rowD-' +a}>

                                    <TableCell>
                                        {res['tiporgnombre']}
                                    </TableCell>

                                    <TableCell>
                                        {res['totalInscrito']}
                                    </TableCell>

                                    <TableCell className='cellCenter'>

                                        <Grid container spacing={1.5}>

                                            <Grid size={{ xs: 12, sm: 6, md: 2.4 }}>
                                                <Button fullWidth className="btnElecciones btnPdf"
                                                    startIcon={<PictureAsPdfIcon />}
                                                    onClick={() => abrirModal({tiporgid: res.tiporgid}, 0)}
                                                    sx={{ py: 1.5 }} >
                                                    lista de aspirantes
                                                </Button>
                                            </Grid>

                                            <Grid size={{ xs: 12, sm: 6, md: 2.4 }}>
                                                <Button fullWidth className="btnElecciones btnAbrir"
                                                    startIcon={<LockOpenIcon />}
                                                    onClick={() => abrirModal({oreltoid: res.oreltoid}, 1)}
                                                    sx={{ py: 1.5 }}
                                                    disabled={!res.habilitarAbrirVotacion}>
                                                    Abrir votación
                                                </Button>
                                            </Grid>

                                            <Grid size={{ xs: 12, sm: 6, md: 2.4 }}>
                                                <Button fullWidth className="btnElecciones btnActa"
                                                    startIcon={<DescriptionIcon />}
                                                    onClick={() => abrirModal({oreltoid: res.oreltoid}, 2)}
                                                    sx={{ py: 1.5 }} 
                                                    disabled={!res.habilitarCerrarVotacion}>
                                                    Acta de apertura
                                                </Button>
                                            </Grid>

                                            <Grid size={{ xs: 12, sm: 6, md: 2.4 }}>
                                                <Button fullWidth className="btnElecciones btnCerrar"
                                                    startIcon={<LockIcon />}
                                                    onClick={() => abrirModal({oreltoid: res.oreltoid}, 3)}
                                                    sx={{ py: 1.5 }} 
                                                    disabled={!res.habilitarCerrarVotacion}>
                                                    Cerrar votación
                                                </Button>
                                            </Grid>

                                            <Grid size={{ xs: 12, sm: 6, md: 2.4 }}>
                                                <Button fullWidth className="btnElecciones btnPdf"
                                                    startIcon={<FormatListBulletedIcon />}
                                                    onClick={() => abrirModal({oreltoid: res.oreltoid}, 4)}
                                                    sx={{ py: 1.5 }} 
                                                    disabled={!res.habilitarImpresionVotacion}>
                                                    Lista de resultados
                                                </Button>
                                            </Grid>

                                            <Grid size={{ xs: 12, sm: 6, md: 2.4 }}>
                                                <Button fullWidth className="btnElecciones btnActa"
                                                    startIcon={<LibraryBooksIcon />}
                                                    onClick={() => abrirModal({oreltoid: res.oreltoid}, 5)}
                                                    sx={{ py: 1.5 }} 
                                                    disabled={!res.habilitarImpresionVotacion}>
                                                    Acta de escrutinio
                                                </Button>
                                            </Grid>
 
                                            <Grid size={{ xs: 12, sm: 6, md: 2.4 }} style={{marginBottom:'1em'}}>
                                                <Button fullWidth className="btnElecciones btnPublicar"
                                                    startIcon={<MenuBookIcon />}
                                                    onClick={() => abrirModal(6)}
                                                    sx={{ py: 1.5 }} 
                                                    disabled={!data.habilitarImpresionVotacion}>
                                                    Acta de resultados
                                                </Button>
                                            </Grid>

                                        </Grid>
                                    </TableCell>
                                </TableRow>
                                );
                            })
                        }
                        </TableBody>
                    </Table>
                </Box>

                <ModalDefault
                    title   = {modal.titulo}
                    content = {modales[modal.vista]}
                    close   = {() =>{cerrarModal(), [1, 3].includes(modal.vista) ? inicio() : null;}}
                    tam     = {modal.tamano}
                    abrir   = {modal.open}
                />
            </Card>
        </Box>
    )
}