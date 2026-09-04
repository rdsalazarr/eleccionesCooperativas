import {useState, useEffect} from 'react';
import TablaGeneral from '../../../../layout/tablaGeneral';
import {ShowSnackbar} from '../../../../layout/snackBar';
import { ModalDefault } from '../../../../layout/modal';
import {LoaderModal} from "../../../../layout/loader";
import { Box, Card, Typography} from '@mui/material';
import Eliminar from '../../../../layout/modalFijas';
import instance from '../../../../layout/instance';
import AsignarJurados from './asignar/list';
import Show from './show';
import Frm from './frm';

export default function List(){

    const [modal, setModal] = useState({open : false, vista:5, data:{}, titulo:'', tamano:'bigFlot'});
    const [loader, setLoader] = useState(true);
    const [data, setData] = useState([]);

    const cerrarModal = () =>{
        setModal({open : false, vista:5, data:{}, titulo:'', tamano:'bigFlot'});
    }

    const modales = [
                        <Frm tipo={'I'} />,
                        <Frm data={modal.data} tipo={'U'} />,
                        <AsignarJurados id={modal?.data?.eledelid || null} />,
                        <Show data={modal.data} tipo={'U'} />,
                        <Eliminar id={modal?.data?.eledelid || null} ruta={'/admin/eleccion/delegado/gestion/destroy'} cerrarModal={cerrarModal} />
                    ];

    const tituloModal = ['Nueva elección de delegado','Editar elección de delegado','Asignar jurados a las agencias', 'Ver contenido general', ''];

    const edit = (data, tipo) =>{
        setModal({open: true, vista: tipo, data:data, titulo: tituloModal[tipo], tamano: (tipo === 4 ) ? 'smallFlot' :  'mediumFlot'});
    }

    const inicio = () =>{
        setLoader(true);
        instance.get('/admin/eleccion/delegado/gestion/list').then(res=>{
            (res.success) ? setData(res.data) : ShowSnackbar(res.message, 'error');
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
                <Typography component={'h2'} className={'titleGeneral'}>Gestión de eleccciones de delegados</Typography>
            </Box>
            <Card className={'cardContainer'}>
                <Box sx={{maxHeight: '35em', overflow:'auto'}} sm={{maxHeight: '35em', overflow:'auto'}}>
                    <TablaGeneral
                        datos={data}
                        titulo={['Año','Título','Período','Hora de inicio','Hora de cierre','Elección abierta','Elección cerrrada','Elección publicada','Actualizar','Asignar','Ver','Eliminar']}
                        ver={["eledelanio","eledeltitulo","eledelperiodo","eledelhorainicio","eledelhoracierre","abrirEleccion","cerrarEleccion","publicaEleccion"]}
                        accion={[
                            {tipo: 'T', icono : 'add',        color: 'green',  funcion : (data)=>{edit(data,0)} },
                            {tipo: 'B', icono : 'edit',       color: 'orange', funcion : (data)=>{edit(data,1)} },
                            {tipo: 'B', icono : 'done_all',   color: 'green',  funcion : (data)=>{edit(data,2)} },
                            {tipo: 'B', icono : 'visibility', color: 'green',  funcion : (data)=>{edit(data,3)} },
                            {tipo: 'B', icono : 'delete',     color: 'red',    funcion : (data)=>{edit(data,4)} },
                        ]}
                        funciones={{orderBy: true,search: true, pagination: true}}
                    />
                </Box>

                <ModalDefault
                    title   = {modal.titulo}
                    content = {modales[modal.vista]}
                    close   = {() =>{cerrarModal(), inicio();}}
                    tam     = {modal.tamano}
                    abrir   = {modal.open}
                />
            </Card>
        </Box>
    )
}