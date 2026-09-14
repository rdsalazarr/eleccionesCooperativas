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

import { Lottie } from 'lottie-react';
import participacionAnimation from '../../../images/json/informeVotacion.json'
import seguridadAnimation from '../../../images/json/firmarDocumento.json'
import controlAnimation from '../../../images/json/cotrolAnimation.json'
import "../../../scss/dashboard.scss";


const Dashboard = ({ usuario }) => {

    const nombreUsuario = usuario?.nombre || 'Pepito Pérez';


    const caracteristicas = [
        {
            titulo: 'PARTICIPACIÓN',

            descripcion:
                'Facilita la administración y seguimiento de los diferentes procesos que intervienen en una jornada electoral, desde su organización hasta la participación de los asociados.',

            detalle:
                'Registro · Organización · Votación',

            icono: <GroupsOutlined />,

            animacion: participacionAnimation,

            clase: 'dashboard-card-participacion'
        },

        {
            titulo: 'SEGURIDAD',

            descripcion:
                'Protege cada etapa del proceso electoral mediante controles orientados a preservar la integridad de la información y garantizar una gestión confiable.',

            detalle:
                'Integridad · Protección · Confianza',

            icono: <SecurityOutlined />,

            animacion: seguridadAnimation,

            clase: 'dashboard-card-seguridad'
        },

        {
            titulo: 'CONTROL',

            descripcion:
                'Centraliza la información y documentación asociada a los procesos electorales, facilitando su administración, consulta y organización.',

            detalle:
                'Información · Gestión · Evidencia',

            icono: <FactCheckOutlined />,

            animacion: controlAnimation,

            clase: 'dashboard-card-control'
        }
    ];


    return (

        <Box className="dashboard">
  
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

                    <Box className="dashboard-user">
                        <Avatar className="dashboard-user-avatar">
                            {nombreUsuario.charAt(0).toUpperCase()}
                        </Avatar>
                        <Box>
                            <Typography className="dashboard-user-label">
                                Sesión iniciada
                            </Typography>
                            <Typography className="dashboard-user-name">
                                {nombreUsuario}
                            </Typography>
                        </Box>
                    </Box>
                </Box>
            </Card>



            <Box className="dashboard-features">
                {caracteristicas.map((item, index) => (
                    <Card key={index}
                        className={`dashboard-feature-card ${item.clase}`} >
                        <CardContent>
                            <Box className="dashboard-feature-top">
                                <Box className="dashboard-feature-icon">
                                    {item.icono}
                                </Box>
                                <Box className="dashboard-feature-lottie">
                                    <Lottie
                                        src={item.animacion}
                                        autoplay
                                        loop
                                    />
                                </Box>
                            </Box>

                            <Typography className="dashboard-feature-title">
                                {item.titulo}
                            </Typography>

                            <Typography className="dashboard-feature-description">
                                {item.descripcion}
                            </Typography>

                            <Typography className="dashboard-feature-footer">
                                {item.detalle}
                            </Typography>

                        </CardContent>

                    </Card>

                ))}
            </Box>

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
                            evidencia que permiten mantener una gestión
                            electoral organizada, verificable y confiable.
                        </Typography>
                    </Box>

                    <Chip
                        icon={<CheckCircleOutlined />}
                        label="Gestión confiable"
                        className="dashboard-traceability-chip"
                    />
                </CardContent>
            </Card>
        </Box>

    );
};


export default Dashboard;