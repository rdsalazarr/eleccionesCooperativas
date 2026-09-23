import {useState, useEffect, Fragment } from 'react';
import DescriptionOutlinedIcon from '@mui/icons-material/DescriptionOutlined';
import PeopleAltOutlinedIcon from '@mui/icons-material/PeopleAltOutlined';
import CheckCircleOutlineIcon from '@mui/icons-material/CheckCircle';
import fotoDefault from '../../../../../images/fotoDefault.png';
import { Grid, Box, Button, Tab, Tabs } from '@mui/material';
import HowToVoteIcon from '@mui/icons-material/HowToVote';
import {ShowSnackbar} from '../../../layout/snackBar';
import { LoaderModal } from "../../../layout/loader";
import { TabPanel } from '../../../layout/general';
import instance from '../../../layout/instance';
import "../../../../../scss/resultados.scss";

export default function Resultados(){

    const [resultados, setResultados] = useState({ agencias: [], totalAsociadosHabiles: 0, totalVotosBlanco: 0, totalVotosRealizados: 0, totalVotosRegistrados: 0});
    const [variantTab, setVariantTab] = useState((window.innerWidth <= 768) ? 'scrollable' : 'fullWidth');
    const [loader, setLoader] = useState(false);
    const [value, setValue] = useState(0); 

    const handleChangeTab = (event, newValue) => {
        setValue(newValue);
    };

    const ResultadosAgencia = ({ id }) => {
        const agencia = resultados.agencias.find(
            (item) => Number(item.agenid) === Number(id)
        );

        if (!agencia) {
            return null;
        }

        const totalVotosAgencia = agencia.candidatos.reduce(
            (total, candidato) =>
                total + Number(candidato.totalVotos || 0),
            0
        );

        const totalVotosBlancoAgencia     = Number(agencia.totalVotosBlanco?.totalVotos || 0);
        const totalVotosEmitidosAgencia   = totalVotosAgencia + totalVotosBlancoAgencia;
        const porcentajeVotoBlancoAgencia = totalVotosEmitidosAgencia > 0
                                                ? (
                                                    (totalVotosBlancoAgencia / totalVotosEmitidosAgencia) * 100
                                                ).toFixed(2)
                                                : '0.00';
        return (
            <Fragment>
                <Box className="resultadoAgencia">
                    <Box className="encabezadoAgencia">
                        <Box>
                            <span className="tituloCategoria">
                                Resultados por agencia
                            </span>
                            <h2>
                                {agencia.agennombre}
                            </h2>
                        </Box>
                        <Box className="informacionAgencia">
                            <span>
                                {agencia.candidatos.length} candidatos
                            </span>

                            <span>
                                {totalVotosEmitidosAgencia} votos
                            </span>
                        </Box>
                    </Box>

                    <Grid container spacing={2} className="gridResultadosCandidatos" >
                        {agencia.candidatos.map((candidato) => {
                            // Porcentaje del candidato sobre TODOS los votos emitidos en la agencia
                            const porcentaje =  totalVotosEmitidosAgencia > 0
                                                    ? (
                                                        (Number(candidato.totalVotos || 0) /
                                                            totalVotosEmitidosAgencia) * 100
                                                    )
                                                    : 0;
                            return (
                                <Grid key={candidato.eldeasnumero} size={{ xs: 12, sm: 6, md: 4 }}>
                                    <Box className="resultadoCandidato">
                                        <Box className="resultadoAvatar">
                                            <img
                                                src={
                                                    candidato.rutaFoto
                                                        ? candidato.rutaFoto
                                                        : fotoDefault
                                                }
                                                alt={candidato.nombreCompleto}
                                            />
                                        </Box>
                                        <Box className="resultadoInformacion">
                                            <span className="numeroCandidato">
                                                Candidato Nº {candidato.eldeasnumero}
                                            </span>
                                            <h3>
                                                {candidato.nombreCompleto}
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
                                        <Box className="resultadoVotos">
                                            <strong>
                                                {candidato.totalVotos}
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
                            {totalVotosBlancoAgencia}
                        </strong>
                        <span>
                            votos
                        </span>
                        <small>
                            {porcentajeVotoBlancoAgencia}%
                        </small>
                    </Box>
                </Box>

            </Fragment>
        );
    };

    useEffect(()=>{
        setLoader(true);
        instance.post('/obtener/resultado/eleccion/delegado').then(res=>{
            (res.success) ? setResultados(res.data) : ShowSnackbar(res.message, 'error');
            setLoader(false);
        });
    }, []);

    if (loader) {
        return <LoaderModal />;
    }  

    return (
        <Grid container spacing={2} className='containerResultados'>
            <Grid size={{ xs: 12}} >
                <h1 className="tituloResultados">
                 RESULTADOS OFICIALES DE {resultados?.titulo}
                <span>{resultados?.periodo}</span>
                </h1>
            </Grid>

            <Grid size={{ xs: 6, sm: 6, md: 3 }}>
                <Box className="resumenResultado">
                    <Box className="resumenResultadoIcono">
                        <PeopleAltOutlinedIcon />
                    </Box>
                    <Box>
                        <span>
                            Asociados habilitados
                        </span>
                        <strong>
                            {resultados?.totalAsociadosHabiles}
                        </strong>
                    </Box>
                </Box>
            </Grid>
 
            <Grid size={{ xs: 6, sm: 6, md: 3 }}>
                <Box className="resumenResultado">
                    <Box className="resumenResultadoIcono">
                        <HowToVoteIcon />
                    </Box>
                    <Box>
                        <span>
                            Total votantes
                        </span>
                        <strong>
                            {resultados?.totalVotosRegistrados}
                        </strong>
                    </Box>
                </Box>
            </Grid>

            <Grid size={{ xs: 6, sm: 6, md: 3 }}>
                <Box className="resumenResultado">
                    <Box className="resumenResultadoIcono">
                        <CheckCircleOutlineIcon />
                    </Box>
                    <Box>
                        <span>
                            Votos por candidatos
                        </span>
                        <strong>
                            {resultados.totalVotosRealizados}
                        </strong>
                    </Box>
                </Box>
            </Grid>

            <Grid size={{ xs: 6, sm: 6, md: 3 }}>
                <Box className="resumenResultado">
                    <Box className="resumenResultadoIcono">
                        <DescriptionOutlinedIcon />
                    </Box>
                    <Box>
                        <span>
                            Voto en blanco
                        </span>
                        <strong>
                            {resultados?.totalVotosBlanco}
                        </strong>
                    </Box>
                </Box>
            </Grid>

            <Grid size={{ xs: 12}} >
                <Tabs value={value} onChange={handleChangeTab}
                    className="tabsAgencias"
                    variant={variantTab} >
                    {resultados.agencias?.map((agencia) =>(
                        <Tab label={agencia.agennombre} key={agencia.agenid} />
                    ))}
                </Tabs>

                {resultados.agencias?.map((agencia, index) => (
                    <TabPanel value={value} index={index} key={agencia.agenid} >
                        <ResultadosAgencia
                           id={agencia.agenid}
                        /> 
                    </TabPanel>
                ))}
            </Grid>

            <Grid size={{ xs: 12}} style={{textAlign: 'center', marginBottom: '3em', marginTop: '1em' }} >
                <a href="/generar/informe/resultado/delegado/pdf" target="_blank" rel="noopener noreferrer" style={{ textDecoration: 'none' }}>
                    <Button className="boton btnFormulario" startIcon={<DescriptionOutlinedIcon />} >
                        Ver acta de resultados
                    </Button>
                </a>
            </Grid>

        </Grid>
    )
}