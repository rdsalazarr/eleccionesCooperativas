import { Fragment } from 'react';
import DescriptionOutlinedIcon from '@mui/icons-material/DescriptionOutlined';
import PeopleAltOutlinedIcon from '@mui/icons-material/PeopleAltOutlined';
import CheckCircleOutlineIcon from '@mui/icons-material/CheckCircle';
import fotoDefault from '../../../../../images/fotoDefault.png'
import HowToVoteIcon from '@mui/icons-material/HowToVote';
import {Grid, Box, Button} from '@mui/material';
import "../../../../../scss/resultados.scss";

const resultadosPrueba = {
    titulo: 'Elección de Delegados',
    periodo: '2027 - 2030',

    totalHabilitados: 76,
    totalVotos: 74,
    votosValidos: 72,
    votosBlancos: 2,

    candidatos: [
        {
            id: 1,
            nombre: 'María Fernanda Rodríguez',
            numero: 1,
            votos: 28,
            porcentaje: 38.89,
            imagen: null
        },
        {
            id: 2,
            nombre: 'Carlos Alberto Gómez',
            numero: 2,
            votos: 21,
            porcentaje: 29.17,
            imagen: null
        },
        {
            id: 3,
            nombre: 'Ana Lucía Martínez',
            numero: 3,
            votos: 15,
            porcentaje: 20.83,
            imagen: null
        },
        {
            id: 4,
            nombre: 'Pedro Antonio López',
            numero: 4,
            votos: 8,
            porcentaje: 11.11,
            imagen: null
        }
    ]
};

export default function Resultados() {

    const resultados = resultadosPrueba;

    return (
        <Fragment>

            {/* TÍTULO DE LA ELECCIÓN */}
            <h1 className="tituloEleccion">
                {resultados.titulo}
                <span>{resultados.periodo}</span>
            </h1>

            <Box className="resultadosEleccion animate__animated animate__fadeInUp">

                {/* ENCABEZADO */}
                <Box className="encabezadoResultados">

                    <span className="tituloCategoria">
                        Resultados oficiales
                    </span>

                    <h2>
                        Presentación de resultados
                    </h2>

                    <p>
                        La jornada electoral ha finalizado y los resultados
                        de la elección han sido publicados oficialmente.
                    </p>

                    <Box className="estadoResultados">
                        <CheckCircleOutlineIcon />
                        <span>
                            Elección finalizada
                        </span>
                    </Box>

                </Box>


                {/* RESUMEN */}
                <Grid container spacing={2.5} className="resumenResultados">

                    <Grid size={{ xs: 12, sm: 6, md: 3 }}>
                        <Box className="tarjetaResultado">

                            <Box className="iconoResultado">
                                <PeopleAltOutlinedIcon />
                            </Box>

                            <span className="resultadoLabel">
                                Habilitados
                            </span>

                            <strong>
                                {resultados.totalHabilitados}
                            </strong>

                            <small>
                                Asociados habilitados
                            </small>

                        </Box>
                    </Grid>

                    <Grid size={{ xs: 12, sm: 6, md: 3 }}>
                        <Box className="tarjetaResultado">

                            <Box className="iconoResultado">
                                <HowToVoteIcon />
                            </Box>

                            <span className="resultadoLabel">
                                Votos registrados
                            </span>

                            <strong>
                                {resultados.totalVotos}
                            </strong>

                            <small>
                                Votos emitidos
                            </small>

                        </Box>
                    </Grid>

                    <Grid size={{ xs: 12, sm: 6, md: 3 }}>
                        <Box className="tarjetaResultado">

                            <Box className="iconoResultado">
                                <CheckCircleOutlineIcon />
                            </Box>

                            <span className="resultadoLabel">
                                Votos válidos
                            </span>

                            <strong>
                                {resultados.votosValidos}
                            </strong>

                            <small>
                                Votos a candidatos
                            </small>

                        </Box>
                    </Grid>

                    <Grid size={{ xs: 12, sm: 6, md: 3 }}>
                        <Box className="tarjetaResultado">

                            <Box className="iconoResultado">
                                ✓
                            </Box>

                            <span className="resultadoLabel">
                                Voto en blanco
                            </span>

                            <strong>
                                {resultados.votosBlancos}
                            </strong>

                            <small>
                                Votos en blanco
                            </small>

                        </Box>
                    </Grid>

                </Grid>


                {/* LISTADO DE RESULTADOS */}
                <Box className="listaResultados">

                    <Box className="cabeceraResultados">

                        <Box>
                            <span className="tituloCategoria">
                                Resultados
                            </span>

                            <h2>
                                Votación por candidato
                            </h2>
                        </Box>

                        <span className="totalVotos">
                            {resultados.totalVotos} votos
                        </span>

                    </Box>


                    <Box className="resultadosCandidatos">

                        {resultados.candidatos.map((candidato, index) => (

                            <Box
                                className="resultadoCandidato"
                                key={candidato.id}
                            >

                                {/* POSICIÓN */}
                                <Box className="posicionCandidato">
                                    {index + 1}
                                </Box>


                                {/* FOTO */}
                                <Box className="resultadoAvatar">

                                    {candidato.imagen ? (
                                        <img
                                            src={candidato.imagen}
                                            alt={candidato.nombre}
                                        />
                                    ) : (
                                        <img
                                            src={fotoDefault}
                                            alt="Foto no disponible"
                                        />
                                    )}

                                </Box>


                                {/* INFORMACIÓN */}
                                <Box className="resultadoInformacion">

                                    <span className="numeroCandidato">
                                        Candidato Nº {candidato.numero}
                                    </span>

                                    <h3>
                                        {candidato.nombre}
                                    </h3>

                                    <Box className="barraResultado">
                                        <Box
                                            className="barraResultadoValor"
                                            style={{
                                                width: `${candidato.porcentaje}%`
                                            }}
                                        />
                                    </Box>

                                </Box>


                                {/* VOTOS */}
                                <Box className="resultadoVotos">

                                    <strong>
                                        {candidato.votos}
                                    </strong>

                                    <span>
                                        votos
                                    </span>

                                    <small>
                                        {candidato.porcentaje.toFixed(2)}%
                                    </small>

                                </Box>

                            </Box>

                        ))}


                        {/* VOTO EN BLANCO */}
                        <Box className="resultadoCandidato votoBlancoResultado">

                            <Box className="posicionCandidato">
                                —
                            </Box>

                            <Box className="resultadoAvatar blanco">
                                ✓
                            </Box>

                            <Box className="resultadoInformacion">

                                <span className="numeroCandidato">
                                    Opción electoral
                                </span>

                                <h3>
                                    Voto en blanco
                                </h3>

                                <Box className="barraResultado">
                                    <Box
                                        className="barraResultadoValor"
                                        style={{
                                            width: `${(
                                                resultados.votosBlancos /
                                                resultados.totalVotos
                                            ) * 100}%`
                                        }}
                                    />
                                </Box>

                            </Box>

                            <Box className="resultadoVotos">

                                <strong>
                                    {resultados.votosBlancos}
                                </strong>

                                <span>
                                    votos
                                </span>

                                <small>
                                    {(
                                        resultados.votosBlancos /
                                        resultados.totalVotos *
                                        100
                                    ).toFixed(2)}%
                                </small>

                            </Box>

                        </Box>

                    </Box>

                </Box>


                {/* INFORMACIÓN FINAL */}
                <Box className="informacionResultados">

                    <Box className="informacionResultadosIcono">
                        <DescriptionOutlinedIcon />
                    </Box>

                    <Box>
                        <strong>
                            Resultados oficiales de la elección
                        </strong>

                        <p>
                            Los resultados presentados corresponden a los votos
                            registrados durante la jornada electoral.
                        </p>
                    </Box>

                </Box>


                {/* BOTÓN DOCUMENTO */}
                <Box className="accionesResultados">

                    <Button
                        className="boton btnFormulario"
                        startIcon={<DescriptionOutlinedIcon />}
                    >
                        Ver acta de resultados
                    </Button>

                </Box>

            </Box>

        </Fragment>
    );
}