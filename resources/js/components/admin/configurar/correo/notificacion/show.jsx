import {Grid, Box } from '@mui/material';

export default function Show({data}){

    return (
        <Grid container spacing={2}>

            <Grid size={{ xs: 12, sm: 12, md: 6}}>
                <Box className='frmTexto'>
                    <label>Nombre</label>
                    <span>{data.innoconombre}</span>
                </Box>
            </Grid>

            <Grid size={{ xs: 12, sm: 6, md: 3}}>
                <Box className='frmTexto'>
                    <label>Pie página</label>
                    <span>{data.enviarPiePagina}</span>
                </Box>
            </Grid>

            <Grid size={{ xs: 12, sm: 6, md: 3}}>
                <Box className='frmTexto'>
                    <label>Enviar copia</label>
                    <span>{data.enviarCopia}</span>
                </Box>
            </Grid>

            <Grid size={{ xs: 12}}>
                <Box className='frmTexto'>
                    <label>Asunto</label>
                    <span>{data.innocoasunto}</span>
                </Box>
            </Grid>

            <Grid size={{ xs: 12}}>
                <Box className='frmTexto'>
                    <label>Contenido del correo</label>
                    <span dangerouslySetInnerHTML={{__html: data.innococontenido}} />
                </Box>
            </Grid>
        </Grid>
    )
}