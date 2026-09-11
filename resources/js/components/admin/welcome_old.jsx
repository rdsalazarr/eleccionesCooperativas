import React from 'react';
import {
    Box,
    Card,
    CardContent,
    Typography,
    Avatar,
    Chip
} from '@mui/material';

import {
    GroupsOutlined,
    SecurityOutlined,
    FactCheckOutlined,
    TimelineOutlined,
    HowToVoteOutlined,
    CheckCircleOutlined
} from '@mui/icons-material';

import participacionAnimation from '../../../images/json/informeVotacion.json'
import { Lottie } from 'lottie-react';

import "../../../scss/dashboard.scss";
 import TextoAnimado from '../layout/textoAnimado';

const Dashboard = ({ usuario }) => {

    const nombreUsuario = usuario?.nombre || 'Pepito Pérez';

    const caracteristicas = [
        {
            icono: <GroupsOutlined />,
            titulo: 'PARTICIPACIÓN',
            descripcion:'Facilita la administración y seguimiento de los diferentes procesos que intervienen en una jornada electoral.',
            clase: 'dashboard-card-participacion'
        },
        {
            icono: <SecurityOutlined />,
            titulo: 'SEGURIDAD',
            descripcion: 'Protege la información y establece controles durante las diferentes etapas del proceso electoral, contribuyendo a preservar la integridad de la información.',
            clase: 'dashboard-card-seguridad'
        },
        {
            icono: <FactCheckOutlined />,
            titulo: 'CONTROL',
            descripcion: 'Centraliza la información relacionada con los procesos electorales, facilitando su administración, consulta y organización.',
            clase: 'dashboard-card-control'
        }
    ];

    return (
        <Box className="dashboard">

            {/* ENCABEZADO */}
            <Card className="dashboard-hero">

                <Box className="dashboard-hero-content">

                    <Box className="dashboard-hero-text">

                        <Box className="dashboard-status">
                            <span className="dashboard-status-dot"></span>

                            <Typography className="dashboard-status-text">
                                Plataforma operativa
                            </Typography>
                        </Box>

                        <Typography className="dashboard-title">
                            SISTEMA INSTITUCIONAL
                            <br />
                            DE ELECCIONES
                        </Typography>

                        <Typography className="dashboard-subtitle">
                            Tecnología para una gestión electoral
                            <br />
                            moderna, segura y transparente.
                        </Typography>

                    </Box>

                    {/* ELEMENTO VISUAL */}
                    <Box className="dashboard-hero-graphic">

                        <Box className="graphic-circle graphic-circle-1">
                            <HowToVoteOutlined />
                        </Box>

                        <Box className="graphic-circle graphic-circle-2">
                            <CheckCircleOutlined />
                        </Box>

                        <Box className="graphic-line graphic-line-1"></Box>
                        <Box className="graphic-line graphic-line-2"></Box>
                        <Box className="graphic-line graphic-line-3"></Box>

                    </Box>

                    {/* USUARIO */}
                    <Box className="dashboard-user">

                        <Avatar className="dashboard-user-avatar">
                            {nombreUsuario.charAt(0).toUpperCase()}
                        </Avatar>

                        <Box>
                            <Typography className="dashboard-user-label">
                                Sesión iniciada
                            </Typography>

                            <Typography className="dashboard-user-name">
                                <TextoAnimado texto={nombreUsuario} />
                            </Typography>
                        </Box>

                    </Box>

                </Box>

            </Card>


<Card className="dashboard-feature-card">

    <CardContent>

        <Box className="dashboard-feature-animation">
         
            <Lottie src={participacionAnimation} autoplay loop />
        </Box>

        <Box className="dashboard-feature-icon">
            <GroupsOutlined />
        </Box>

        <Typography className="dashboard-feature-title">
            PARTICIPACIÓN
        </Typography>

        <Typography className="dashboard-feature-description">
            Facilita la administración y seguimiento de los
            diferentes procesos que intervienen en una jornada
            electoral.
        </Typography>

        <Typography className="dashboard-feature-footer">
            Registro · Organización · Votación
        </Typography>

    </CardContent>

</Card>


            {/* CARACTERÍSTICAS */}
            <Box className="dashboard-features">

                {caracteristicas.map((item, index) => (

                    <Card
                        key={index}
                        className={`dashboard-feature-card ${item.clase}`}
                    >

                        <CardContent>

                            <Box className="dashboard-feature-icon">
                                {item.icono}
                            </Box>

                            <Typography className="dashboard-feature-title">
                                {item.titulo}
                            </Typography>

                            <Typography className="dashboard-feature-description">
                                {item.descripcion}
                            </Typography>

                        </CardContent>

                    </Card>

                ))}

                <Box className="dashboard-feature-animation">
                    <Lottie
                        animationData={participacionAnimation}
                        loop
                        autoplay
                    />
                </Box>

            </Box>


            {/* TRAZABILIDAD */}
            <Card className="dashboard-traceability">

                <CardContent>

                    <Box className="dashboard-traceability-icon">
                        <TimelineOutlined />
                    </Box>

                    <Box className="dashboard-traceability-content">

                        <Typography className="dashboard-traceability-title">
                            TRAZABILIDAD
                        </Typography>

                        <Typography className="dashboard-traceability-description">
                            Cada proceso cuenta con registro, control y
                            evidencia para facilitar una gestión electoral
                            confiable.
                        </Typography>

                    </Box>

                    <Chip
                        icon={<CheckCircleOutlined />}
                        label="Gestión confiable"
                        className="dashboard-traceability-chip"
                    />

                </CardContent>

            </Card>


            <Box className="dashboard-feature-animation">
    <Lottie
        animationData={participacionAnimation}
        loop
        autoplay
    />
</Box>

        </Box>
    );
};

export default Dashboard;