import {createRoot} from "react-dom/client";
import imagen from "../../../../images/errors/error404.svg";
import {Header, Footer} from "../../layout/general";
import HomeIcon from '@mui/icons-material/Home';
import { Box, Grid } from '@mui/material';
import "../../../../scss/app.scss";
import "../../../../scss/errors.scss";

export default function E404(){

    return(
        <Box>
            <Header />

            <Box className='container paginaError'>
                <Grid container spacing={2}>
                    <Grid size={{ xs: 12, sm: 12, md: 7, lg: 6, xl: 6 }} className='centrarContenido'>
                        <h1>Error 404</h1>
                        <h3>¡Parece que algo nos hace falta! </h3>
                        <p>Nos hemos encontrado con un contratiempo en el camino y no hemos podido encontrar lo que buscabas. Queremos asegurarte que estamos trabajando arduamente para resolver esta situación y poder ofrecerte la información que necesitas. Agradecemos tu paciencia y comprensión mientras trabajamos en ello.</p>
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
root.render(<E404 />);
