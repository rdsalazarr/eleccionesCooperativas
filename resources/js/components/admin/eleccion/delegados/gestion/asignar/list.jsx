import {useState, useEffect} from 'react';
import TablaGeneral from '../../../../../layout/tablaGeneral';
import {ShowSnackbar} from '../../../../../layout/snackBar';
import { ModalDefault } from '../../../../../layout/modal';
import {LoaderModal} from "../../../../../layout/loader";
import instance from '../../../../../layout/instance';
import { Box} from '@mui/material';
import Frm from './frm';

export default function List({id}){

    const [modal, setModal] = useState({open : false, vista:2, data:{}, titulo:'', tamano:'bigFlot'});
    const [loader, setLoader] = useState(true);
    const [data, setData] = useState([]);

    const cerrarModal = () =>{
        setModal({open : false, vista:2, data:{}, titulo:'', tamano:'bigFlot'});
    }

    const modales     = [<Frm data={modal?.data || null} /> ];
    const tituloModal = ['Asignacion de jurado a la agencia'];

    const edit = (data, tipo) =>{
        setModal({open: true, vista: tipo, data:data, titulo: tituloModal[tipo], tamano: (tipo === 2 ) ? 'smallFlot' :  'mediumFlot'});
    }

    const inicio = () =>{
        setLoader(true);
        instance.post('/admin/eleccion/delegado/gestion/list/datos', {codigo: id, tipo:'A'}).then(res=>{
            (res.success) ? setData(res.delegadosAgencias) : ShowSnackbar(res.message, 'error');
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
                    titulo={['Agencia','Lugar','Total delegado principal','Total delegado suplente','Jurados','Acción']}
                    ver={["agennombre","eldeaglugar","eldeagnumerodeleprincipal","eldeagnumerodelesuplente", "jurados"]}
                    accion={[
                        {tipo: 'B', icono : 'how_to_reg', color: 'orange', funcion : (data)=>{edit(data, 0)} },
                    ]}
                    funciones={{orderBy: false,search: false, pagination: false}}
                />
            </Box>

            <ModalDefault
                title   = {modal.titulo}
                content = {modales[modal.vista]}
                close   = {() =>{cerrarModal(); inicio()}}
                tam     = {modal.tamano}
                abrir   = {modal.open}
            />
        </Box>
    )
}