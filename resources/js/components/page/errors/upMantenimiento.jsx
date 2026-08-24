import {createRoot} from "react-dom/client";
import imagen from "../../../../images/errors/subiendoMantenimiento.svg";
import {Header, Footer} from "../../layout/general";
import HomeIcon from '@mui/icons-material/Home';
import { Box, Grid } from '@mui/material';
import "../../../../scss/app.scss";
import "../../../../scss/errors.scss";

export default function UpMantenimiento(){

    return(
        <Box>
            <Header />

            <Box className='container paginaError'>
                <Grid container spacing={2}>
                    <Grid size={{ xs: 12, sm: 12, md: 7, lg: 6, xl: 6 }} className='centrarContenido'>
                        <h1>Subiendo modo mantenimiento</h1>
                        <h3>¡El sistema ha sido cargado correctamente!</h3> 
                        <a href='/'>
                            <HomeIcon className='icono' />
                        </a>
                    </Grid>
                    <Grid size={{ xs: 12, sm: 12, md: 5, lg: 6, xl: 6 }} style={{textAlign: 'center'}}>
                        <img src={imagen} alt="Imagen" onClick={()=>{location.href = '/'}} />
                    </Grid>
                </Grid>
            </Box>

            <Footer />
        </Box>
    )
}

const root = createRoot(document.getElementById('app'));
root.render(<UpMantenimiento />);