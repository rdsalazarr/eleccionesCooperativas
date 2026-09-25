import {useState, useEffect} from 'react';
import { Box, Card, Typography, Icon, Switch, Table, TableHead, TableBody, TableRow, TableCell} from '@mui/material';
import {ShowSnackbar} from '../../../layout/snackBar';
import { ModalDefault } from '../../../layout/modal';
import {LoaderModal} from "../../../layout/loader";
import Eliminar from '../../../layout/modalFijas';
import instance from '../../../layout/instance';
import Frm from './frm';

export default function List(){

    const [modal, setModal] = useState({open : false, vista:3, data:{}, titulo:'', tamano:'bigFlot'});
    const [loader, setLoader] = useState(true);
    const [data, setData] = useState([]);

    const cerrarModal = () =>{
        setModal({open : false, vista:3, data:{}, titulo:'', tamano:'bigFlot'});
    }

    const modales = [
                        <Frm tipo={'I'}  />,
                        <Frm data={modal.data} tipo={'U'} /> ,
                        <Eliminar id={modal?.data?.tiporgid || null} ruta={'/admin/tipo/organo/destroy'} cerrarModal={cerrarModal} />
                    ];

    const tituloModal = ['Nuevo tipo de elección','Editar tipo de elección',''];

    const edit = (data, tipo) =>{
        setModal({open: true, vista: tipo, data:data, titulo: tituloModal[tipo], tamano: (tipo === 2 ) ? 'smallFlot' :  'mediumFlot'});
    }

    const cambiarEstado = (id, estado) =>{
        setLoader(true);
        instance.post('/admin/tipo/organo/cambiar/estado',{codigo:id, estado:estado}).then(res=>{
            (res.success) ? inicio() : null;
            let icono = (res.success) ? 'success' : 'error';
            ShowSnackbar(res.message, icono);
            setTimeout(() => {
                setLoader(false);
            }, 1000);
        })
    }

    const inicio = () =>{
        setLoader(true);
        instance.get('/admin/tipo/organo/list').then(res=>{
            (res.success) ? setData(res.data) : ShowSnackbar(res.message, 'error');
            setLoader(false);
        })
    }

    useEffect(()=>{inicio();}, []);

    if(loader){
        return <LoaderModal />
    }

    return (
        <Box className={'containerMedium'}>
            <Box>
                <Typography component={'h2'} className={'titleGeneral'}>Gestión de tipo de órganos</Typography>
            </Box>
            <Card className={'cardContainer'}>
                <Box sx={{maxHeight: '35em', overflow:'auto'}} sm={{maxHeight: '35em', overflow:'auto'}}>

                    <Icon className={'icon top green'}
                        onClick={() => {edit({}, 0);}}
                        >add</Icon>

                    <Table className={'tableGeneral'}>
                        <TableHead>
                            <TableRow>
                                <TableCell>Nombre</TableCell> 
                                <TableCell>Votos por persona</TableCell>
                                <TableCell>Total principales</TableCell>
                                <TableCell>Total suplente</TableCell>
                                <TableCell>Activo</TableCell>
                                <TableCell className='cellCenter'>Actualizar </TableCell>
                                <TableCell className='cellCenter'>Eliminar </TableCell>
                            </TableRow>
                        </TableHead>
                        <TableBody>
                        { data.length > 0 ?
                            data.map((res, a) => {
                            return(
                                <TableRow key={'rowD-' +a} >
                                    <TableCell>
                                        {res.tiporgnombre}
                                    </TableCell> 
                                    <TableCell>
                                        {res.tiporgvotosporpersona}
                                    </TableCell>
                                    <TableCell>
                                        {res.tiporgtotalprincipales}
                                    </TableCell> 
                                    <TableCell>
                                        {res.tiporgtotalsuplente}
                                    </TableCell>
                                    <TableCell>
                                        <Switch
                                            checked={Number(res.tiporgactivo) === 1}
                                            color="secondary"
                                            onChange={(e) => {
                                                const estado = e.target.checked ? 1 : 0;
                                                cambiarEstado(res.tiporgid, estado);
                                            }}
                                        />
                                    </TableCell>
                                    <TableCell className='cellCenter'>
                                        <Icon key={'iconDelete'+a} className={'icon top orange'}
                                                onClick={() => {edit(res, 1);}}
                                            >edit</Icon>
                                    </TableCell>
                                    <TableCell className='cellCenter'>
                                        <Icon key={'iconDelete'+a} className={'icon top red'}
                                                onClick={() => {edit(res, 2);}}
                                            >delete</Icon>
                                    </TableCell>
                                </TableRow>
                                );
                            })
                        : <TableRow>
                                <TableCell colSpan={7} className='registroNoEncontrado'>
                                    <b>No existen registros para mostrar</b>
                                </TableCell> 
                            </TableRow>
                        }
                        </TableBody>
                    </Table>
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