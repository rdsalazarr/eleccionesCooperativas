import {useState, useEffect} from 'react';
import TablaGeneral from '../../../../layout/tablaGeneral';
import {ShowSnackbar} from '../../../../layout/snackBar';
import { ModalDefault } from '../../../../layout/modal';
import {LoaderModal} from "../../../../layout/loader";
import instance from '../../../../layout/instance';
import { Box} from '@mui/material';
import Frm from './frm';

export default function List(){

    const [modal, setModal] = useState({open : false, vista:2, data:{}, titulo:'', tamano:'bigFlot'});
    const [loader, setLoader] = useState(false);
    const [data, setData] = useState([]);   

    const modales     = [<Frm data={modal.data} />];
    const tituloModal = ['Editar configuración de notificación de correo'];

    const edit = (data, tipo) =>{
        setModal({open: true, vista: tipo, data:data, titulo: tituloModal[tipo], tamano: 'mediumFlot'});
    }

    const inicio = () =>{
        setLoader(true);
        instance.get('/admin/configuracion/correo/list').then(res=>{
            (res.success) ? setData(res.data) : ShowSnackbar(res.message, 'error');
            setLoader(false);
        }) 
    }

    useEffect(()=>{inicio();}, []);
    
    if(loader){
        return <LoaderModal />
    }

    return (
        <Box className={'containerMedium'} >
            <Box sx={{maxHeight: '35em', overflow:'auto'}} sm={{maxHeight: '35em', overflow:'auto'}}>
                <TablaGeneral
                    datos     = {data}
                    titulo    = {['Host', 'Usuario','Clave','Clave api','Puerto','Actualizar']}
                    ver       = {["incocohost","incocousuario","incococlave","incococlaveapi","incocopuerto"]}
                    accion    = {[{tipo: 'B', icono : 'edit',  color: 'orange', funcion : (data)=>{edit(data, 0)}}]}
                    funciones = {{orderBy: false, search: false, pagination:false}}
                />
            </Box>

            <ModalDefault
                title   = {modal.titulo}
                content = {modales[modal.vista]}
                close   = {() =>{setModal({open : false, vista:2, data:{}, titulo:'', tamano: ''}), inicio();}}
                tam     = {modal.tamano}
                abrir   = {modal.open}
            />        
        </Box>
    )
}