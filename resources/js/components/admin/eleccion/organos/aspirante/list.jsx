import {useState, useEffect} from 'react';
import TablaGeneral from '../../../../layout/tablaGeneral';
import {ShowSnackbar} from '../../../../layout/snackBar';
import { ModalDefault } from '../../../../layout/modal';
import { Box, Card, Typography } from '@mui/material';
import {LoaderModal} from "../../../../layout/loader";
import instance from '../../../../layout/instance';
import VisualizarPdf from '../../visualizarPdf'
import Frm from './frm';

export default function List(){

    const [modal, setModal] = useState({open : false, vista:2, data:{}, titulo:'', tamano:'bigFlot'});
    const [loader, setLoader] = useState(true);
    const [data, setData] = useState([]);

    const cerrarModal = () =>{
        setModal({open : false, vista:2, data:{}, titulo:'', tamano:'bigFlot'});
    }

    const modales = [
                        <Frm data={modal.data} />,
                        <VisualizarPdf id={modal?.data?.tiporgid || null}ruta='/admin/organos/eleccion/aspirantes/imprimir/PDF' /> ,
                    ];

    const tituloModal = ['Asignar aspirante al organo de control','Generar lista en formato PDF de los delegados asignado al órgano de control'];

    const edit = (data, tipo) =>{
        setModal({open: true, vista: tipo, data:data, titulo: tituloModal[tipo], tamano: tipo === 1 ? 'mediumFlotPdf' : 'mediumFlot'});
    }

    const inicio = () =>{
        setLoader(true);
        instance.get('/admin/organos/eleccion/aspirantes/list').then(res=>{
            (res.success) ? setData(res.data) : ShowSnackbar(res.message, 'error');
            setLoader(false);
        })
    }

    useEffect(()=>{inicio();}, []);

    if(loader){
        return <LoaderModal />
    }

    return (
        <Box className={'containerSmoll'} >
            <Box>
                <Typography component={'h2'} className={'titleGeneral'}>Gestionar aspirante a los órganos de control</Typography>
            </Box>
            <Card className={'cardContainer'}>
                <Box sx={{maxHeight: '35em', overflow:'auto'}} sm={{maxHeight: '35em', overflow:'auto'}}>
                    <TablaGeneral
                        datos={data}
                        titulo={['Tipo de órgano','Gestionar','PDF']}
                        ver={["tiporgnombre"]}
                        accion={[
                            {tipo: 'B', icono : 'add',            color: 'green',  funcion : (data)=>{edit(data, 0)} },
                            {tipo: 'B', icono : 'picture_as_pdf', color: 'orange', funcion : (data)=>{edit(data, 1)} },
                        ]}
                        funciones={{orderBy: true,search: true, pagination: true}}
                    />
                </Box>

                <ModalDefault
                    title   = {modal.titulo}
                    content = {modales[modal.vista]}
                    close   = {() =>{cerrarModal(), [0].includes(modal.vista) ? inicio() : null;}}
                    tam     = {modal.tamano}
                    abrir   = {modal.open}
                />
            </Card>
        </Box>
    )
}