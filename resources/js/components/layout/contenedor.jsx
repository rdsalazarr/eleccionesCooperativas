import { useState, useEffect } from 'react';
import { BrowserRouter as Router, Route, Routes, NavLink } from "react-router-dom";
import { Drawer, List, ListItem, IconButton, Divider, Icon, Box } from '@mui/material';
import { ListItemButton, ListItemText, Collapse } from '@mui/material';
import ExpandLess from '@mui/icons-material/ExpandLess';
import ExpandMore from '@mui/icons-material/ExpandMore';
import { ThemeProvider } from '@mui/material/styles';
import { FooterAdmon, HeaderAdmon } from './general';
import ClearIcon from '@mui/icons-material/Clear';
import IconoMenu from "@mui/icons-material/Menu";
import { generalTema } from "./theme";
import instance from './instance';
import "../../../scss/admin.scss";
import Loader from "./loader";

import Welcome from "../admin/welcome";
import EnConstruccion from "../admin/enConstruccion";

import Acta from "../admin/configurar/acta/list";
import Menu from "../admin/configurar/menu/list";
import Roles from "../admin/configurar/rol/list";
import Correo from "../admin/configurar/correo/list";
import Usuario from "../admin/gestionar/usuario/list";
import Empresa from "../admin/configurar/empresa/list";
import MiPerfil from "../admin/gestionar/usuario/miPerfil";

import Tipos from "../admin/gestionar/tipos/list";
import Asociados from "../admin/gestionar/asociados/list";
import OrganosEleccion from "../admin/gestionar/organosEleccion/list";
import CargarAsociados from "../admin/gestionar/asociados/cargar/list";

import RegistrarAspirante from "../admin/eleccion/delegados/aspirantes/list";
import ImprimirActas from "../admin/eleccion/delegados/votacion/imprimirActas";
import GestionEleccionesDelegado from "../admin/eleccion/delegados/gestion/list";
import BoletinVotacion from "../admin/eleccion/delegados/votacion/boletinVotacion";
import AbrirVotacionDelegados from "../admin/eleccion/delegados/votacion/abrirVotacion";

import Informacion from "../admin/eleccion/organos/token/list";
import GenerarToken from "../admin/eleccion/organos/token/list";
import Delegados from "../admin/eleccion/organos/delegados/list";
import JuradosOrganosEleccion from "../admin/eleccion/organos/jurados/list";
import AbrirVotacionOrganosEleccion from "../admin/eleccion/organos/token/list";

const HeaderMenu = ({ open, setOpen }) => {
    return (
        <Box className={"toolbarIcon"} onClick={() => setOpen(!open)}>
            <List className={"accionMenu"}>
                <ListItem className={"iconoMenu"}>
                    <label>{open ? "Cerrar menú" : ""}</label>
                    <IconButton>{open ? <Box> <ClearIcon className='iconMenuIcon' /></Box> : <IconoMenu className='iconMenuIcon' style={{ marginLeft: '-10px' }} />} </IconButton>
                </ListItem>

                <ListItem style={{ padding: 0 }}>
                    <Box className={"titleMenu"}>
                        <span className={open ? '' : 'hidden'}>Elecciones</span>
                        <h3>{open ? "Ocaña" : "Elecciones"}</h3>
                    </Box>
                </ListItem>
            </List>
        </Box>
    )
}

const ListMenu = ({res, j, menuAbierto, setMenuAbierto, openMenu, setOpenMenu }) => {
    
    const open = menuAbierto === j;

    const handleClick = () => {
        if (!openMenu) {
            setOpenMenu(true);
            setMenuAbierto(j);
            return;
        }
        setMenuAbierto(open ? null : j);
    };

    return (
        <Box>
            <List sx={{ paddingTop: 0, paddingBottom: 0, }} >
                <ListItemButton onClick={handleClick} key={'listeButton' + j} >
                    <Icon>{res.icono}</Icon>
                    <ListItemText primary={res.nombre} sx={{ paddingLeft: '0.5em' }} className={"itemMenu"} />
                    {open ? <ExpandLess className='iconMenuIcon' /> : <ExpandMore className='iconMenuIcon' />}
                </ListItemButton>
                <Collapse in={open} timeout="auto" unmountOnExit>
                    {res.itemMenu.map((item, i) => {
                        return (
                            <NavLink className={"itemMenu"} exact={`true`} to={`/${item.ruta}`} key={item.ruta + 'nav'} >
                                <List component="div" disablePadding key={i + 'datosGeneral'}>
                                    <ListItemButton sx={{ pl: 4 }}>
                                        <Icon>{item.icono}</Icon>
                                        <ListItemText primary={item.menu} sx={{ paddingLeft: '0.5em' }} className={"itemMenu"} />
                                    </ListItemButton>
                                </List>
                            </NavLink>
                        );
                    })}
                </Collapse>
            </List>
            <Divider />
        </Box>
    );
}

const ItemMenu = ({ route, text, icon }) => {
    return (
        <List disablePadding key={route + "_li"}>
            {(route === 'logout' || route === 'dashboard') ?
                <a href={'/' + route} key={route + 'nav'} className={"itemMenu"} >
                    <ListItem key={route + 'item'} className={"nested"}>
                        <Icon className={'pr10'}>{icon}</Icon>
                        <ListItemText key={route + '_text'} className={"itemMenu"} primary={text} />
                    </ListItem>
                </a> :
                <NavLink exact={`true`} to={`/${route}`} key={route + 'nav'}
                    className={"itemMenu"} >
                    <ListItem key={route + 'item'} className={"nested"}>
                        <Icon className={'pr10'}>{icon}</Icon>
                        <ListItemText key={route + '_text'} className={"itemMenu"} primary={text} />
                    </ListItem>
                </NavLink >
            }
        </List>
    );
};

const menuComponente = [
    /*{id:1,componente : <Menu />},
    {id:2,componente : <Roles />},
    {id:3,componente : <Correo />},
    {id:4,componente : <Empresa />},
    {id:5,componente : <Acta />},

    {id:6,componente : <Usuario />},
    {id:7,componente : <Tipos />},
    {id:8,componente : <OrganosEleccion />},
    {id:9,componente : <CargarAsociados />},
    {id:10,componente : <Asociados />},
    
    {id:11,componente : <GestionEleccionesDelegado />},
    {id:12,componente : <RegistrarAspirante />},
    {id:13,componente : <JuradosDelegados />},
    {id:14,componente : <AbrirVotacionDelegados />},
    {id:15,componente : <ImprimirActas />},
    {id:16,componente : <BoletinVotacion />},

    {id:17,componente : <Delegados />},
    {id:18,componente : <GenerarToken />},
    {id:19,componente : <Informacion />},
    {id:20,componente : <JuradosOrganosEleccion />},
    {id:21,componente : <AbrirVotacionOrganosEleccion />},

    {id:22,componente : <EnConstruccion />},
    {id:23,componente : <EnConstruccion />},
    {id:24,componente : <EnConstruccion />},
    {id:25,componente : <EnConstruccion />},
    {id:26,componente : <EnConstruccion />},
*/
];

const componenteMenu = [
    {   nombre: 'Configurar',
        icono : 'settings_applications',
        itemMenu: [
            {ruta : 'admin/configurar/menu',    menu: 'Menú',    icono : 'menu',            componente : <Menu /> },
            {ruta : 'admin/configurar/roles',   menu: 'Roles',   icono : 'people',          componente : <Roles /> },
            {ruta : 'admin/configurar/correo',  menu: 'Correo',  icono : 'alternate_email', componente : <Correo /> },
            {ruta : 'admin/configurar/empresa', menu: 'Empresa', icono : 'business',        componente : <Empresa /> },
            {ruta : 'admin/configurar/acta',    menu: 'Acta',    icono : 'menu_book',       componente : <Acta /> },
        ]
    },
    {   nombre: 'Gestionar',
        icono : 'content_paste_search',
        itemMenu: [
            {ruta : 'admin/gestionar/usuario',         menu: 'Usuario',             icono : 'account_circle',  componente : <Usuario /> },
            {ruta : 'admin/gestionar/tipos',           menu: 'Tipos de Órganos',    icono : 'schema',          componente : <Tipos /> },
            {ruta : 'admin/gestionar/organosEleccion', menu: 'Órganos de Elección', icono : 'account_box',     componente : <OrganosEleccion /> },
            {ruta : 'admin/gestionar/cargarAsociado',  menu: 'Cargar asociados',    icono : 'import_contacts', componente : <CargarAsociados /> },
            {ruta : 'admin/gestionar/asociados',       menu: 'Asociados ',          icono : 'assignment',      componente : <Asociados /> },
        ]
    },
    {   nombre: 'Elección Delegados',
        icono : 'analytics', 
        itemMenu: [
            {ruta : 'admin/eleccion/delegado/gestion',            menu: 'Gestión ',             icono : 'menu_book',    componente : <GestionEleccionesDelegado /> },
            {ruta : 'admin/eleccion/delegado/registrarAspirante', menu: 'Registrar Aspirante',  icono : 'how_to_reg',   componente : <RegistrarAspirante /> },
            {ruta : 'admin/eleccion/delegado/abrirVotacion',      menu: 'Abrir Votacion ',      icono : 'storage',      componente : <AbrirVotacionDelegados /> },
            {ruta : 'admin/eleccion/delegado/imprimirActas',      menu: 'Imprimir Actas ',      icono : 'announcement', componente : <ImprimirActas /> },
            {ruta : 'admin/eleccion/delegado/boletinVotacion',    menu: 'Boletín de Votación ', icono : 'cloud_sync',   componente : <BoletinVotacion /> },
        ]
    } ,
    {   nombre: 'Órgano Elección',
        icono : 'library_books',
        itemMenu: [
            {ruta : 'admin/organos/eleccion/delegados',     menu: 'Delegados',     icono : 'person',         componente : <Delegados /> },
            {ruta : 'admin/organos/eleccion/generarToken',  menu: 'Generar Token', icono : 'token',          componente : <GenerarToken /> },
            {ruta : 'admin/organos/eleccion/jurados',       menu: 'Jurados',       icono : 'assignment_add', componente : <JuradosOrganosEleccion /> },
            {ruta : 'admin/organos/eleccion/informacion',   menu: 'Información ',  icono : 'menu_book',      componente : <Informacion /> },
            {ruta : 'admin/organos/eleccion/abrirVotacion', menu: 'Generar',       icono : 'how_to_vote',    componente : <AbrirVotacionOrganosEleccion /> },
            
        ]
    } 
];

export default function Contenedor() {

    const [menuAbierto, setMenuAbierto] = useState(null);
    const [componente, setComponente] = useState([]);
    const [loader, setLoader] = useState(false);
    const [open, setOpen] = useState(true);

    /*useEffect(() => {
        setLoader();
        instance.post('/admin/generar/menu').then(res => {
            setComponente(res.data);
            setLoader(false);
        })
    }, []);*/

    if (loader) {
        return <Loader />
    }

    return (
        <ThemeProvider theme={generalTema}>
            <Router>
                <Box className={open ? 'component' : 'component componentClose'}>
                </Box>
                <Drawer variant="permanent" className={open ? "nav" : "nav navClose"} open={open}>
                    <HeaderMenu open={open} setOpen={setOpen} />
                </Drawer>

                <Box className={open ? 'component' : 'component componentClose'}>
                    <HeaderAdmon />
                    <Box className='containerAdmin' style={{ marginTop: '2em' }}>
                        <Routes >
                            <Route exact={`true`} path="/dashboard" element={<Welcome />} />
                            {/*componente.map(item=>{
                                return item.itemMenu.map((res, i) =>{
                                    const resultado = menuComponente.find( resul => resul.id === parseInt(res.id));
                                    return (<Route key={'R-'+res.ruta} exact = {`true`} path={'/'+res.ruta} element={resultado.componente} ></Route>)
                                }
                            )})*/}
                            {componenteMenu.map(item=>{
                                return item.itemMenu.map((res, i) =>{
                                    return (<Route key={'R-'+res.ruta} exact = {`true`} path={'/'+res.ruta} element={res.componente}></Route>)
                                }
                            )})}
                            <Route exact={`true`} path="/admin/miPerfil" element={<MiPerfil />} />
                        </Routes>
                    </Box>
                    <FooterAdmon />
                </Box>

                <Drawer variant="permanent" className={open ? "nav" : "nav navClose"} open={open}>
                    <HeaderMenu open={open} setOpen={setOpen} />
                    <Divider />
                    <ItemMenu route={'dashboard'} text={'Inicio'} icon={'home'} />
                    {/*componente.map((res, i)=>{
                        return <ListMenu res={res} j={i} menuAbierto={menuAbierto} setMenuAbierto={setMenuAbierto} openMenu={open} setOpenMenu={setOpen} key ={'list'+ i} />
                    })*/}
                    {componenteMenu.map((res, i) => {
                        return <ListMenu res={res} j={i} menuAbierto={menuAbierto} setMenuAbierto={setMenuAbierto} openMenu={open} setOpenMenu={setOpen} key ={'list'+ i} />
                    })}
                    <ItemMenu route={'admin/miPerfil'} text={'Mi perfil'} icon={'person'} />
                    <ItemMenu route={'logout'} text={'Salir'} icon={'exit_to_app'} />
                </Drawer>

            </Router>
        </ThemeProvider>
    );
}
