import {createRoot} from "react-dom/client";
import imagen from "../../../../images/errors/accesoNoAutorizado.svg";
import {Header, Footer} from "../../layout/general";
import HomeIcon from '@mui/icons-material/Home';
import { Box, Grid } from '@mui/material';
import "../../../../scss/app.scss";
import "../../../../scss/errors.scss";

export default function E401(){

    return(
        <Box>
            <Header />

            <Box className='container paginaError'>
                <Grid container spacing={2}>
                    <Grid size={{ xs: 12, sm: 12, md: 7, lg: 6, xl: 6 }} className='centrarContenido'>
                        <h1>¡Acceso no autorizado!</h1>
                        <p>Lamentamos informarle que no tiene autorización para acceder a esta página. Si considera que esto es un error, por favor, póngase en contacto con el administrador del sistema para obtener más información. Gracias por su comprensión.</p>
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
root.render(<E401 />);