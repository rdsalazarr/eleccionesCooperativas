import {useState, useEffect} from 'react';
import TablaGeneral from '../../../../layout/tablaGeneral';
import {ShowSnackbar} from '../../../../layout/snackBar';
import {LoaderModal} from "../../../../layout/loader";
import instance from '../../../../layout/instance';
import { Box} from '@mui/material';

export default function Verificar(){

    const [loader, setLoader] = useState(true);
    const [data, setData] = useState([]);

    const inicio = () =>{
        setLoader(true);
        instance.post('/admin/cargar/asociados/verificar').then(res=>{
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
                    titulo={['Agencia', 'Tipo de identificación', 'Número de identificación', 'Nombre completo', 'Fecha de nacimiento', 'Fecha de expedición de documento', 'Email', 'Teléfono', 'Celular']}
                    ver={["asotemagencia","asotemtipodocumento","asotemnumero","asotemnombrecompleto","asotemfechanacimiento","asotemfechaexpedicion","asotememail","asotemtelefono","asotemcelular"]}
                    accion={[]}
                    funciones={{orderBy: true,search: true, pagination: true}}
                />
            </Box>
        </Box>
    )
}