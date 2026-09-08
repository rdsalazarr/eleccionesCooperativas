import {useState, useEffect} from 'react';
import TablaGeneral from '../../../../layout/tablaGeneral';
import {ShowSnackbar} from '../../../../layout/snackBar';
import { ModalDefault } from '../../../../layout/modal';
import { Box, Card, Typography} from '@mui/material';
import {LoaderModal} from "../../../../layout/loader";
import instance from '../../../../layout/instance';
import GenerarActasPdf from './generarActasPdf';

export default function List(){

    const [modal, setModal] = useState({open : false, vista:2, data:{}, titulo:'', tamano:'bigFlot'});
    const [habilitarBoton, setHabilitarBoton] = useState(false);
    const [loader, setLoader] = useState(true);
    const [titulo, setTitulo] = useState('');
    const [data, setData] = useState([]);

    const cerrarModal = () =>{
        setModal({open : false, vista:2, data:{}, titulo:'', tamano:'bigFlot'});
    }

    const modales     = [<GenerarActasPdf id={modal?.data?.eldeinid || null} ruta='/admin/eleccion/delegado/informes/imprimir/PDF' /> ];
    const tituloModal = ['Informe generado en formato PDF'];

    const edit = (data, tipo) =>{
        setModal({open: true, vista: tipo, data:data, titulo: tituloModal[tipo], tamano: (tipo === 1 ) ? 'smallFlot' : 'mediumFlotPdf'});
    }

    const inicio = () =>{
        setLoader(true);
        instance.get('/admin/eleccion/delegado/informes/list').then(res=>{
            (res.success) ? (setData(res.data), setTitulo(res.titulo), setHabilitarBoton(res.habilitarBoton)) : ShowSnackbar(res.message, 'error');
            setLoader(false);
        })
    }

    useEffect(()=>{inicio();}, []);

    if(loader){
        return <LoaderModal />
    }

    return (
        <Box>
            <Box>
                <Typography component={'h2'} className={'titleGeneral'}>{titulo}</Typography>
            </Box>

            <Card className={'cardContainer'}>
                <Box sx={{maxHeight: '35em', overflow:'auto'}} sm={{maxHeight: '35em', overflow:'auto'}}>
                    <TablaGeneral
                        datos={data}
                        titulo={['Fecha y hora','Número','Total votos','Usuario','PDF']}
                        ver={["eldeinfechahora","eldeinnumeroinforme","eldeintotalvotos","usuario"]}
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