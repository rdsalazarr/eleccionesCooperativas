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
import Empresa from "../admin/configurar/empresa/list";
import Usuario from "../admin/gestionar/usuario/list";
import MiPerfil from "../admin/gestionar/usuario/miPerfil";




/*
import Tipos from "../admin/gestionar/tipos/list";*/

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
    {id:5,componente : <Tipos />},
    {id:6,componente : <Informacion />},
    {id:7,componente : <Persona />},
    {id:8,componente : <Usuario />},
    {id:9,componente : <Dependencia />},
    {id:10,componente : <Festivos />},
    {id:11,componente : <DiasNotificacion />},
    {id:12,componente : <Encuesta />},

    {id:13,componente : <Registrar />},
    {id:14,componente : <Gestionar />},
    {id:15,componente : <Verificar />},
    {id:16,componente : <Responder />},
    {id:17,componente : <Anotacion />},
    {id:18,componente : <Seguimiento />},
    {id:19,componente : <Consultar />},

    {id:21,componente : <InformeEncuesta />},
    {id:20,componente : <InformeSolicitud />},
    {id:22,componente : <InformeTrazabilidad />},

    {id:23,componente : <EnConstruccion />},
    {id:24,componente : <EnConstruccion />},
    {id:25,componente : <EnConstruccion />},
    {id:26,componente : <EnConstruccion />},
    {id:27,componente : <EnConstruccion />},
    {id:28,componente : <EnConstruccion />},
    {id:29,componente : <EnConstruccion />},
    {id:30,componente : <EnConstruccion />},
    {id:31,componente : <EnConstruccion />},*/
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
            {ruta : 'admin/gestionar/usuario',     menu: 'Usuario',          icono : 'account_circle', componente : <Usuario /> },
            {ruta : 'admin/gestionar/tipos',       menu: 'Tipos de Órganos', icono : 'schema',         componente : <EnConstruccion /> },
            {ruta : 'admin/gestionar/informacion', menu: 'Órganos',          icono : 'account_box',    componente : <EnConstruccion /> },
            
            /*{ruta : 'admin/gestionar/dependencia',      menu: 'Dependencia',      icono : 'apartment',          componente : <EnConstruccion /> },
            {ruta : 'admin/gestionar/festivos',         menu: 'Festivos',         icono : 'calendar_month ',    componente : <EnConstruccion /> },
            {ruta : 'admin/gestionar/diasNotificacion', menu: 'Dia Notificacion', icono : 'edit_notifications', componente : <EnConstruccion /> },
            {ruta : 'admin/gestionar/encuesta',         menu: 'Encuesta',         icono : 'poll',               componente : <EnConstruccion /> },*/
        ]
    },
    {   nombre: 'Elección Delegados',
        icono : 'analytics', 
        itemMenu: [
            {ruta : 'admin/eleccionDelegado/cargarAsociado',     menu: 'Cargar asociados',     icono : 'import_contacts', componente : <EnConstruccion /> },
            {ruta : 'admin/eleccionDelegado/asociados',          menu: 'Asociados ',           icono : 'assignment',      componente : <EnConstruccion /> },
            {ruta : 'admin/eleccionDelegado/registrarAspirante', menu: 'Registrar Aspirante',  icono : 'how_to_reg',      componente : <EnConstruccion /> },
            {ruta : 'admin/eleccionDelegado/Jurados',            menu: 'Jurados',              icono : 'poll',            componente : <EnConstruccion /> },
            {ruta : 'admin/eleccionDelegado/abrirVotacion',      menu: 'Abrir votacion ',      icono : 'storage',         componente : <EnConstruccion /> },
            {ruta : 'admin/eleccionDelegado/imprimirActas',      menu: 'Imprimir Votación ',   icono : 'announcement',    componente : <EnConstruccion /> },
            {ruta : 'admin/eleccionDelegado/informeVotacion',    menu: 'Informe de Votación ', icono : 'cloud_sync',      componente : <EnConstruccion /> },
        ]
    } ,
    {   nombre: 'Órgano Elección',
        icono : 'library_books',
        itemMenu: [
            {ruta : 'admin/gestionar/persona',   menu: 'Delegados',     icono : 'person',          componente : <EnConstruccion /> },
            {ruta : 'admin/gestionar/persona',   menu: 'Generar Token', icono : 'person',          componente : <EnConstruccion /> },
            {ruta : 'admin/solicitud/registrar', menu: 'Información ',  icono : 'menu_book',       componente : <EnConstruccion /> },
            {ruta : 'admin/solicitud/registrar', menu: 'Jurados ',      icono : 'menu_book',       componente : <EnConstruccion /> },
            {ruta : 'admin/solicitud/responder', menu: 'Generar ',      icono : 'library_books',   componente : <EnConstruccion /> },
            
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
