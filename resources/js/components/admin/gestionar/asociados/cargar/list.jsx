import {useState} from 'react';
import {Card, CardContent, Typography, Grid, Button,  Box,} from "@mui/material";
import { ModalDefault } from '../../../../layout/modal';
import Groups2Icon from "@mui/icons-material/Groups2";
import GroupIcon from "@mui/icons-material/Group";
import BadgeIcon from "@mui/icons-material/Badge";
import CargarAsociado from './cargarAsociado';
import Verificar from './verificar';
import Procesar from './procesar';

export default function List(){

    const [modal, setModal] = useState({open : false, vista:3, titulo:'', tamano:'bigFlot'});

    const cerrarModal = () =>{
        setModal({open : false, vista:3,  titulo:'', tamano:'bigFlot'});
    }

    const modales = [
                        <CargarAsociado cerrarModal={cerrarModal} />,
                        <Verificar cerrarModal={cerrarModal} /> ,
                        <Procesar cerrarModal={cerrarModal} />
                    ];

    const tituloModal = ['Cargar asociados','Verificar asociados subidos',''];

    const abrirModal = ( tipo) =>{
        setModal({open: true, vista: tipo, titulo: tituloModal[tipo], tamano: (tipo === 0) ? 'mediumFlot' : ((tipo === 1) ? 'bigFlot': 'smallFlot')});
    }

    return (
        <Box style={{width:'70%', margin:'auto'}}>
            <Typography component={'h2'} className={'titleGeneral'}>Cargar asociados masivamente</Typography>
            <Grid container justifyContent="center">
                <Grid size={{ xs: 12 }}>
                    <Card elevation={0} sx={{border: '1px solid',borderColor: 'divider', borderRadius: 3 }}>
                        <CardContent>

                            <Grid container spacing={2}>
                                <Grid size={{ xs: 12, sm: 4 }}>
                                    <Button fullWidth className='btnAsociados btnCargar'
                                        startIcon={<GroupIcon />}
                                        onClick={() => abrirModal(0)}
                                        sx={{ py: 1.5 }}>
                                        Cargar
                                    </Button>
                                </Grid>

                                <Grid size={{ xs: 12, sm: 4 }}>
                                    <Button fullWidth  className='btnAsociados btnVerificar'
                                        startIcon={<BadgeIcon />}
                                        onClick={() => abrirModal(1)}
                                        sx={{ py: 1.5 }} >
                                        Verificar
                                    </Button>
                                </Grid>

                                <Grid size={{ xs: 12, sm: 4 }}>
                                    <Button fullWidth  className='btnAsociados btnProcesar'
                                        startIcon={<Groups2Icon />}
                                        onClick={() => abrirModal(2)}
                                        sx={{ py: 1.5 }} >
                                        Procesar
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