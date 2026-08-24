import {useState, useEffect} from 'react';
import TablaGeneral from '../../../layout/tablaGeneral';
import {ShowSnackbar} from '../../../layout/snackBar';
import { Box, Typography, Card} from '@mui/material';
import { ModalDefault } from '../../../layout/modal';
import {LoaderModal} from "../../../layout/loader";
import instance from '../../../layout/instance';
import Frm from './frm';

export default function List(){

    const [modal, setModal] = useState({open : false, vista:3, data:{}, titulo:'', tamano:'bigFlot'});
    const [loader, setLoader] = useState(true);
    const [data, setData] = useState([]);

    const cerrarModal = () =>{
        setModal({open : false, vista:3, data:{}, titulo:'', tamano:'bigFlot'});
    }

    const modales    = [<Frm data={modal.data} tipo={'U'} /> ];
    const tituloModal = ['Editar empresa'];

    const edit = (data, tipo) =>{
        setModal({open: true, vista: tipo, data:data, titulo: tituloModal[tipo], tamano: 'mediumFlot'});
    }

    const inicio = () =>{
        setLoader(true);
        instance.get('/admin/empresa/list').then(res=>{
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
            <Box>
                <Typography component={'h2'} className={'titleGeneral'}>Editar empresa</Typography>
            </Box>
            <Card className={'cardContainer'}>
                <Box sx={{maxHeight: '35em', overflow:'auto'}} sm={{maxHeight: '35em', overflow:'auto'}}>
                    <TablaGeneral
                        datos={data}
                        titulo={['Nit','Nombre','Dirección','Teléfono','Ciudad', 'Eliminar']}
                        ver={["emprnit","emprnombre","emprdireccion", "telefonos", "emprciudad"]}
                        accion={[
                            {tipo: 'B', icono : 'edit',   color: 'orange', funcion : (data)=>{edit(data, 0)} },
                        ]}
                        funciones={{orderBy: false,search: false, pagination: false}}
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