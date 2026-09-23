import {useEffect, useState, useRef } from 'react';
import {Grid, Box, TextField, MenuItem, Stepper, Step, StepLabel, Button, InputAdornment} from '@mui/material';
import CalendarMonthOutlinedIcon from '@mui/icons-material/CalendarMonthOutlined';
import BadgeOutlinedIcon from '@mui/icons-material/BadgeOutlined';
import AssignmentIndIcon from '@mui/icons-material/AssignmentInd';
import fotoDefault from '../../../../../images/fotoDefault.png'
import ExitToAppIcon from '@mui/icons-material/ExitToApp';
import HowToVoteIcon from '@mui/icons-material/HowToVote';
import ArrowBackIcon from '@mui/icons-material/ArrowBack';
import { yupResolver } from "@hookform/resolvers/yup";
import { useForm, Controller } from "react-hook-form";
import {ShowSnackbar} from '../../../layout/snackBar';
import { LoaderModal } from "../../../layout/loader";
import instance from '../../../layout/instance';
import SaveIcon from '@mui/icons-material/Save';
import TokenIcon from '@mui/icons-material/Token';
import * as yup from "yup";
import "../../../../../scss/eleccionOrganos.scss";

const schema = yup.object({
        numeroDocumento: yup.string().required("El número de documento es obligatorio"),
        token:           yup.string().required("El token es obligatorio"),
    });


export default function frm(){

    const { register, handleSubmit, watch, setValue, reset, setError, clearErrors, control, formState: { errors } } = useForm({
                        resolver: yupResolver(schema),
                        defaultValues:{numeroDocumento: '1978917', token: '146', asociadoId:'', eleccionId:'',  candidato: ""},
                        mode: "onSubmit"
                    });
  
    const [idTipoOrganoHabilitado, setIdTipoOrganoHabilitado] = useState([]);
    const [periodoActivo, setPeriodoActivo] = useState('');
    const [tiposOrganos, setTiposOrganos] = useState([]);
    const [idVotoBlanco, setIdVotoBlanco] = useState(1);
    const [aspirantes, setAspirantes] = useState([]);
    const [skipped, setSkipped] = useState(new Set());
    const [activeStep, setActiveStep] = useState(0); 
    const [delegado, setDelegado] = useState([]);
    const [loader, setLoader] = useState(false);

    const isStepSkipped = (step) => {
        return skipped.has(step);
    };

    const handleNext = () => {
        let newSkipped = skipped;

        if (isStepSkipped(activeStep)) {
            newSkipped = new Set(newSkipped.values());
            newSkipped.delete(activeStep);
        }

        setActiveStep((prevActiveStep) => prevActiveStep + 1);
        setSkipped(newSkipped);
    };

    const handleBack = () => {
        setActiveStep((prevActiveStep) => prevActiveStep - 1);
    };

     const iniciar = () => {
        reset({ numeroDocumento: '', token: '', asociadoId:'', eleccionId:'',  candidato: ""});
        //setDataAspirante([])
        //setAspirantes([]);
        setActiveStep(0)
    };

    const onSubmitConsulta = (formValues) => {
        //setLoader(true);
        instance.post('/consultar/delegados/activo', formValues).then(res => {  
            console.log(res.delegado);
            if(res.success){
                setIdTipoOrganoHabilitado(res.idTipoOrgano);
                setAspirantes(res.aspirantes);
                setDelegado(res.delegado);
                handleNext();
            }else{
                ShowSnackbar(res.message, 'error')
            }
            setLoader(false);
        });
    }

    const onSubmitVoto = (formValues) => {
        handleNext();
        setLoader(true);
        instance.post('/registrar/elecccion/delegado', formValues).then(res=>{
            if(res.success){
                //setDataAspirante(res.aspirante);
                //handleNext();
                /*timerFinalizar.current = setTimeout(() => {
                                                iniciar();
                                            }, 10000);*/
            }else{
                ShowSnackbar(res.message, 'error')
            }
            setLoader(false);
        })
    }

    useEffect(()=>{
        setLoader(true);
        instance.post('/consultar/informacion/organos/eleccion').then(res=>{
            console.log(res.tipoOrganos);
            (res.success) ? (setTiposOrganos(res.tiposOrganos), setPeriodoActivo(res.periodo) ): ShowSnackbar(res.message, 'error');
            setLoader(false);
        });
    }, []);

    if (loader) {
    return <LoaderModal />;
    }

    return (
        <Grid container spacing={4} className="containerElecciones">

            <Grid size={{ xs: 12}}>
                <h1 className="tituloEleccion">
                    ELECCIÓN DE ÓRGANOS DE 
                    <span>ADMINISTRACIÓN</span>
                </h1>
            </Grid>

            <Grid size={{ xs: 12, sm: 4 }}>
                <Box className="eleccionesDelegado">
                    <div className="estadoEleccion">
                        <span class="pulse"></span>
                        Elección activa
                    </div>

                    <h1 className="tituloEleccion1">
                        Elección de Órganos
                    </h1>

                    <p className="subtituloEleccion">
                        Periodo {periodoActivo}
                    </p>  
                
                   {delegado?.nombreCompleto && (
                        <div className="delegadoVerificado">
                            <div className="delegadoEtiqueta">
                                Delegado verificado
                            </div>
                            <div className="delegadoInformacion">
                                <div className="delegadoAvatar">
                                    {delegado.rutaFoto ? (
                                        <img src={delegado.rutaFoto} alt={delegado.nombreCompleto} />
                                    ) : (
                                        <span><img src={fotoDefault} /></span>
                                    )}
                                </div>
                                <div className="delegadoDatos">
                                    <p className="delegadoNombre">
                                        {delegado?.nombreCompleto}
                                    </p>
                                    <p className="delegadoDocumento">
                                        CC&nbsp;&nbsp;{delegado?.deledocumento}
                                    </p>
                                </div>
                            </div>
                        </div>
                    )}

                   <div className="separadorOrganos" />

                    <h2 className="tituloOrganos">
                        Órganos a elegir
                    </h2>     

                    <div className="listaOrganos">
                        {tiposOrganos.map((organo) => {

                            const habilitado =  Number(organo.tiporgid) === Number(idTipoOrganoHabilitado);

                            return (
                                <div key={organo.tiporgid}
                                    className={`organoItem ${
                                        habilitado
                                            ? 'habilitado activo'
                                            : 'organoBloqueado'
                                    }`} >

                                    {habilitado ? (
                                        <div className="organoNumero">
                                            {organo.tiporgid}
                                        </div>
                                    ) : (
                                        <div className="organoBloqueo">
                                            🔒
                                        </div>
                                    )}

                                    <div className="organoContenido">
                                        <p className="organoNombre">
                                            {organo.tiporgnombre}
                                        </p>
                                        <p className="organoEstado">
                                            {habilitado
                                                ? 'En curso — puedes votar'
                                                : 'Pendiente de habilitación'
                                            }
                                        </p>
                                    </div>
                                </div>
                            );
                        })}
                    </div>
              

                </Box>
            </Grid>

            <Grid size={{ xs: 12, sm: 8 }}>
                <Box className="eleccionesDelegado">
                  {
                    (activeStep === 0) ? 
                        <form onSubmit={handleSubmit(onSubmitConsulta)}>
                            <Grid container spacing={4}>
                                <Grid size={{ xs: 12}}>
                                    <span className="tituloCategoria">Paso 1 · Verificación </span>
                                    <h1>Verifica tu identidad para votar</h1>
                                    <p className="subTitulo">
                                        Ingresa tu número de documento y el token de seguridad que la cooperativa te entregó para participar en la elección de órganos.
                                    </p>
                                </Grid> 

                                <Grid size={{ xs: 12, sm: 6 }}>
                                    <TextField
                                        className="campoEleccion"
                                        label="Número de documento"
                                        fullWidth
                                        variant="outlined"
                                        {...register("numeroDocumento")}
                                        error={!!errors.numeroDocumento}
                                        helperText={errors.numeroDocumento?.message}
                                        placeholder="Ej: 1234567890"
                                        type='number'
                                        slotProps={{
                                            input: {
                                                startAdornment: (
                                                    <InputAdornment position="start">
                                                        <BadgeOutlinedIcon />
                                                    </InputAdornment>
                                                ),
                                            },
                                        }}
                                    />
                                </Grid>

                                <Grid size={{ xs: 12, sm: 6 }}>
                                    <TextField
                                        className="campoEleccion"
                                        label="Token"
                                        fullWidth
                                        variant="outlined"
                                        {...register("token")}
                                        error={!!errors.token}
                                        helperText={errors.token?.message}
                                        placeholder="Ej: 9876"
                                        type='number'
                                        slotProps={{
                                            input: {
                                                startAdornment: (
                                                    <InputAdornment position="start">
                                                        <TokenIcon />
                                                    </InputAdornment>
                                                ),
                                            },
                                        }}
                                    />
                                </Grid>

                                <Grid size={{ xs: 12}} style={{textAlign: 'right'}} >
                                    <Button type="submit" className="boton btnFormulario" endIcon={<BadgeOutlinedIcon /> }>
                                        Verificar e iniciar votación
                                    </Button>
                                </Grid>
                            </Grid>
                        </form>
                    :(activeStep === 1) ?
                        <form onSubmit={handleSubmit(onSubmitVoto)}>
                            <Grid container spacing={3}>
                                <Grid size={{ xs: 12 }}>
                                    <Box className="listaCategoria">
                                        <Box className="listaCategoriaInfo">
                                            <span className="tituloCategoria">
                                                Paso 2 · Selección
                                            </span>

                                            <div class="organo-counter" >
                                                <span class="num"><span>0</span>/<span>0</span></span>
                                                <span>seleccionados</span>
                                            </div>

                                            <h2>
                                                Elige tus candidato a particiar del Consejo de Administración
                                            </h2>
                                            <Box className="informacionVotante">
                                                <span className="textoVotante">
                                                    Órgano en votación
                                                </span>
                                                <strong>
                                                    Consejo de Administración
                                                </strong>
                                            </Box>

                                            <p className="instruccionVoto">
                                                Selecciona hasta <b>6</b> candidatos.
                                            </p>
                                        </Box>
                                    </Box>
                                </Grid>
                            
                                <Grid size={{ xs: 12 }}>
                                    <Box
                                        className={`candidato blanco ${
                                            watch("candidato") === idVotoBlanco
                                                ? "selected"
                                                : ""
                                        }`}
                                        onClick={() => setValue("candidato", idVotoBlanco, {
                                            shouldValidate: true,
                                            shouldDirty: true
                                        })}>
                                        <Box className="avatar">
                                            ✓
                                        </Box>
                                        <Box className="informacionCandidato">
                                            <h3>
                                                Voto en blanco
                                            </h3>
                                            <p>
                                                No deseo seleccionar ningún candidato para este órgano.
                                            </p>
                                        </Box>
                                    </Box>
                                </Grid>

                            
                                <Grid size={{ xs: 6}}>
                                    <Button onClick={() => iniciar()} className="boton btnVolver" startIcon={<ArrowBackIcon />}>
                                        Volver
                                    </Button>
                                </Grid>

                                <Grid size={{ xs: 6 }} style={{textAlign: 'right'}}>
                                    <Button type="submit" className="boton btnFormulario" endIcon={<HowToVoteIcon /> }>
                                        Emitir voto 
                                    </Button>
                                </Grid>
                            </Grid>
                        </form>
                    : <Grid container spacing={3} className="animate__animated animate__fadeInUp" >

                    </Grid>
                    }

                </Box>
            </Grid>
        </Grid>
    )
}