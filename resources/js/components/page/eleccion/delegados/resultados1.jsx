import { Fragment } from 'react';
import DescriptionOutlinedIcon from '@mui/icons-material/DescriptionOutlined';
import PeopleAltOutlinedIcon from '@mui/icons-material/PeopleAltOutlined';
import CheckCircleOutlineIcon from '@mui/icons-material/CheckCircle';
import fotoDefault from '../../../../../images/fotoDefault.png';
import HowToVoteIcon from '@mui/icons-material/HowToVote';
import { Grid, Box, Button } from '@mui/material';
import "../../../../../scss/resultados.scss";


const candidatosAgencia1 = [
    {
        id: 1,
        numero: 1,
        nombre: 'María Fernanda Rodríguez',
        votos: 18,
        imagen: null
    },
    {
        id: 2,
        numero: 2,
        nombre: 'Carlos Alberto Gómez',
        votos: 15,
        imagen: null
    },
    {
        id: 3,
        numero: 3,
        nombre: 'Ana Lucía Martínez',
        votos: 13,
        imagen: null
    },
    {
        id: 4,
        numero: 4,
        nombre: 'Pedro Antonio López',
        votos: 11,
        imagen: null
    },
    {
        id: 5,
        numero: 5,
        nombre: 'Laura Patricia Pérez',
        votos: 9,
        imagen: null
    },
    {
        id: 6,
        numero: 6,
        nombre: 'Jorge Enrique Sánchez',
        votos: 8,
        imagen: null
    },
    {
        id: 7,
        numero: 7,
        nombre: 'Diana Carolina Torres',
        votos: 7,
        imagen: null
    },
    {
        id: 8,
        numero: 8,
        nombre: 'Luis Eduardo Ramírez',
        votos: 6,
        imagen: null
    },
    {
        id: 9,
        numero: 9,
        nombre: 'Sandra Milena Vargas',
        votos: 5,
        imagen: null
    },
    {
        id: 10,
        numero: 10,
        nombre: 'Andrés Felipe Moreno',
        votos: 4,
        imagen: null
    },
    {
        id: 11,
        numero: 11,
        nombre: 'Claudia Marcela Rojas',
        votos: 3,
        imagen: null
    },
    {
        id: 12,
        numero: 12,
        nombre: 'Ricardo Antonio Pérez',
        votos: 2,
        imagen: null
    },
    {
        id: 13,
        numero: 13,
        nombre: 'Mónica Alejandra Díaz',
        votos: 1,
        imagen: null
    },

    // Candidatos adicionales para probar la distribución
    ...Array.from({ length: 53 }, (_, index) => ({
        id: index + 14,
        numero: index + 14,
        nombre: `Candidato de prueba ${index + 14}`,
        votos: 0,
        imagen: null
    }))
];


const candidatosAgencia2 = [
    {
        id: 101,
        numero: 1,
        nombre: 'Natalia Andrea Martínez',
        votos: 14,
        imagen: null
    },
    {
        id: 102,
        numero: 2,
        nombre: 'José Manuel Gómez',
        votos: 11,
        imagen: null
    },
    {
        id: 103,
        numero: 3,
        nombre: 'Paola Andrea Rincón',
        votos: 9,
        imagen: null
    },
    {
        id: 104,
        numero: 4,
        nombre: 'Miguel Ángel Rodríguez',
        votos: 7,
        imagen: null
    },
    {
        id: 105,
        numero: 5,
        nombre: 'Carolina Vargas',
        votos: 5,
        imagen: null
    },
    {
        id: 106,
        numero: 6,
        nombre: 'Fernando Antonio López',
        votos: 4,
        imagen: null
    },
    {
        id: 107,
        numero: 7,
        nombre: 'Adriana Marcela Torres',
        votos: 3,
        imagen: null
    },
    {
        id: 108,
        numero: 8,
        nombre: 'Juan Carlos Pérez',
        votos: 2,
        imagen: null
    },
    {
        id: 109,
        numero: 9,
        nombre: 'Liliana Patricia Díaz',
        votos: 1,
        imagen: null
    },

    ...Array.from({ length: 8 }, (_, index) => ({
        id: index + 110,
        numero: index + 10,
        nombre: `Candidato de prueba ${index + 10}`,
        votos: 0,
        imagen: null
    }))
];


const resultadosPrueba = {

    titulo: 'Elección de Delegados',

    periodo: '2027 - 2030',

    totalHabilitados: 130,

    totalVotos: 118,

    votosValidos: 114,

    votosBlancos: 4,

    agencias: [
        {
            id: 1,
            nombre: 'Agencia Ocaña',
            candidatos: candidatosAgencia1
        },
        {
            id: 2,
            nombre: 'Agencia Ábrego',
            candidatos: candidatosAgencia2
        }
    ]
};


const ResultadosEleccionDelegado = () => {

    const resultados = resultadosPrueba;


    return (

        <Fragment>

            <Box className="resultadosContainer">

                {/* ENCABEZADO */}

                <Box className="resultadosEncabezado">

                    <Box>

                        <span className="tituloCategoria">
                            Resultados oficiales
                        </span>

                        <h1 className="tituloEleccion">
                            {resultados.titulo}
                        </h1>

                        <p className="periodoEleccion">
                            Periodo {resultados.periodo}
                        </p>

                    </Box>


                    <Box className="estadoEleccion">

                        <CheckCircleOutlineIcon />

                        <span>
                            Elección finalizada
                        </span>

                    </Box>

                </Box>


                {/* RESUMEN */}

                <Grid
                    container
                    spacing={2}
                    className="resumenResultados"
                >

                    <Grid size={{ xs: 12, sm: 6, md: 3 }}>

                        <Box className="resumenResultado">

                            <Box className="resumenResultadoIcono">
                                <PeopleAltOutlinedIcon />
                            </Box>

                            <Box>

                                <span>
                                    Electores habilitados
                                </span>

                                <strong>
                                    {resultados.totalHabilitados}
                                </strong>

                            </Box>

                        </Box>

                    </Grid>


                    <Grid size={{ xs: 12, sm: 6, md: 3 }}>

                        <Box className="resumenResultado">

                            <Box className="resumenResultadoIcono">
                                <HowToVoteIcon />
                            </Box>

                            <Box>

                                <span>
                                    Votos registrados
                                </span>

                                <strong>
                                    {resultados.totalVotos}
                                </strong>

                            </Box>

                        </Box>

                    </Grid>


                    <Grid size={{ xs: 12, sm: 6, md: 3 }}>

                        <Box className="resumenResultado">

                            <Box className="resumenResultadoIcono">
                                <CheckCircleOutlineIcon />
                            </Box>

                            <Box>

                                <span>
                                    Votos válidos
                                </span>

                                <strong>
                                    {resultados.votosValidos}
                                </strong>

                            </Box>

                        </Box>

                    </Grid>


                    <Grid size={{ xs: 12, sm: 6, md: 3 }}>

                        <Box className="resumenResultado">

                            <Box className="resumenResultadoIcono">
                                <DescriptionOutlinedIcon />
                            </Box>

                            <Box>

                                <span>
                                    Voto en blanco
                                </span>

                                <strong>
                                    {resultados.votosBlancos}
                                </strong>

                            </Box>

                        </Box>

                    </Grid>

                </Grid>


                {/* RESULTADOS POR AGENCIA */}

                <Box className="resultadosAgencias">

                    {resultados.agencias.map((agencia) => {

                        const totalVotosAgencia = agencia.candidatos.reduce(
                            (total, candidato) => total + candidato.votos,
                            0
                        );

                        return (

                            <Box
                                className="resultadoAgencia"
                                key={agencia.id}
                            >

                                {/* ENCABEZADO AGENCIA */}

                                <Box className="encabezadoAgencia">

                                    <Box>

                                        <span className="tituloCategoria">
                                            Resultados por agencia
                                        </span>

                                        <h2>
                                            {agencia.nombre}
                                        </h2>

                                    </Box>


                                    <Box className="informacionAgencia">

                                        <span>
                                            {agencia.candidatos.length} candidatos
                                        </span>

                                        <span>
                                            {totalVotosAgencia} votos
                                        </span>

                                    </Box>

                                </Box>


                                {/* CANDIDATOS */}

                                <Grid
                                    container
                                    spacing={2}
                                    className="gridResultadosCandidatos"
                                >

                                    {agencia.candidatos.map((candidato) => {

                                        const porcentaje =
                                            resultados.totalVotos > 0
                                                ? (candidato.votos / resultados.totalVotos) * 100
                                                : 0;

                                        return (

                                            <Grid
                                                key={candidato.id}
                                                size={{
                                                    xs: 12,
                                                    sm: 6,
                                                    md: 4
                                                }}
                                            >

                                                <Box className="resultadoCandidato">

                                                    {/* FOTO */}

                                                    <Box className="resultadoAvatar">

                                                        <img
                                                            src={
                                                                candidato.imagen
                                                                    ? candidato.imagen
                                                                    : fotoDefault
                                                            }
                                                            alt={candidato.nombre}
                                                        />

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
                                                                    width: `${porcentaje}%`
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
                                                            {porcentaje.toFixed(2)}%
                                                        </small>

                                                    </Box>

                                                </Box>

                                            </Grid>

                                        );

                                    })}

                                </Grid>

                            </Box>

                        );

                    })}

                </Box>


                {/* VOTO EN BLANCO */}

                <Box className="resultadoVotoBlanco">

                    <Box className="resultadoVotoBlancoIcono">

                        <CheckCircleOutlineIcon />

                    </Box>

                    <Box className="resultadoVotoBlancoInformacion">

                        <span>
                            Opción electoral
                        </span>

                        <h3>
                            Voto en blanco
                        </h3>

                    </Box>

                    <Box className="resultadoVotoBlancoVotos">

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


                {/* ACCIONES */}

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

};


export default ResultadosEleccionDelegado;