
import {GroupsOutlined, SecurityOutlined, FactCheckOutlined, TimelineOutlined, HowToVoteOutlined, CheckCircleOutlined} from '@mui/icons-material';
import {Grid, Box, Card, CardContent, Typography, Avatar, Chip} from '@mui/material';
import participacionAnimation from '../../../images/json/informeVotacion.json'
import seguridadAnimation from '../../../images/json/firmarDocumento.json'
import controlAnimation from '../../../images/json/cotrolAnimation.json'
import TextoAnimado from '../layout/textoAnimado';
import { Lottie } from 'lottie-react';
import "../../../scss/dashboard.scss";

export default function welcome({usuario}) {

    const apellidoUsuario = usuario?.apellidos || '';
    const nombreUsuario   = usuario?.nombre || '';

    const caracteristicas = [
            {
                titulo: 'PARTICIPACIÓN',
                descripcion:'Facilita la administración y seguimiento de los diferentes procesos que intervienen en una jornada electoral, desde su organización hasta la participación de los asociados.',
                detalle:'Registro · Organización · Votación',
                icono: <GroupsOutlined />,
                animacion: participacionAnimation,
                clase: 'dashboardCardParticipacion'
            },
            {
                titulo: 'SEGURIDAD',
                descripcion: 'Protege cada etapa del proceso electoral mediante controles orientados a preservar la integridad de la información y garantizar una gestión confiable.',
                detalle: 'Integridad · Protección · Confianza',
                icono: <SecurityOutlined />,
                animacion: seguridadAnimation,
                clase: 'dashboardCardSeguridad'
            },
            {
                titulo: 'CONTROL',
                descripcion: 'Centraliza la información y documentación asociada a los procesos electorales, facilitando su administración, consulta y organización.',
                detalle:'Información · Gestión · Evidencia',
                icono: <FactCheckOutlined />,
                animacion: controlAnimation,
                clase: 'dashboardCardControl'
            }
        ];

    return (
        <Grid className="dashboard">
            <Grid container spacing={2}>
                <Grid size={{ xs: 12}}>
                    <Card className="dashboarPrincipal">
                        <Box className="dashboarPrincipalContenido">
                            <Box className="dashboarPrincipalTexto">
                                <Box className="dashboarEstado">
                                    <span className="dashboarEstadoPunto"></span>
                                    <Typography className="dashboarEstadoTexto">
                                        Plataforma operativa
                                    </Typography>
                                </Box>
                                <Typography className="dashboarTitulo">
                                    SISTEMA INSTITUCIONAL
                                    <br />
                                    DE ELECCIONES 
                                </Typography>

                                <Typography className="dashboarSubTitulo">
                                    Tecnología para una gestión electoral
                                    <br />
                                    moderna, segura y transparente.
                                </Typography>
                            </Box>

                            <Box className="dashboarPrincipalImagen">
                                <Box className="circuloGrafico circuloGrafico-1">
                                    <HowToVoteOutlined />
                                </Box>
                                <Box className="circuloGrafico circuloGrafico-2">
                                    <CheckCircleOutlined />
                                </Box>
                                <Box className="lineaGrafica lineaGrafica-1"></Box>
                                <Box className="lineaGrafica lineaGrafica-2"></Box>
                                <Box className="lineaGrafica lineaGrafica-3"></Box>
                            </Box>

                            <Box className="dashboardUsuario">
                                <Avatar className="dashboardUsuarioAvatar">
                                    {nombreUsuario.charAt(0).toUpperCase()+' '+apellidoUsuario.charAt(0).toUpperCase()}
                                </Avatar>
                                <Box>
                                    <Typography className="dashboardUsuarioTexto">
                                        Sesión iniciada
                                    </Typography>
                                    <Typography className="dashboardUsuarioNombre">
                                        <TextoAnimado texto={nombreUsuario} />
                                    </Typography>
                                </Box>
                            </Box>
                        </Box>
                    </Card>
                </Grid>

                <Grid size={{ xs: 12}}>
                    <Box className="dashboardCaracteristicas">
                        {caracteristicas.map((item, index) => (
                            <Card key={index}
                                className={`dashboardCaracteristicasCard ${item.clase}`} >
                                <CardContent>
                                    <Box className="dashboardCaracteristicasTop">
                                        <Box className="dashboardCaracteristicasIcono">
                                            {item.icono}
                                        </Box>
                                        <Box className="dashboardCaracteristicasLottie">
                                            <Lottie
                                                src={item.animacion}
                                                autoplay
                                                loop
                                            />
                                        </Box>
                                    </Box>
                                    <Typography className="dashboardCaracteristicasTitulo">
                                        {item.titulo}
                                    </Typography>
                                    <Typography className="dashboardCaracteristicasDescripcion">
                                        {item.descripcion}
                                    </Typography>
                                    <Typography className="dashboardCaracteristicasFooter">
                                        {item.detalle}
                                    </Typography>
                                </CardContent>
                            </Card> 
                        ))}
                    </Box>
                </Grid>

                <Grid size={{ xs: 12}}>
                    <Card className="dashboardTrazabilidad">
                        <CardContent>
                            <Box className="dashboardTrazabilidadIcono">
                                <TimelineOutlined />
                            </Box>
                            <Box className="dashboardTrazabilidadContenido">
                                <Typography className="dashboardTrazabilidadTitulo">
                                    TRAZABILIDAD
                                </Typography>
                                <Typography className="dashboardTrazabilidadDescripcion">
                                    Cada proceso cuenta con registro, control y
                                    evidencia que permiten mantener una gestión
                                    electoral organizada, verificable y confiable.
                                </Typography>
                            </Box>
                            <Chip
                                icon={<CheckCircleOutlined />}
                                label="Gestión confiable"
                                className="dashboardTrazabilidadChip"
                            />
                        </CardContent>
                    </Card>
                </Grid>

            </Grid>
        </Grid>
    )
}