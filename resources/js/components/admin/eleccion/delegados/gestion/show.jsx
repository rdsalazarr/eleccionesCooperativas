import {useState, useEffect, Fragment} from 'react';
import TablaGeneral from '../../../../layout/tablaGeneral';
import { ShowSnackbar } from '../../../../layout/snackBar';
import { LoaderModal } from "../../../../layout/loader";
import instance from '../../../../layout/instance';
import {Grid, Box } from '@mui/material';

export default function Show({data}){

    const [agencias, setAgencias] = useState([]);
    const [loader, setLoader] = useState(false);

    useEffect(()=>{
        setLoader(true);
        instance.post('/admin/eleccion/delegado/gestion/visualizar', {codigo: data?.eledelid || '000'}).then(res=>{
            console.log(res.agencias);
            (res.success) ? setAgencias(res.agencias) : ShowSnackbar(res.message, 'error');
            setLoader(false);
        })
    }, []);

    if (loader) {
        return <LoaderModal />;
    }

    return (
        <Grid container spacing={2}>

            <Grid size={{ xs: 12, sm: 6, md: 6}}>
                <Box className='frmTexto'>
                    <label>Título</label>
                    <span>{data.eledeltitulo}</span>
                </Box>
            </Grid>

            <Grid size={{ xs: 12, sm: 2}}>
                <Box className='frmTexto'>
                    <label>Período</label>
                    <span>{data.eledelperiodo}</span>
                </Box>
            </Grid>

            <Grid size={{ xs: 12, sm: 2}}>
                <Box className='frmTexto'>
                    <label>Hora de inicio</label>
                    <span>{data.eledelhorainicio}</span>
                </Box>
            </Grid>

            <Grid size={{ xs: 12, sm: 2}}>
                <Box className='frmTexto'>
                    <label>Hora de cierre</label>
                    <span>{data.eledelhoracierre}</span>
                </Box>
            </Grid>

            {agencias.map(res=>{
                return(
                    <Fragment key={res.agenid}>
                        <Grid size={{ xs: 12 }}>
                            <Box className='divisionFormulario'>
                                Información de la agencia de {res.agennombre}
                            </Box>
                        </Grid>

                        <Grid size={{ xs: 12, sm: 6}}>
                            <Box className='frmTexto'>
                                <label>Lugar</label>
                                <span>{res.eldeaglugar}</span>
                            </Box>
                        </Grid>

                        <Grid size={{ xs: 12, sm: 3}}>
                            <Box className='frmTexto'>
                                <label>Total delegado principal</label>
                                <span>{res.eldeagnumerodeleprincipal}</span>
                            </Box>
                        </Grid>

                        <Grid size={{ xs: 12, sm: 3}}>
                            <Box className='frmTexto'>
                                <label>Total delegado suplente</label>
                                <span>{res.eldeagnumerodelesuplente}</span>
                            </Box>
                        </Grid>

                        <Grid size={{ xs: 12 }}>
                            <Box className='divisionFormularioGris'>
                                Jurados asignados a la agencia de {res.agennombre}
                            </Box>
                        </Grid>

                        <Grid size={{ xs: 12 }}>
                            <Box sx={{maxHeight: '35em', overflow:'auto'}} sm={{maxHeight: '35em', overflow:'auto'}}>
                                <TablaGeneral
                                    datos={res.jurados}
                                    titulo={['Documento','Nombre','Cargo']}
                                    ver={["eldeajdocumento","eldeajnombre","eldeajcargo"]}
                                    accion={[]}
                                    funciones={{orderBy: false, search: false, pagination: false}}
                                />
                            </Box>
                        </Grid>

                    </Fragment>
                );
            })}
         

        </Grid>
    )
}