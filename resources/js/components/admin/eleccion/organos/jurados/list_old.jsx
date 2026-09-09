import {useState, useEffect} from 'react';
import TablaGeneral from '../../../../layout/tablaGeneral';
import {ShowSnackbar} from '../../../../layout/snackBar';
import { ModalDefault } from '../../../../layout/modal';
import { Box, Card, Typography } from '@mui/material';
import {LoaderModal} from "../../../../layout/loader";
import instance from '../../../../layout/instance';

export default function List(){

    const [delegados, setDelegados] = useState([]);
    const [loader, setLoader] = useState(true);
    const [jurados, setJurados] = useState([]);
    const [titulo, setTitulo] = useState('');

    const cerrarModal = () =>{
        setModal({open : false, vista:5, data:{}, titulo:'', tamano:'bigFlot'});
    }


    const edit = (data, tipo) =>{
        setModal({open: true, vista: tipo, data:data, titulo: tituloModal[tipo], tamano: tipo === 2 ? 'mediumFlotPdf' : 'mediumFlot'});
    }

    const inicio = () =>{
        setLoader(true);
        instance.get('/admin/organos/eleccion/jurados/list').then(res=>{
            console.log(res);

            //'id' => $id, 'titulo' => $titulo, 'jurados' => $jurados, 'delegados' => $delegados
            (res.success) ? (setDelegados(res.delegados), setTitulo(res.titulo), setJurados(res.jurados)) : ShowSnackbar(res.message, 'error');
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
                        datos={delegados}
                        titulo={['Documento','Nombres','Apellidos','Correo','Teléfono','Número asignado','Agencia','Activo','Actualizar']}
                        ver={["deledocumento","nombres","apellidos","delecorreo","deletelefono","delenumero","agennombre","estado"]}
                        accion={[
                            {tipo: 'T', icono : 'add',            color: 'green',  funcion : (data)=>{edit(data,0)} },
                            {tipo: 'B', icono : 'edit',           color: 'orange', funcion : (data)=>{edit(data,1)} },
                            {tipo: 'D', icono : 'picture_as_pdf', color: 'orange', funcion : (data)=>{edit(data,2)} },
                        ]}
                        funciones={{orderBy: true,search: true, pagination: true}}
                    />
                </Box>

       
            </Card>
        </Box>
    )
}