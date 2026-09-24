import { useEffect, useState, useRef } from 'react';
import {Grid, Box, TextField, Button, InputAdornment} from '@mui/material';
import BadgeOutlinedIcon from '@mui/icons-material/BadgeOutlined';
import fotoDefault from '../../../../../images/fotoDefault.png'
import HowToVoteIcon from '@mui/icons-material/HowToVote';
import ArrowBackIcon from '@mui/icons-material/ArrowBack';
import { ShowSnackbar } from '../../../layout/snackBar';
import { yupResolver } from "@hookform/resolvers/yup";
import { LoaderModal } from "../../../layout/loader";
import "../../../../../scss/eleccionOrganos.scss";
import TokenIcon from '@mui/icons-material/Token';
import instance from '../../../layout/instance';
import { useForm } from "react-hook-form";
import * as yup from "yup";

const schema = yup.object({
    numeroDocumento: yup.string().required("El número de documento es obligatorio"),
    token: yup.string().required("El token es obligatorio"),
});

export default function frm() {

    const {register, handleSubmit, watch, setValue, reset, setError, clearErrors, formState: { errors }} = useForm({
            resolver: yupResolver(schema),
            defaultValues: {
                numeroDocumento: '1978917',
                token: '',
                candidatos: []
            },
            mode: "onSubmit"
        });

    const [numeroCandidatosSeleccionados, setNumeroCandidatosSeleccionados] = useState(0);
    const [idTipoOrganoHabilitado, setIdTipoOrganoHabilitado] = useState([]);
    const [periodoActivo, setPeriodoActivo] = useState('');
    const [tiposOrganos, setTiposOrganos] = useState([]);
    const [idVotoBlanco, setIdVotoBlanco] = useState(1);
    const [skipped, setSkipped] = useState(new Set());
    const [aspirantes, setAspirantes] = useState([]);
    const [tipoOrgano, setTipoOrgano] = useState([]);
    const [activeStep, setActiveStep] = useState(0);
    const [delegado, setDelegado] = useState([]);
    const [loader, setLoader] = useState(false);
    const timerFinalizar = useRef(null);

    const candidatosSeleccionados = watch("candidatos") || [];
    const maximoCandidatos        = Number(tipoOrgano?.tiporgvotosporpersona || 0);

    const votoEnBlancoSeleccionado = candidatosSeleccionados.some(id => Number(id) === Number(idVotoBlanco));
    const maximoAlcanzado          = candidatosSeleccionados.filter(id => Number(id) !== Number(idVotoBlanco)).length >= maximoCandidatos;

    const seleccionarCandidato = (idCandidato) => {

        const candidatosActuales = watch("candidatos") || [];

        if (Number(idCandidato) === Number(idVotoBlanco)) {
            setValue( "candidatos", [idVotoBlanco],
                {
                    shouldValidate: true,
                    shouldDirty: true
                }
            );
            setNumeroCandidatosSeleccionados(0);
            clearErrors('candidatos');
            return;
        }

        let nuevosCandidatos          = candidatosActuales.filter(id => Number(id) !== Number(idVotoBlanco));
        const candidatoYaSeleccionado = nuevosCandidatos.some(id => Number(id) === Number(idCandidato));

        if (candidatoYaSeleccionado) {
            nuevosCandidatos = nuevosCandidatos.filter(id => Number(id) !== Number(idCandidato));
        } else {
            if (nuevosCandidatos.length >= maximoCandidatos) {
                return;
            }
            nuevosCandidatos.push(idCandidato);
        }

        setValue("candidatos", nuevosCandidatos,
            {
                shouldValidate: true,
                shouldDirty: true
            });

        setNumeroCandidatosSeleccionados(nuevosCandidatos.length);
        clearErrors('candidatos');
    };

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

    const iniciar = () => {

        if (timerFinalizar.current) {
            clearTimeout(timerFinalizar.current);
        }

        reset({numeroDocumento: '1978917', token: '', candidatos: []});
        setNumeroCandidatosSeleccionados(0);
        setTipoOrgano([]);
        setAspirantes([]);
        setActiveStep(0);
        setDelegado([]);
        clearErrors();
    };

    const onSubmitConsulta = (formValues) => {
        setLoader(true);
        instance.post('/consultar/delegados/activo', formValues).then(res => {
            if (res.success) {
                setIdTipoOrganoHabilitado(res.tipoOrgano.tiporgid);
                setIdVotoBlanco(res.idVotoBlanco);
                setTipoOrgano(res.tipoOrgano);
                setAspirantes(res.aspirantes);
                setDelegado(res.delegado);
                handleNext();
            } else {
                ShowSnackbar(res.message, 'error');
            }
            setLoader(false);
        });
    };

    const onSubmitVoto = (formValues) => {
        const candidatos = formValues.candidatos || [];
        if (candidatos.length === 0) {
            setError('candidatos', {type: 'manual', message: 'Debe seleccionar al menos un candidato o el voto en blanco.' });
            return;
        }

        const tieneVotoBlanco  = candidatos.some(id => Number(id) === Number(idVotoBlanco));
        const candidatosReales = candidatos.filter(id => Number(id) !== Number(idVotoBlanco) );

        if (!tieneVotoBlanco &&candidatosReales.length > maximoCandidatos ) {
            setError('candidatos', {type: 'manual', message: `Solo puede seleccionar hasta ${maximoCandidatos} candidatos.`});
            return;
        }
        clearErrors('candidatos');

        setLoader(true);
        instance.post('/registrar/organos/eleccion',formValues ).then(res => {
            if (res.success) {
                handleNext();
                timerFinalizar.current = setTimeout(() => {
                    iniciar();
                }, 10000);
            } else {
                ShowSnackbar(res.message, 'error');
            }
            setLoader(false);
        });
    };

    useEffect(() => {
        setLoader(true);
        instance.post('/consultar/informacion/organos/eleccion').then(res => {
            res.success ? ( setTiposOrganos(res.tiposOrganos), setPeriodoActivo(res.periodo))
                        : ShowSnackbar(res.message, 'error');
            setLoader(false);
        });
    }, []);

    if (loader) {
        return <LoaderModal />;
    }

    return (
        <Box className="containerEleccionesOrganos">
            <Grid container spacing={2} style={{marginBottom:'4em'}} >
                <Grid size={{ xs: 12 }}>
                    <h1 className="tituloEleccionOrganos">
                        ELECCIÓN DE ÓRGANOS DE
                        <span>ADMINISTRACIÓN</span>
                    </h1>
                </Grid>

                <Grid size={{ xs: 12, sm: 4 }}>
                    <Box className="eleccionesDelegado">
                        <Box className="estadoEleccion">
                            <span className="pulse"></span>
                            Elección activa
                        </Box>
                        <h1 className="subTituloEleccionOrganos">
                            Elección de Órganos
                        </h1>
                        <p className="subtituloEleccion">
                            Periodo {periodoActivo}
                        </p>

                        {delegado?.nombreCompleto && (
                            <Box className="delegadoVerificado">
                                <Box className="delegadoEtiqueta">
                                    Delegado verificado
                                </Box>
                                <Box className="delegadoInformacion">
                                    <Box className="delegadoAvatar">
                                        {delegado.rutaFoto ? (
                                            <img src={delegado.rutaFoto} alt={delegado.nombreCompleto} />
                                        ) : (
                                            <span>
                                                <img src={fotoDefault} />
                                            </span>
                                        )}
                                    </Box>

                                    <Box className="delegadoDatos">
                                        <p className="delegadoNombre">
                                            {delegado?.nombreCompleto}
                                        </p>
                                        <p className="delegadoDocumento">
                                            CC&nbsp;&nbsp;{delegado?.deledocumento}
                                        </p>
                                    </Box>
                                </Box>
                            </Box>
                        )}

                        <Box className="separadorOrganos" />

                        <h2 className="tituloOrganos">
                            Órganos a elegir
                        </h2>

                        <Box className="listaOrganos">
                            {tiposOrganos.map((organo) => {

                                const habilitado = Number(organo.tiporgid) === Number(idTipoOrganoHabilitado);

                                return (
                                    <Box key={organo.tiporgid}
                                        className={`organoItem ${
                                            habilitado
                                                ? 'habilitado activo'
                                                : 'organoBloqueado'
                                        }`}
                                    >

                                        {habilitado ? (
                                            <Box className="organoNumero">
                                                {organo.tiporgid}
                                            </Box>
                                        ) : (
                                            <Box className="organoBloqueo">
                                                🔒
                                            </Box>
                                        )}

                                        <Box className="organoContenido">
                                            <p className="organoNombre">
                                                {organo.tiporgnombre}
                                            </p>
                                            <p className="organoEstado">
                                                {habilitado ? 'En curso — puedes votar' : 'Pendiente de habilitación'}
                                            </p>
                                        </Box>
                                    </Box>
                                );
                            })}
                        </Box>
                    </Box>
                </Grid>

                <Grid size={{ xs: 12, sm: 8 }}>
                    <Box className="eleccionesDelegado">
                        {activeStep === 0 ? (
                            <form onSubmit={handleSubmit(onSubmitConsulta)}>
                                <Grid container spacing={4}>
                                    <Grid size={{ xs: 12 }}>
                                        <span className="tituloCategoria">
                                            Paso 1 · Verificación
                                        </span>
                                        <h1>
                                            Verifica tu identidad para votar
                                        </h1>
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
                                            type="number"
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
                                            type="number"
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

                                    <Grid size={{ xs: 12 }} style={{ textAlign: 'right' }} >
                                        <Button type="submit" className="boton btnFormulario" endIcon={<BadgeOutlinedIcon />}>
                                            Verificar e iniciar votación
                                        </Button>
                                    </Grid>
                                </Grid>
                            </form>
                        ) : activeStep === 1 ? (
                            <form onSubmit={handleSubmit(onSubmitVoto)}>
                                <Grid container spacing={3}>
                                    <Grid size={{ xs: 12 }}>
                                        <Box className="listaCategoria">
                                            <Box className="listaCategoriaInfo">
                                                <Grid container spacing={1}>
                                                    <Grid size={{ xs: 6 }}>
                                                        <span className="tituloCategoria">
                                                            Paso 2 · Selección
                                                        </span>
                                                    </Grid>
                                                    <Grid size={{ xs: 6 }} style={{ textAlign: 'right' }}>
                                                        <span className="tituloCategoria">
                                                            <Box style={{
                                                                    display: 'flex',
                                                                    alignItems: 'center',
                                                                    justifyContent: 'flex-end',
                                                                    gap: '8px'
                                                                }}
                                                            >
                                                                <span className="numerosCandidatos">
                                                                    {numeroCandidatosSeleccionados}
                                                                </span>
                                                                /
                                                                <span>
                                                                    {tipoOrgano?.tiporgvotosporpersona}
                                                                </span>
                                                                <span>
                                                                    seleccionados
                                                                </span>
                                                            </Box>
                                                        </span>
                                                    </Grid>
                                                </Grid>
                                                <h2>
                                                    Elige tus candidatos a participar del {tipoOrgano?.tiporgnombre}
                                                </h2>
                                                <Box className="informacionVotante">
                                                    <span className="textoVotante">
                                                        Órgano en votación
                                                    </span>
                                                    <strong>
                                                        {tipoOrgano?.tiporgnombre}
                                                    </strong>
                                                </Box>
                                                <p className="instruccionVoto">
                                                    Selecciona hasta{' '}
                                                    <b>
                                                        {tipoOrgano?.tiporgvotosporpersona}
                                                    </b>{' '}
                                                    candidatos.
                                                </p>
                                            </Box>
                                        </Box>
                                    </Grid>

                                    {aspirantes.map((res) => {
                                        const seleccionado = candidatosSeleccionados.some(id => Number(id) === Number(res.orelpaid));

                                        const deshabilitado = maximoAlcanzado && !seleccionado;

                                        return (
                                            <Grid size={{ xs: 12, sm: 6 }} key={res.orelpaid} >
                                                <Box
                                                    className={`candidato ${
                                                        seleccionado
                                                            ? "selected"
                                                            : ""
                                                    } ${
                                                        deshabilitado
                                                            ? "disabled"
                                                            : ""
                                                    }`}

                                                    onClick={() => {
                                                        if (!deshabilitado) {
                                                            seleccionarCandidato(
                                                                res.orelpaid
                                                            );
                                                        }
                                                    }}>

                                                    <Box className="avatar">
                                                        {res.rutaFoto ? (
                                                            <img
                                                                src={res.rutaFoto}
                                                                alt={res.nombreCompleto}
                                                            />
                                                        ) : (
                                                            <span>
                                                                <img src={fotoDefault} />
                                                                {res.orelpaordenparticipacion}
                                                            </span>
                                                        )}
                                                    </Box>

                                                    <Box className="informacionCandidato">
                                                        <h3>
                                                            {res.nombreCompleto}
                                                        </h3>
                                                        <span className="numeroInscripcion">
                                                            Nº {res.orelpaordenparticipacion}
                                                        </span>
                                                    </Box>
                                                </Box>
                                            </Grid>
                                        );
                                    })}

                                    <Grid size={{ xs: 12 }}>
                                        <Box
                                            className={`candidato blanco ${
                                                votoEnBlancoSeleccionado
                                                    ? "selected"
                                                    : ""
                                            }`}

                                            onClick={() =>
                                                seleccionarCandidato(
                                                    idVotoBlanco
                                                )
                                            }>

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

                                    {errors.candidatos && (
                                        <Grid size={{ xs: 12 }}>
                                            <p className="errorCandidato">
                                                {errors.candidatos.message}
                                            </p>
                                        </Grid>
                                    )}
    
                                    <Grid size={{ xs: 6 }}>
                                        <Button onClick={() => iniciar()} className="boton btnVolver" startIcon={<ArrowBackIcon />} >
                                            Volver
                                        </Button>
                                    </Grid>

                                    <Grid size={{ xs: 6 }} style={{ textAlign: 'right' }} >
                                        <Button type="submit"  className="boton btnFormulario" endIcon={<HowToVoteIcon />}>
                                            Registrar
                                        </Button>
                                    </Grid>
                                </Grid>
                            </form>
                        ) : (
                            <Grid container spacing={2} className="animate__animated animate__fadeInUp">
                                <Grid size={{ xs: 12 }}>
                                    <Box className="mensajeVerificacion">
                                        <Box className="mensajeVerificacionIcon">
                                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                                                <circle cx="12" cy="12" r="10"/>
                                                <path d="M12 6v6l4 2" />
                                            </svg>
                                        </Box>
                                        <h1>
                                            Proceso guardado con éxito
                                        </h1>
                                        <p>
                                            Tu selección para este órgano fue registrada correctamente.
                                        </p>
                                        <Box className="tituloCategoria">
                                            <svg
                                                width="14"
                                                height="14"
                                                viewBox="0 0 24 24"
                                                fill="none"
                                                stroke="currentColor"
                                                strokeWidth="3"
                                            >
                                                <path d="M20 6L9 17l-5-5" />
                                            </svg>
                                            <span id="savedOrgano">
                                                {tipoOrgano?.tiporgnombre}
                                            </span>
                                        </Box>
                                        <p>
                                            Ahora debes esperar a que el presidente cierre este órgano y habilite el siguiente.
                                        </p>
                                        <p>
                                            Esta pantalla se actualiza automáticamente pasado 10 segundos.
                                        </p>
                                    </Box>
                                </Grid>
                            </Grid>
                        )}
                    </Box>
                </Grid>
            </Grid>
        </Box>
    );
}