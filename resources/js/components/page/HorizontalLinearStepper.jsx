import {useEffect, useState, useCallback, useRef, Fragment } from 'react';
import {Grid, Box, TextField, MenuItem, Stepper, Step, StepLabel, Button, Typography, InputAdornment} from '@mui/material';
import CalendarMonthOutlinedIcon from '@mui/icons-material/CalendarMonthOutlined';
import BadgeOutlinedIcon from '@mui/icons-material/BadgeOutlined';
import { yupResolver } from "@hookform/resolvers/yup";
import { useForm, Controller } from "react-hook-form";
import {ShowSnackbar} from '../layout/snackBar';
import { LoaderModal } from "../layout/loader";
import instance from '../layout/instance';
import * as yup from "yup";

import HowToVoteIcon from '@mui/icons-material/HowToVote';
import AssignmentIndIcon from '@mui/icons-material/AssignmentInd';
import ArrowBackIcon from '@mui/icons-material/ArrowBack';
import SaveIcon from '@mui/icons-material/Save';
import ExitToAppIcon from '@mui/icons-material/ExitToApp';

const steps = [
    'Verificación',
    'Selección',
    'Confirmación'
];

  const candidatos = [
    { id:1, nombre:"María Fernanda Ríos"},
    { id:2, nombre:"Carlos Andrés Pérez"},
    { id:3, nombre:"Luisa Gómez Torres"},
    { id:4, nombre:"Jorge Enrique Díaz" },
    { id:5, nombre:"Ana Patricia Muñoz"},
    { id:6, nombre:"Diego Armando Rojas"},
    { id:7, nombre:"Pepito perez duran chinchilla" },
  ];

const schema = yup.object({
        tipoIdentificacion: yup.string().required('Debe seleccionar un tipo de identificación'),
        numeroDocumento:    yup.string().required("El número de documento es obligatorio"),
        fechaExpedicion:    yup.string().required("La fecha de expedición es obligatoria"),
    });

export default function HorizontalLinearStepper() {

     const { register, handleSubmit,   watch,setValue, reset, control, formState: { errors } } = useForm({
                    resolver: yupResolver(schema),
                    defaultValues:{tipoIdentificacion: '2', numeroDocumento: '1978917', fechaExpedicion: '1998-03-16',  candidato: ""},
                    mode: "onSubmit"
                });

    const [tiposIdentificaciones, setTiposIdentificaciones] = useState([]);
    const [habilitado, setHabilitado] = useState(true);    
    const [skipped, setSkipped] = useState(new Set());
    const [activeStep, setActiveStep] = useState(0);    
    const [loader, setLoader] = useState(false);

    const isStepOptional = useCallback((step) => {
        return step === 1;
    }, []);

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

    const handleSkip = () => {

        if (!isStepOptional(activeStep)) {
            throw new Error(
                "You can't skip a step that isn't optional."
            );
        }

        setActiveStep((prevActiveStep) => prevActiveStep + 1);

        setSkipped((prevSkipped) => {
            const newSkipped = new Set(prevSkipped.values());
            newSkipped.add(activeStep);
            return newSkipped;
        });
    };

    const handleReset = () => {
        setActiveStep(0);
    };

    const previousActiveStepRef = useRef(activeStep);

    const resetButtonRef = useRef(null);
    const nextButtonRef = useRef(null);

    


    const onSubmitConsulta = (formValues) => {
        console.log("Candidato seleccionado:", formValues.candidato);
        handleNext();
        /*setLoader(true);
        instance.post('/consultar/asociados/activo', formValues).then(res => {    
            if(res.success){
                //setValue()
                handleNext();
            }else{
                ShowSnackbar(res.message, 'error')
            }
            setLoader(false);
        });*/
    }

    const onSubmitVoto = (formValues) => {

        handleNext();

    }

    // Control del foco cuando cambia el paso activo
    useEffect(() => {

        const previousActiveStep = previousActiveStepRef.current;

        previousActiveStepRef.current = activeStep;

        // Cuando termina todos los pasos,
        // coloca el foco en el botón Reset.
        if (activeStep === steps.length) {

            resetButtonRef.current?.focus();

            return;
        }

        // Cuando hace Reset después de terminar,
        // coloca el foco en Next.
        if (
            activeStep === 0 &&
            previousActiveStep === steps.length
        ) {

            nextButtonRef.current?.focus();

            return;
        }

        // Si se saltó un paso opcional,
        // coloca el foco en Next.
        if (
            isStepOptional(previousActiveStep) &&
            !isStepOptional(activeStep)
        ) {

            nextButtonRef.current?.focus();
        }

    }, [activeStep, isStepOptional]);


    useEffect(()=>{
        setLoader(true);
        instance.post('/consultar/informacion/elecciones/delegado').then(res=>{
            if(res.success){
                setTiposIdentificaciones(res.tiposIdentificaciones);
            }else{
                ShowSnackbar(res.message, 'error')
            }
            setLoader(false);
        })
    }, []);


    if (loader) {
        return <LoaderModal />;
    }

    return (
        <Fragment> 

            <h1 className="tituloEleccion">
                Elecciones de delegado para el período
                <span>2027 - 2030</span>
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
                                <Grid size={{ xs: 12}} >
                                    <span class="eyebrow">Elección de Delegados 2026</span>
                                    <h1>Verifica tu identidad para votar</h1>
                                    <p class="subtitle">
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
                                                            <InputAdornment >
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
                                        autocomplete="off"
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
                                    <Box class="informacion">
                                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                            <circle cx="12" cy="12" r="10"/><path d="M12 16v-4M12 8h.01"/>
                                        </svg>
                                        <span>Si tus datos no coinciden, comunícate con la cooperativa al <b>311 591 1923</b> antes de intentar nuevamente.</span>
                                    </Box>
                                </Grid>

                                <Grid size={{ xs: 12}} style={{textAlign: 'right'}} >
                                    <button type="submit" class="btn btn-primary">
                                        Verificar identidad
                                        <svg class="arrow" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M5 12h14M13 6l6 6-6 6"/></svg>
                                    </button>
                                </Grid>

                            </Grid>
                        </form>
                    :(activeStep === 1) ?      
                        <form onSubmit={handleSubmit(onSubmitConsulta)}>
                            <Grid container spacing={3}>
                                <Grid size={{ xs: 12 }}>
                                    <div className="list-head">
                                        <div className="list-head-info">
                                            <span className="eyebrow">
                                                Paso 2 · Selección
                                            </span>
                                            <h2>
                                                Elige tu candidato a Delegado
                                            </h2>
                                            <div className="votante-info">
                                                <span className="votante-label">
                                                    Votante
                                                </span>
                                                <strong>
                                                    ramon david salazar rincon
                                                </strong>
                                            </div>

                                            <p className="instruccion-voto">
                                                Selecciona <b>una sola opción</b> o marca <b>Voto en blanco</b>.
                                            </p>
                                            <p className="seguridad-voto">
                                                Tu selección será registrada de forma segura y tu voto será secreto.
                                            </p>
                                        </div>

                                    </div>
                                </Grid>

                                {candidatos.map((res) => (
                                    <Grid
                                        size={{ xs: 12, sm: 6, md: 4 }}
                                        key={res.id}>

                                        <Box
                                            className={`candidate ${
                                                watch("candidato") === res.id
                                                    ? "selected"
                                                    : ""
                                            }`}
                                            onClick={() => setValue("candidato", res.id, {
                                                shouldValidate: true,
                                                shouldDirty: true
                                            })}
                                        >

                                            <div className="avatar">
                                                <span>Foto</span>
                                            </div>
                                            <div className="c-info">
                                                <h3>
                                                    {res.nombre}
                                                </h3>
                                                {res.documento && (
                                                    <p>
                                                        {res.documento}
                                                    </p>
                                                )}
                                            </div>

                                        </Box>
                                    </Grid>
                                ))}

                                <Grid size={{ xs: 12 }}>
                                    <Box
                                        className={`candidate blanco ${
                                            watch("candidato") === "BLANCO"
                                                ? "selected"
                                                : ""
                                        }`}
                                        onClick={() => setValue("candidato", "BLANCO", {
                                            shouldValidate: true,
                                            shouldDirty: true
                                        })}>
                                        <div className="avatar">
                                            ✓
                                        </div>
                                        <div className="c-info">
                                            <h3>
                                                Voto en blanco
                                            </h3>
                                            <p>
                                                No deseo seleccionar ninguno de los candidatos.
                                            </p>
                                        </div>
                                    </Box>
                                </Grid>

                                {errors.candidato && (
                                    <Grid size={{ xs: 12 }}>
                                        <p className="error-candidato">
                                            {errors.candidato.message}
                                        </p>
                                    </Grid>
                                )}

                                <Grid size={{ xs: 6}}>
                                    <Button onClick={handleBack} class="btn btn-ghost" startIcon={<ArrowBackIcon />}>
                                        Volver
                                    </Button>
                                </Grid>

                                <Grid size={{ xs: 6 }} style={{textAlign: 'right'}}>
                                    <Button type="submit" class="btn btn-primary" endIcon={<HowToVoteIcon /> }>
                                        Emitir voto 
                                    </Button>
                                </Grid> 

                            </Grid>
                        </form>
                    :(activeStep === 2) ? 
                        <form onSubmit={handleSubmit(onSubmitVoto)}>
                            <Grid container spacing={3}>

                                <Grid size={{ xs: 12 }}>
                                    <div className="confirmacion-voto">
                                        <span className="eyebrow">
                                            Paso 3 · Confirmación
                                        </span>
                                        <h2>
                                            Confirma tu voto
                                        </h2>
                                        <p className="confirmacion-intro">
                                            Verifica que la selección sea correcta antes de registrar
                                            tu votación.
                                        </p>
                                        <div className="voto-seleccionado">

                                            <div className="voto-seleccionado-foto">
                                                {/* Posteriormente aquí irá la foto */}
                                                <span>Foto</span>
                                            </div>

                                            <div className="voto-seleccionado-info">

                                                <span className="voto-seleccionado-label">
                                                    Tu selección
                                                </span>

                                                <h3>
                                                    peptito perez
                                                </h3>

                                                <p>
                                                    Candidato a Delegado
                                                </p>

                                            </div>

                                            <div className="voto-seleccionado-check">
                                                ✓
                                            </div>

                                        </div>
                                        <div className="mensaje-confirmacion">

                                            <div className="mensaje-confirmacion-icono">
                                                !
                                            </div>

                                            <div>
                                                <strong>
                                                    Antes de registrar tu voto
                                                </strong>

                                                <p>
                                                    Una vez registrado, tu voto será definitivo y
                                                    no podrá ser modificado.
                                                </p>
                                            </div>

                                        </div>
                                    </div>
                                </Grid>

                                <Grid size={{ xs: 6}}>
                                    <Button onClick={handleBack} class="btn btn-ghost" disabled={!habilitado} startIcon={<ArrowBackIcon />}>
                                        Volver
                                    </Button>
                                </Grid>

                                <Grid size={{ xs: 6 }} style={{textAlign: 'right'}}>
                                    <Button type="submit" class="btn btn-primary" disabled={!habilitado} endIcon={<SaveIcon /> }>
                                        Registrar mi voto
                                    </Button>
                                </Grid> 

                            </Grid>
                        </form>
                    :                    
                        <Grid container spacing={3}>
                            <Grid size={{ xs: 12 }}>
                                <div className="confirmacion-voto">
                                    <span className="eyebrow">
                                        Proceso finalzado 
                                    </span>
                                 
                              
                                    <div className="voto-seleccionado">

                                        <div className="voto-seleccionado-foto">                                         
                                            <span>Foto</span>
                                        </div>

                                        <div className="voto-seleccionado-info">

                                            <span className="voto-seleccionado-label">
                                                Votacion realizada por 
                                            </span>
                                            <h3>
                                                peptito perez
                                            </h3>
                                            <p>
                                                Candidato a Delegado numero 27
                                            </p>
                                        </div>
                                        <div className="voto-seleccionado-check">
                                            ✓
                                        </div>
                                    </div>
                                
                                </div>
                            </Grid>

                            <Grid size={{ xs: 12}} style={{textAlign: 'center'}}>
                                <Button onClick={() => setActiveStep(0)} class="btn btn-ghost" disabled={!habilitado} startIcon={<ExitToAppIcon />}>
                                    Cerrar sesión
                                </Button>
                            </Grid>

                        </Grid>
                }
            </Box>

     </Fragment>
    );
}