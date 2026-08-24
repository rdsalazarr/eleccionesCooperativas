import {useState, useEffect} from 'react';
import TablaGeneral from '../../../../layout/tablaGeneral';
import {ShowSnackbar} from '../../../../layout/snackBar';
import { ModalDefault} from '../../../../layout/modal';
import {LoaderModal} from "../../../../layout/loader";
import Eliminar from '../../../../layout/modalFijas';
import instance from '../../../../layout/instance';
import { Box} from '@mui/material';
import Frm from './frm';

export default function List(){

    const [modal, setModal] = useState({open : false, vista:3, data:{}, titulo:'', tamano:'bigFlot'});
    const [loader, setLoader] = useState(true);
    const [data, setData] = useState([]);

    const cerrarModal = () =>{
        setModal({open : false, vista:3, data:{}, titulo:'', tamano:'bigFlot'});
    }

    const modales = [
                        <Frm tipo={'I'} />,
                        <Frm data={modal.data} tipo={'U'} />,
                        <Eliminar id={modal?.data?.funcid || null} ruta={'/admin/funcionalidad/destroy'} cerrarModal={cerrarModal} />
                    ];

    const tituloModal = ['Nueva funcionalidad','Editar funcionalidad',''];

    const edit = (data, tipo) =>{
        setModal({open: true, vista: tipo, data:data, titulo: tituloModal[tipo], tamano: (tipo === 2 ) ? 'smallFlot' :  'mediumFlot'});
    }

    const inicio = () =>{
        setLoader(true);
        instance.get('/admin/funcionalidad/list').then(res=>{
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
            <Box sx={{maxHeight: '35em', overflow:'auto'}} sm={{maxHeight: '35em', overflow:'auto'}}>
                <TablaGeneral
                    datos={data}
                    titulo={['Módulo','Nombre', 'Título','Ruta','Ícono','Orden','Activo','Actualizar','Eliminar']}
                    ver={["modunombre","funcnombre","functitulo","funcruta","funcicono","funcorden","estado"]}
                    accion={[
                        {tipo: 'T', icono : 'add',    color: 'green',  funcion : (data)=>{edit(data,0)} },
                        {tipo: 'B', icono : 'edit',   color: 'orange', funcion : (data)=>{edit(data,1)} },
                        {tipo: 'B', icono : 'delete', color: 'red',    funcion : (data)=>{edit(data,2)} },
                    ]}
                    funciones={{orderBy: true,search: true, pagination:true}}
                />
            </Box>

            <ModalDefault
                title   = {modal.titulo}
                content = {modales[modal.vista]}
                close   = {() =>{cerrarModal(), inicio();}}
                tam     = {modal.tamano}
                abrir   = {modal.open}
            />

        </Box>
    )
}