import React, {useState} from 'react';
import { Box, Typography, Tab, Tabs} from '@mui/material';
import { TabPanel } from '../../../layout/general';
import Configuracion from "./configuracion/list";
import Notificacion from "./notificacion/list";

export default function List(){

    const [variantTab, setVariantTab] = useState((window.innerWidth <= 768) ? 'scrollable' : 'fullWidth');
    const [value, setValue] = useState(0); 

    const handleChangeTab = (event, newValue) => {
        setValue(newValue);
    };

    return ( 
        <Box> 
            <Box>
                <Typography component={'h2'} className={'titleGeneral'} style={{ paddingBottom: "0.5em"}}>Gestionar correo </Typography>
            </Box> 
            <Tabs value={value} onChange={handleChangeTab}
                indicatorColor="secondary"
                textColor="secondary"
                variant={variantTab} >
                <Tab label="Notificación" />
                <Tab label="Configuración" />
            </Tabs>

            <TabPanel value={value} index={0}>
                <Notificacion />
            </TabPanel>

            <TabPanel value={value} index={1}>
                <Configuracion />
            </TabPanel>

        </Box>
    )
}