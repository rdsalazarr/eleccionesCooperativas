import {useEffect, useState, useRef, Fragment } from 'react';
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
import * as yup from "yup";

const steps = [
    'Verificación',
    'Selección',
    'Confirmación'
];

const schema = yup.object({
        tipoIdentificacion: yup.string().required('Debe seleccionar un tipo de identificación'),
        numeroDocumento:    yup.string().required("El número de documento es obligatorio"),
        fechaExpedicion:    yup.string().required("La fecha de expedición es obligatoria"),
    });

export default function EleccionDelegados() {

    const { register, handleSubmit, watch, setValue, reset, setError, clearErrors, control, formState: { errors } } = useForm({
                    resolver: yupResolver(schema),
                    defaultValues:{tipoIdentificacion: '', numeroDocumento: '', fechaExpedicion: '', asociadoId:'', eleccionId:'',  candidato: ""},
                    mode: "onSubmit"
                });

    const [tiposIdentificaciones, setTiposIdentificaciones] = useState([]);
    const [eleccionDelegado, setEleccionDelegado] = useState([]);
    const [dataAspirante, setDataAspirante] = useState([]);
    const [idVotoBlanco, setIdVotoBlanco] = useState(0);
    const [skipped, setSkipped] = useState(new Set());
    const [aspirantes, setAspirantes] = useState([]);
    const [activeStep, setActiveStep] = useState(0);
    const [asociado, setAsociado] = useState([]);
    const [loader, setLoader] = useState(false);
    const timerFinalizar = useRef(null);

    const fechaActual = new Date();
    const anioActual  = fechaActual.getFullYear();

    const isStepSkipped = (step) => {
        return skipped.has(step);
    };

    const iniciar = () => {
        reset({tipoIdentificacion: '', numeroDocumento: '', fechaExpedicion: '', asociadoId:'', eleccionId:'',  candidato: ""});
        setDataAspirante([])
        setAspirantes([]);
        setActiveStep(0)
    };

    const finalizar = () => {

        if (timerFinalizar.current) {
            clearTimeout(timerFinalizar.current);
            timerFinalizar.current = null;
        }

        iniciar();
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

    const onSubmitConsulta = (formValues) => {
        setLoader(true);
        instance.post('/consultar/asociados/activo', formValues).then(res => {
            if(res.success){
                setValue('asociadoId', res.asociadoId);
                setValue('eleccionId', res.eleccionId);
                setIdVotoBlanco(res.idVotoBlanco);
                setAspirantes(res.aspirantes);
                setAsociado(res.asociado);
                handleNext();
            }else{
                ShowSnackbar(res.message, 'error')
            }
            setLoader(false);
        });
    }
    
    const onSubmitEleccion = (formValues) => {

        const candidatoSeleccionado = formValues.candidato;
        if (candidatoSeleccionado === "" || candidatoSeleccionado === null || candidatoSeleccionado === undefined) {
             setError('candidato', {type: 'manual',  message: 'Debe seleccionar un candidato o el voto en blanco' });
            return;
        }
        clearErrors('candidato');

        if (Number(candidatoSeleccionado) === Number(idVotoBlanco)) {
            setDataAspirante({
                nombreCompleto: "Voto en blanco",
                eldeasnumero: null,
                eldeasimagen: false,
                rutaFoto: null,
                esVotoBlanco: true
            });
            handleNext();
            return;
        }

        const candidato = aspirantes.find((res) => Number(res.eldeasid) === Number(candidatoSeleccionado));
        if (!candidato) {
            ShowSnackbar("No fue posible identificar el candidato seleccionado", "error");
            return;
        }

        setDataAspirante({
            eldeasid: candidato.eldeasid,
            nombreCompleto: candidato.nombreCompleto,
            eldeasnumero: candidato.eldeasnumero,
            eldeasimagen: candidato.eldeasimagen,
            rutaFoto: candidato.rutaFoto,
            esVotoBlanco: false
        });

        handleNext();
    }

    const onSubmitVoto = (formValues) => {
        setLoader(true);
        instance.post('/registrar/elecccion/delegado', formValues).then(res=>{
            if(res.success){
                setDataAspirante(res.aspirante);
                handleNext();
                timerFinalizar.current = setTimeout(() => {
                                                iniciar();
                                            }, 6000);
            }else{
                ShowSnackbar(res.message, 'error')
            }
            setLoader(false);
        })
    }

    useEffect(()=>{
        setLoader(true);
        instance.post('/consultar/informacion/elecciones/delegado').then(res=>{
            if(res.success){
                setTiposIdentificaciones(res.tiposIdentificaciones);
                setEleccionDelegado(res.eleccionDelegado);
            }else{
                ShowSnackbar(res.message, 'error')
            }
            setLoader(false);
        });
    }, []);

    useEffect(() => {
        return () => {
            if (timerFinalizar.current) {
                clearTimeout(timerFinalizar.current);
            }
        };
    }, []);

    if (loader) {
        return <LoaderModal />;
    }

    return (
        <Fragment> 

            <h1 className="tituloEleccion">
                {eleccionDelegado?.eledeltitulo}
                <span>{eleccionDelegado.eledelperiodo}</span>
            </h1>

            <Stepper activeStep={activeStep} className="progress">

                {steps.map((label, index) => {

                    const stepProps = {};
                    const labelProps = {};

                    if (isStepSkipped(index)) {
                        stepProps.completed = false;
                    }

                    return (
                        <Step
                            key={label}
                            {...stepProps}
                        >

                            <StepLabel {...labelProps}>
                                {label}
                            </StepLabel>

                        </Step>
                    );
                })}

            </Stepper>

            <Box className='eleccionesDelegado'>
                {
                    (activeStep === 0) ? 
                        <form onSubmit={handleSubmit(onSubmitConsulta)}>
                            <Grid container spacing={4}>
                                <Grid size={{ xs: 12}}>
                                    <span className="tituloCategoria">Elección de Delegados {anioActual}</span>
                                    <h1>Verifica tu identidad para votar</h1>
                                    <p className="subtitle">
                                        Ingresa tu número de documento y la fecha de expedición tal como aparecen en tu cédula. 
                                        Validaremos tus datos contra los asociados habilitados.
                                    </p>
                                </Grid>
                                
                                <Grid size={{ xs: 12, sm: 4 }}>
                                    <Controller
                                        name="tipoIdentificacion"
                                        control={control}
                                        render={({ field }) => (
                                            <TextField
                                                select
                                                autoFocus
                                                label="Tipo de identificación"
                                                fullWidth
                                                className="campoEleccion"
                                                variant="outlined"
                                                {...field}
                                                error={!!errors.tipoIdentificacion}
                                                helperText={errors.tipoIdentificacion?.message}
                                                slotProps={{
                                                    input: {
                                                        startAdornment: (
                                                            <InputAdornment position="start" >
                                                                <AssignmentIndIcon />
                                                            </InputAdornment>
                                                        ),
                                                    },
                                                }}
                                            >
                                                <MenuItem value="">Seleccione</MenuItem>
                                                {tiposIdentificaciones.map(res => (
                                                    <MenuItem value={res.tipideid} key={res.tipideid}> {res.tipidenombre}</MenuItem>
                                                ))}
                                            </TextField>
                                        )}
                                    />
                                </Grid>

                                <Grid size={{ xs: 12, sm: 4 }}>
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

                                <Grid size={{ xs: 12, sm: 4 }}>
                                    <TextField
                                        className="campoEleccion"
                                        label="Fecha de expedición"
                                        fullWidth
                                        variant="outlined"
                                        type="date"
                                        {...register("fechaExpedicion")}
                                        error={!!errors.fechaExpedicion}
                                        helperText={errors.fechaExpedicion?.message}
                                        slotProps={{
                                            input: {
                                                startAdornment: (
                                                    <InputAdornment position="start">
                                                        <CalendarMonthOutlinedIcon />
                                                    </InputAdornment>
                                                ),
                                            },
                                        }}
                                    />
                                </Grid>

                                <Grid size={{ xs: 12}} >
                                    <Box className="informacion">
                                        <span>Si tus datos no coinciden, comunícate con la cooperativa al <b>311 591 1923</b> antes de intentar nuevamente.</span>
                                    </Box>
                                </Grid>

                                <Grid size={{ xs: 12}} style={{textAlign: 'right'}} >
                                    <Button type="submit" className="boton btnFormulario" endIcon={<BadgeOutlinedIcon /> }>
                                         Verificar identidad
                                    </Button>
                                </Grid>
                            </Grid>
                        </form>
                    :(activeStep === 1) ?
                        <form onSubmit={handleSubmit(onSubmitEleccion)}>
                            <Grid container spacing={3}>
                                <Grid size={{ xs: 12 }}>
                                    <Box className="listaCategoria">
                                        <Box className="listaCategoriaInfo">
                                            <span className="tituloCategoria">
                                                Paso 2 · Selección
                                            </span>
                                            <h2>
                                                Elige tu candidato a Delegado
                                            </h2>
                                            <Box className="informacionVotante">
                                                <span className="textoVotante">
                                                    Votante
                                                </span>
                                                <strong>
                                                    {asociado.asocnombrecompleto}
                                                </strong>
                                            </Box>

                                            <p className="instruccionVoto">
                                                Selecciona <b>una sola opción</b> o marca <b>Voto en blanco</b>.
                                            </p>
                                            <p className="seguridadVoto">
                                                Tu selección será registrada de forma segura y tu voto será secreto.
                                            </p>
                                        </Box>

                                    </Box>
                                </Grid>

                                {aspirantes.map((res) => (
                                    <Grid
                                        size={{ xs: 12, sm: 6, md: 4 }}
                                        key={res.eldeasid}>

                                        <Box
                                            className={`candidato ${
                                                watch("candidato") === res.eldeasid
                                                    ? "selected"
                                                    : ""
                                            }`}
                                            onClick={() => setValue("candidato", res.eldeasid, {
                                                shouldValidate: true,
                                                shouldDirty: true
                                            })}
                                        >

                                            <Box className="avatar">
                                                {res.eldeasimagen ? (
                                                    <img src={res.rutaFoto} alt={res.nombreCompleto} />
                                                ) : (
                                                    <span><img src={fotoDefault} /> {res.eldeasnumero}</span>
                                                )}
                                            </Box>

                                            <Box className="informacionCandidato">
                                                <h3>
                                                    {res.nombreCompleto}
                                                </h3>
                                                <span className="numeroInscripcion">
                                                    Nº {res.eldeasnumero}
                                                </span>
                                            </Box>
                                        </Box>
                                    </Grid>
                                ))}

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
                                                No deseo seleccionar ninguno de los candidatos.
                                            </p>
                                        </Box>
                                    </Box>
                                </Grid>

                                {errors.candidato && (
                                    <Grid size={{ xs: 12 }}>
                                        <p className="errorCandidato">
                                            {errors.candidato.message}
                                        </p>
                                    </Grid>
                                )}

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
                    :(activeStep === 2) ? 
                        <form onSubmit={handleSubmit(onSubmitVoto)}>
                            <Grid container spacing={3} >

                                <Grid size={{ xs: 12 }}  className="animate__animated animate__zoomIn">
                                    <Box className="confirmacionVoto">
                                        <span className="tituloCategoria">
                                            Paso 3 · Confirmación
                                        </span>
                                        <h2>
                                            Confirma tu voto
                                        </h2>
                                        <p className="confirmacionEntrada">
                                            Verifica que la selección sea correcta antes de registrar
                                            tu votación.
                                        </p>
                                        <Box className="votoSeleccionado">
                                            <Box className="votoSeleccionadoFoto">
                                                  {dataAspirante?.esVotoBlanco ? (
                                                    <span className="votoBlancoIcono">✓</span>
                                                ) : dataAspirante?.eldeasimagen ? (
                                                    <img
                                                        src={dataAspirante.rutaFoto}
                                                        alt={dataAspirante.nombreCompleto}
                                                    />
                                                ) : (
                                                    <img
                                                        src={fotoDefault}
                                                        alt="Foto no disponible"
                                                    />
                                                )}
                                            </Box>
                                            <Box className="votoSeleccionadoInfo">
                                                <span className="votoSeleccionadoLabel">
                                                    Tu selección
                                                </span>
                                                <h3>
                                                    {dataAspirante?.nombreCompleto}
                                                </h3>
                                                <p>
                                                    {dataAspirante?.esVotoBlanco
                                                        ? "Voto en blanco"
                                                        : `Candidato a Delegado Nº ${dataAspirante?.eldeasnumero}`
                                                    }
                                                </p>
                                            </Box>
                                            <Box className="votoSeleccionadoCheck">
                                                ✓
                                            </Box>
                                        </Box>
                                        <Box className="mensajeConfirmacion">
                                            <Box className="mensajeConfirmacionIcono">
                                                !
                                            </Box>
                                            <Box>
                                                <strong>
                                                    Antes de registrar tu voto
                                                </strong>
                                                <p>
                                                    Una vez registrado, tu voto será definitivo y
                                                    no podrá ser modificado.
                                                </p>
                                            </Box>
                                        </Box>
                                    </Box>
                                </Grid>

                                <Grid size={{ xs: 6}}>
                                    <Button onClick={handleBack} className="boton btnVolver" startIcon={<ArrowBackIcon />}>
                                        Volver
                                    </Button>
                                </Grid>

                                <Grid size={{ xs: 6 }} style={{textAlign: 'right'}}>
                                    <Button type="submit" className="boton btnFormulario" endIcon={<SaveIcon /> }>
                                        <span className="textoLargo">Registrar mi voto</span>
                                        <span className="textoCorto">Registrar</span>
                                    </Button>
                                </Grid> 

                            </Grid>
                        </form>
                    :
                        <Grid container spacing={3} className="animate__animated animate__fadeInUp" >
                            <Grid size={{ xs: 12 }}>
                                <Box className="confirmacionVoto">
                                    <span className="tituloCategoria">
                                        Proceso finalzado 
                                    </span>
                                    <Box className="votoSeleccionado">
                                        <Box className="votoSeleccionadoFoto">
                                           {dataAspirante.eldeasimagen ? (
                                                <img src={dataAspirante.rutaFoto} alt={dataAspirante.nombreCompleto} />
                                            ) : (
                                                <span><img src={fotoDefault} /> {dataAspirante.eldeasnumero}</span>
                                            )}
                                        </Box>
                                        <Box className="votoSeleccionadoInfo">
                                            <span className="votoSeleccionadoLabel">
                                                Votacion realizada por 
                                            </span>
                                            <h3>
                                                {dataAspirante?.nombreCompleto}
                                            </h3>
                                            <p>
                                                Candidato a Delegado Número ({dataAspirante?.eldeasnumero})
                                            </p>
                                        </Box>
                                        <Box className="votoSeleccionadoCheck">
                                            ✓
                                        </Box>
                                    </Box>
                                </Box>
                            </Grid>

                            <Grid size={{ xs: 12}} style={{textAlign: 'center'}}>
                                <Button onClick={() => finalizar()} className="boton btnVolver" startIcon={<ExitToAppIcon />}>
                                    Cerrar sesión
                                </Button>
                            </Grid>

                        </Grid>
                }
            </Box>

     </Fragment>
    );
}