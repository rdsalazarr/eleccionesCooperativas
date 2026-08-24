
import { useState, useEffect, Fragment } from 'react';
import { Box, Grid, Card, CardContent, Stack, Avatar, IconButton, Badge, Typography, Menu, MenuItem, Divider, Button} from '@mui/material';
import NotificationsIcon from '@mui/icons-material/NotificationsActive';
import VisibilityIcon from '@mui/icons-material/Visibility';
import LockIcon from '@mui/icons-material/Lock';
import MailIcon from '@mui/icons-material/Mail';
import logo from "../../../images/logo.png";
import "../../../scss/general.scss";
import instance from './instance';

export function Header(){

    return (
        <Box className={'banner animate__animated animate__fadeInDown'}>
            <Box className='container'>
                <Grid container spacing={2}>
                    <Grid size={{ xs: 9, sm: 9, md: 10 }}>
                        <Box className='contenidoBanner'>
                            <h1>IMPLESOFT S.A.S</h1>
                            <h5>Sistema de elecciones</h5>
                        </Box>
                    </Grid>
                    <Grid size={{ xs: 3, sm: 3, md: 2 }}>
                        <a href="/">
                            <img src={logo} alt="Logo" className='logo'/> 
                        </a>
                    </Grid>
                </Grid>
            </Box>
        </Box>
    )
}

export function Footer(){
    var fechaActual = new Date();
    var anioActual  = fechaActual.getFullYear();
    return (
        <footer className={'footer animate__animated animate__fadeInUp'}>
            <Box className='piePagina'>
                <Box className='container'>
                    <Grid container spacing={2}>
                        <Grid size={{ xs: 12, sm: 6, md: 5 }} className='pieContainer'>
                            <h4 className='pieSeccion'>Empresa</h4>
                            <p>IMPLESOFT S.A.S - Norte De Santander</p>
                            <p>Dirección:  Carrera 4 N 36 49 - Santa Clara</p>
                            <p>Correo:  radasa10@hotmail.com</p>
                            <p>Teléfono: 3204018506</p>
                        </Grid>

                        <Grid size={{ xs: 12, sm: 7, md: 7 }}>
                            <h4 className='pieSeccion'>Información</h4>
                            <p>Horarios de atención</p>
                            <p>Lunes a Viernes De 8:00 a.m a 1:00 p.m y de 2:00 p.m a 5:00 p.m</p>
                            <p>Código Postal: 205030</p>
                        </Grid>

                        <Grid size={{ xs: 12 }}>
                            <Box className="pieBottom">
                                <span>IMPLESOFT | Todos los derechos reservados | Copyright © 2020 - {anioActual}</span>
                                <span className='implesoft'>Diseño y desarrollo <a href="http://implesoft.com/" target="_black" title="Implesoft.com">Implesoft.com</a> (Versión: 3.0) <a href="/admin"  title="admin"><LockIcon className='implesoft' /></a>
                                    </span>
                            </Box>
                        </Grid>
                    </Grid>
                </Box>
            </Box>
        </footer>
    )
}

export function HeaderAdmon(){

    const [notificaciones, setNotificaciones] = useState([]);  
    const [mostarDatos , setMostarDatos] = useState(false);
    const [anchorNotif, setAnchorNotif] = useState(null);
    const [indicadores, setIndicadores] = useState([]);
    const [nameUser , setNameUser] = useState('');
   
    const handleOpenNotif = (event) => {
        setAnchorNotif(event.currentTarget);
    };

    const handleCloseNotif = () => {
        setAnchorNotif(null);
    };
 
    /*useEffect(() => {
        instance.post('/admin/consultar/informacion/usuario').then(res=>{
             if(res.success){
                setIndicadores(res.indicadores);
                setNameUser(res.nombreUsuario);
                setMostarDatos(true);
             }
         });
     }, []);*/

    return (
        <Box className={"headerAdmon"}>
            <Grid container spacing={2}>
                <Grid size={{ xs: 1, sm:1, md: 1}} />
                <Grid size={{ xs: 6, sm: 6, md: 8 }} style={{ display: 'flex', alignItems: 'center', justifyContent: 'center' }} >
                    <h2>Administración del sistema de elecciones</h2>
                </Grid>  
                <Grid size={{ xs: 5, sm: 5, md: 3 }}>
                          
                </Grid>
            </Grid>
        </Box>
    )
}

export function FooterAdmon() {
    const fechaActual = new Date();
    const anioActual = fechaActual.getFullYear();

    return (
        <Box className='footerAdmon'>
            <Grid container spacing={2}>
                <Grid size={{ xs: 12, sm: 7}} className='borderRight'>
                    <Box className='tituloFooter'>
                        <p>Sistema de Elecciones</p>
                    </Box>
                </Grid>
                 <Grid size={{ xs: 12, sm: 5 }}>
                    <Box className='derechosReservados'>
                        <span className='implesoft'>
                            Todos los derechos Reservados | Copyright Coopigon |  Diseño y desarrollo<a href='https://implesoft.com/' target="_black" title="Implesoft.com" >Implesoft</a> © 2020 - {anioActual}
                        </span>
                    </Box>
                </Grid>
            </Grid>
        </Box>
    );
}

export function TabPanel(props) {
    const {children, value, index, ...other} = props;
    return (
        <Box
            role="tabpanel"
            hidden={value !== index}
            id={`scrollable-prevent-tabpanel-${index}`}  
            aria-labelledby={`scrollable-prevent-tab-${index}`}
            {...other}
        >
            <Card> 
                <CardContent>
                    {value === index && ( children)} 
                </CardContent>
            </Card>
        </Box>
    );
}

export function Contador({tiempoInicial, onTiempoFinalizado}){
    const [contador, setContador] = useState(tiempoInicial);
  
    useEffect(() => {
      const intervalo = setInterval(() => {
        setContador((prevContador) => prevContador - 1);
      }, 1000);
  
      return () => {
        clearInterval(intervalo);
      };
    }, []);
  
    useEffect(() => {
      if (contador === 0) {
        onTiempoFinalizado();
        clearInterval(intervalo);
      }
    }, [contador]); 
  
    return ( 
        <>{contador} </> 
    );
}

export function FormatearNumero({numero}){
    const opciones = { style: 'decimal', minimumFractionDigits: 0, maximumFractionDigits: 2 };
    return Number(numero).toLocaleString('es-CO', opciones);
}