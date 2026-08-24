import React, {useState} from 'react';
import { Box, Typography, Tab, Tabs} from '@mui/material';
import { TabPanel } from '../../../layout/general';
import Funcionalidad from "./funcionalidad/list";
import Modulo from "./modulo/list";

export default function List(){

    const [variantTab, setVariantTab] = useState((window.innerWidth <= 768) ? 'scrollable' : 'fullWidth');
    const [value, setValue] = useState(0); 

    const handleChangeTab = (event, newValue) => {
        setValue(newValue);
    };

    return ( 
        <Box> 
            <Box>
                <Typography component={'h2'} className={'titleGeneral'} style={{ paddingBottom: "0.5em"}}>Gestionar menú </Typography>
            </Box> 
            <Tabs value={value} onChange={handleChangeTab}
                indicatorColor="secondary"
                textColor="secondary"
                variant={variantTab} >
                <Tab label="Funcionalidad" />
                <Tab label="Módulo" />
            </Tabs>

            <TabPanel value={value} index={0}>
                <Funcionalidad />
            </TabPanel>

            <TabPanel value={value} index={1}>
                <Modulo />
            </TabPanel>

        </Box>
    )
}