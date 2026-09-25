
import { useState, useEffect } from 'react';
import { Box, Grid, Card, CardContent, IconButton} from '@mui/material';
import ExitToAppIcon from '@mui/icons-material/ExitToApp';
import LockIcon from '@mui/icons-material/Lock';
import logo from "../../../images/logo.png";
import "../../../scss/general.scss";
import instance from './instance';

export function Header(){
    return (
        <Box className={'banner animate__animated animate__fadeInDown'}>
            <Box className='container'>
                <Grid container spacing={2}>
                     <Grid size={{ xs: 3, sm: 3, md: 2 }}>
                        <a href="/">
                            <img src={logo} alt="Logo" className='logo'/> 
                        </a>
                    </Grid>
                    <Grid size={{ xs: 9, sm: 9, md: 10 }}>
                        <Box className='contenidoBanner'>
                            <h1>COOPERATIVA ESPECIALIZADA DE AHORRO Y CRÉDITO</h1>
                            <h1>COOPIGON</h1>
                            <h5>SISTEMA DE ELECCIONES </h5>
                        </Box>
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
        <footer className={'animate__animated animate__fadeInUp'}>
            <Box className='piePagina'>
                <Box className='container'>
                    <Grid container spacing={2}> 
                        <Grid size={{ xs: 12 }}>
                            <p style={{textAlign:'center'}}>COOPERATIVA ESPECIALIZADA DE AHORRO Y CRÉDITO COOPIGON</p>
                            <Box className="pieBottom">
                                <span>Todos los derechos reservados | Copyright © 2019 - {anioActual}</span>
                                <span className='implesoft'>Diseño y desarrollo 
                                    <a href="http://implesoft.com/" target="_black" title="Implesoft.com">Implesoft.com</a> 
                                    (Versión: 3.0) 
                                    <a href="/admin"  title="admin"><LockIcon className='implesoft' /></a>
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

    const [nameUser , setNameUser] = useState(''); 
 
    useEffect(() => {
        instance.post('/admin/consultar/informacion/usuario').then(res=>{
            if(res.success){
                setNameUser(res.nombreUsuario);
            }
         });
     }, []);

    return (
        <Box className={"headerAdmon"}>
            <Grid container spacing={2}>
                <Grid size={{ xs: 1, sm: 1, md: 1}} />
                <Grid size={{ xs: 5, sm: 6, md: 7 }} style={{ display: 'flex', alignItems: 'center', justifyContent: 'center' }} >
                    <h2>Administración del sistema de elecciones</h2>
                </Grid>
                <Grid size={{ xs: 3, sm: 3, md: 2 }}>
                    <Box className='informacionPersonal'>
                        <Box className='iconosContainer'>
                            <IconButton size="large" className='exitButton'>
                                <a href='/logout' title='Salir y cerrar sesión'>
                                    <ExitToAppIcon />
                                </a>
                            </IconButton>
                        </Box>
                        <Box className='titleUsuario'>{nameUser}</Box>
                    </Box>
                </Grid>
                <Grid size={{ xs: 3, sm: 2, md: 2 }}>
                    <a href="/">
                        <img src={logo} alt="Logo" className='logo'/> 
                    </a>
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
                        <p>Sistema insticucional de elecciones de COOPIGON</p>
                    </Box>
                </Grid>
                 <Grid size={{ xs: 12, sm: 5 }}>
                    <Box className='derechosReservados'>
                        <span className='implesoft'>
                            Todos los derechos reservados | Copyright COOPIGON | Diseño y desarrollo <a href='https://implesoft.com/' target="_black" title="Implesoft.com" >Implesoft</a> © 2019 - {anioActual}
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