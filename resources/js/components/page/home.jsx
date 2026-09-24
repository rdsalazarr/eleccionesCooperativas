
import { useState, useEffect } from 'react';
import {createRoot} from "react-dom/client";
import FrmVotacion from './eleccion/delegados/frmVotacion';
import Resultados from './eleccion/delegados/resultados';
import { SnackbarSettings } from "../layout/snackBar";
import { ShowSnackbar } from '../layout/snackBar';
import IniciarSesion from './util/iniciarSesion';
import {Header, Footer} from '../layout/general';
import FrmOrganos from './eleccion/organos/frm';
import instance from '../layout/instance';
import { Box, Grid} from '@mui/material';
import Loader from '../layout/loader';
import "../../../scss/app.scss";
import "../../../scss/elecciones.scss";

export default function Home(){

    const [loader, setLoader] = useState(false);
    const [data, setData] = useState([]);

    useEffect(()=>{
        setLoader(true);
        instance.get('/consultar/informacion/general/elecciones').then(res=>{
            if(res.success){
                setData(res.data);
            }else{
                ShowSnackbar(res.message, 'error')
            }
            setLoader(false);
        });
    }, []);

    if (loader) {
        return <Loader />;
    }

    return(
        <Box className="contenedorApp">
            <Header />
            <SnackbarSettings>

                <Grid container spacing={2}>
                    <Grid size={{ xs: 12}} style={{marginTop: '2.1em'}}>

                        {data.habilitarOrganoEleccion && (
                            <FrmOrganos />
                        )}

                        {data.habilitarPublicacionResultados && (
                            <Resultados />
                        )}

                        {data.habilitarEleccionesDelegados && (
                            <FrmVotacion />
                        )}

                        {data.habilitarInicioSesion && (
                            <IniciarSesion cargador={false} />
                        )}

                    </Grid>
                </Grid>

            </SnackbarSettings>
            <Footer />
        </Box>
    )
}

const root = createRoot(document.getElementById('app'));
root.render(<Home />);