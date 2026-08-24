
import {createRoot} from "react-dom/client";
import {HeaderAdmon, FooterAdmon } from "../layout/general";
import { SnackbarSettings } from "../layout/snackBar";
import Contenedor from '../layout/contenedor';
import "animate.css/animate.min.css";
import { Box} from '@mui/material';
import "../../../scss/app.scss";

export default function Dashboard(){

    return(
        <Box>
            <HeaderAdmon />
                <SnackbarSettings>
                    <Box style={{ marginTop: '7em', marginBottom: '4em'}}>
                        <Contenedor />
                    </Box>
                </SnackbarSettings>
            <FooterAdmon />
        </Box>
    )
}

const root = createRoot(document.getElementById('app'));
root.render(<Dashboard />);