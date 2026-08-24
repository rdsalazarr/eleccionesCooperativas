import { createTheme } from '@mui/material/styles';
import '../../../css/app.css';

const getCssVariable = (name) =>
    getComputedStyle(document.documentElement).getPropertyValue(name).trim();
    const colorPrincipal  = getCssVariable('--colorPrincipal') || '#5ab7de';
    const colorSecundario = getCssVariable('--colorSecundario') || '#5ab7de';

    export const generalTema = createTheme({
        palette: {
            primary: {
                main: '#6D6D6D',
                contrastText: "#ffffff",
            },
            secondary: {
                main: colorPrincipal,
                contrastText: "#ffffff",
            },
            neutral:{
                main: '#64748B',
                contrastText: '#fff',
            }
        },
        typography: {
            fontFamily: [
            '"Myriad Pro"',
            '"Myriad Pro Bold"',
            '"Myriad Pro Cond"',
            '"Myriad Pro Bold Cond"',
            ].join(',')
        },
        components: {
            MuiButton: {
                styleOverrides: {
                    root: {
                        marginTop: '1em',
                        background: colorPrincipal,
                        textAlign: 'center',
                        transition: 'all .5s ease-in-out',
                        color: 'white',
                        '&:hover': {
                            backgroundColor: colorSecundario,
                            color: '#fdfdfd',
                            transition: 'all .5s ease-in-out',
                            boxShadow: '0 2px 5px 0 rgba(0,0,0,.16), 0 2px 10px 0 rgba(0,0,0,.12)'
                        }
                    }
                }
            },
            MuiTabs: {
                styleOverrides: {
                    root: {
                        letterSpacing: '1.5px',
                        background: '#e6e6e6',
                    },
                    indicator: {
                        transition: 'all .5s ease-in-out',
                        backgroundColor: colorSecundario,
                        top: 0
                    }
                }
            },
            MuiTab: {
                styleOverrides: {
                    root: {
                    letterSpacing: '1.5px',
                    borderBottom: '1px solid #d2d1d1',
                    fontFamily: [
                        '"Myriad Pro"',
                        '"Myriad Pro Bold"',
                        '"Myriad Pro Cond"',
                        '"Myriad Pro Bold Cond"',
                    ].join(','),
                    '&.Mui-selected': {
                        backgroundColor: '#f5f5f5',
                        color: colorSecundario,
                        fontWeight: 'bold',
                    },
                    }
                }
            }
        }
    });