import {createRoot} from "react-dom/client";
import imagen from "../../../../images/errors/mantenimiento.svg";
import {Header, Footer} from "../../layout/general";
import { Box, Grid } from '@mui/material';
import "../../../../scss/app.scss";
import "../../../../scss/errors.scss";

export default function E503(){

    return(
        <Box>
            <Header /> 

            <Box className='container paginaError'>
                <Grid container spacing={2}>
                    <Grid size={{ xs: 12, sm: 12, md: 7, lg: 6, xl: 6 }} className='centrarContenido'>
                        <h1>¡Estamos en mantenimiento!</h1>
                        <h3>Lamentamos las molestias, actualmente estamos realizando labores de mantenimiento. Le pedimos disculpas por las molestias ocasionadas y le recomendamos que vuelva a revisar más tarde. ¡Gracias por su comprensión!</h3>
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
root.render(<E503 />);