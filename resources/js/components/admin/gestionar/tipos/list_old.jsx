import {useState, useEffect} from 'react';
import { Box, Card, Typography, Icon, Table, TableHead, TableBody, TableRow, TableCell} from '@mui/material';
import TablaGeneral from '../../../layout/tablaGeneral';
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
                    <TablaGeneral
                        datos={data}
                        titulo={['Nombre','Votos por persona','Total principales', 'Total suplente', 'Activo','Actualizar','Eliminar']}
                        ver={["tiporgnombre","tiporgvotosporpersona","tiporgtotalprincipales","tiporgtotalsuplente","estado"]}
                        accion={[
                            {tipo: 'T', icono : 'add',    color: 'green',  funcion : (data)=>{edit(data,0)} },
                            {tipo: 'B', icono : 'edit',   color: 'orange', funcion : (data)=>{edit(data,1)} },
                            {tipo: 'B', icono : 'delete', color: 'red',    funcion : (data)=>{edit(data,2)} },
                        ]}
                        funciones={{orderBy: false, search: false, pagination:false}}
                    />
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
                        { data.map((res, a) => {
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
                                            {res.estado}
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