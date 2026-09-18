
import { useState, useEffect } from 'react';
import {createRoot} from "react-dom/client";
import { SnackbarSettings } from "../layout/snackBar";
import {Header, Footer} from '../layout/general';
import { Box, Grid} from '@mui/material';
import Loader from '../layout/loader';
import "../../../scss/elecciones.scss";

import HorizontalLinearStepper from './HorizontalLinearStepper'
import { color } from 'framer-motion';

export default function Admin(){

    const [loader, setLoader] = useState(false);

    if (loader) {
        return <Loader />;
    }

    return(
        <Box>
            <Header />
            <SnackbarSettings>

                <Grid container spacing={2} className="containerElecciones">
                    <br></br>
                    <Grid size={{ xs: 12}} >

                        <HorizontalLinearStepper />
                 
                    </Grid>
                </Grid>

            </SnackbarSettings>
            <Footer />
        </Box>
    )
}

const root = createRoot(document.getElementById('app'));
root.render(<Admin />);