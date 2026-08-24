


import {useState, useEffect, Fragment} from 'react';
import {Box, Grid, Button, Avatar,TextField} from "@mui/material";
import eliminarRegistroJson from "../../../images/json/eliminarRegistro.json";
import firmarDocumentoJson from "../../../images/json/firmarDocumento.json";
import sellarDocumentoJson from "../../../images/json/sellarDocumento.json";
import DeleteForeverIcon from '@mui/icons-material/DeleteForever';
import { useForm, Controller } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";
import DeleteIcon from '@mui/icons-material/Delete';
import ClearIcon from '@mui/icons-material/Clear';
import StartIcon from '@mui/icons-material/Start';
import Save from '@mui/icons-material/Save';
import RelojDigital from './relojDigital';
import {ShowSnackbar} from './snackBar';
import { Lottie } from 'lottie-react';
import {LoaderModal} from "./loader";
import instance from './instance';
import * as yup from "yup";

const schemaFirma = yup.object({
    token: yup.string().required("El token es obligatorio").max(20, 'El token no puede exceder los 20 caracteres')
});

export default function Eliminar({id, ruta, cerrarModal}){

    const [habilitado, setHabilitado] = useState(true);
    const [loader, setLoader] = useState(false);   

    const continuar = () =>{
        setLoader(true);
        instance.post(ruta, {codigo: id}).then(res=>{
            let icono = (res.success) ? 'success' : 'error';
            ShowSnackbar(res.message, icono);
            (res.success) ? setHabilitado(false) : null;
            setLoader(false);
        })
    }

    if(loader){
        return <LoaderModal />
    }

    return (
        <Grid container spacing={2}>
            <Grid size={{ xs: 4, sm: 4, md: 3 }} >
                <Box className='animate__animated animate__rotateIn'>
                    <Lottie src={eliminarRegistroJson} autoplay loop />
                </Box>
            </Grid>

            <Grid size={{ xs: 8, sm: 8, md: 9}}>
                <p className='mensajeModal'>
                    ¿Esta seguro que desea eliminar este registro?
                </p>
            </Grid>

            <Grid size={{ xs: 6}} style={{ marginTop: '-2em'}}>
                <Button onClick={cerrarModal} className='modalBtnRojo floatBtnRojo' disabled={!habilitado}
                    startIcon={<ClearIcon />}> Cancelar
                </Button>
            </Grid>

            <Grid size={{ xs: 6 }} style={{ marginTop: '-2em'}}>
                <Button onClick={continuar} className='modalBtnIconoRight' disabled={!habilitado}
                    endIcon={<DeleteIcon />}> Eliminar
                </Button>
            </Grid>

        </Grid>
    )
}

export function EliminarAdjunto({data, eliminarFilasAdjunto, cerrarModal, cantidadAdjunto, ruta}){   
   
    const [habilitado, setHabilitado] = useState(true);
    const [loader, setLoader] = useState(false);

    const continuar = () =>{
        setLoader(true);
        instance.post(ruta, data).then(res=>{
            let icono = (res.success) ? 'success' : 'error';
            ShowSnackbar(res.message, icono);
            (res.success) ? (eliminarFilasAdjunto(data.id),cerrarModal(), cantidadAdjunto(), setHabilitado(false) ) : null;
            setLoader(false);
        })
    }

    if(loader){
        return <LoaderModal />
    }

    return ( 
        <Grid container spacing={2}>

            <Grid size={{ xs: 3, sm: 3, md: 2 }}>
                <Box className='animate__animated animate__rotateIn'>
                    <Lottie src={eliminarRegistroJson} autoplay loop />
                </Box>
            </Grid>

            <Grid size={{ xs: 9, sm: 9, md: 10}}>
                <p className='mensajeModal'>
                    ¿Esta seguro que desea eliminar este archivo adjunto?
                </p>
            </Grid>

            <Grid size={{ xs: 6}}>
                <Button onClick={cerrarModal} className='modalBtnIcono floatBtnRojo' disabled={!habilitado}
                    startIcon={<ClearIcon />}> Cancelar
                </Button>
            </Grid>

            <Grid size={{ xs: 6 }}>
                <Button onClick={continuar} className='modalBtnIconoRight' disabled={!habilitado}
                    endIcon={<DeleteIcon />}> Eliminar
                </Button>
            </Grid>
        </Grid>
    )
}
