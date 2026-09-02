import {Grid, Box } from '@mui/material';

export default function Show({data}){

    return (
        <Grid container spacing={2}>

            <Grid size={{ xs: 12, sm: 6, md: 6}}>
                <Box className='frmTexto'>
                    <label>Título</label>
                    <span>{data.titulo}</span>
                </Box>
            </Grid>

            <Grid size={{ xs: 12, sm: 2}}>
                <Box className='frmTexto'>
                    <label>Período</label>
                    <span>{data.periodo}</span>
                </Box>
            </Grid>

            <Grid size={{ xs: 12, sm: 2}}>
                <Box className='frmTexto'>
                    <label>Hora de inicio</label>
                    <span>{data.enviarCopia}</span>
                </Box>
            </Grid>

            <Grid size={{ xs: 12}}>
                <Box className='frmTexto'>
                    <label>Asunto</label>
                    <span>{data.innocoasunto}</span>
                </Box>
            </Grid>

        </Grid>
    )
}