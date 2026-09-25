import {useState, useEffect} from 'react';
import {createRoot} from "react-dom/client";
import { Card, CardContent, Box, Grid, Button, TextField, InputAdornment, IconButton } from '@mui/material';
import VisibilityOff from "@mui/icons-material/VisibilityOff";
import {Header, Footer, Contador } from "../layout/general";
import Visibility from "@mui/icons-material/Visibility";
import { SnackbarSettings } from "../layout/snackBar";
import { yupResolver } from "@hookform/resolvers/yup";
import { ThemeProvider } from '@mui/material/styles';
import {ShowSnackbar} from '../layout/snackBar';
import SaveIcon from '@mui/icons-material/Save';
import {generalTema} from "../layout/theme";
import instance from '../layout/instance';
import { useForm } from "react-hook-form";
import Loader from "../layout/loader";
import "../../../scss/app.scss";
import * as yup from "yup";

const schema = yup.object({
        password: yup.string().min(8, "Debe tener mínimo 8 caracteres").required("Campo obligatorio"),
        repPassword: yup.string().oneOf([yup.ref("password")], "Las contraseñas no coinciden").required("Campo obligatorio"),
    });

export default function Reset(){

    const { register, handleSubmit, formState: { errors } } = 
           useForm({ resolver: yupResolver(schema), defaultValues: { password: "",  repPassword: "" } });

    const [mostrarRepPassword, setMostrarRepPassword] = useState(false);
    const [mostrarPassword, setMostrarPassword] = useState(false);
    const [dataUsuario, setDataUsuario] = useState([]);
    const [success, setSuccess] = useState(false);
    const [loader, setLoader] = useState(true);

    const onSubmit = (data) => {
        setLoader(true);
        instance.post('/admin/usuario/actualizar/password', data).then(res => {
            let icono = (res.success) ? 'success' : 'error';
            ShowSnackbar(res.message, icono);
            setSuccess(res.success);
            setLoader(false);
        });
    }

    const redireccionarUrl =() =>{
        location.replace('/dashboard');
    }

    useEffect(() => {
       setLoader(true);
        instance.post('/admin/usuario/data').then(res=>{
            setDataUsuario(res.dataUsuario);
            setLoader(false);
        })
    }, []);

    if(loader){
        return <Loader />
    }

    return(
       <Box className="contenedorApp">
            <Header />
            <SnackbarSettings>
                <ThemeProvider theme={generalTema}>

                    <Box className='container' style={{marginTop: '2.1em'}}>
                        <Grid container spacing={3}>
                            <Grid size={{ xs: 12, sm: 12, md: 7, lg: 8}} style={{textAlign: 'justify'}}>
                                <h1 className='titleInicio'>¡Bienvenido al sistema, {dataUsuario.nombreCompleto}!</h1>
                                <p> Para comenzar a utilizar el sistema de forma segura, le solicitamos que actualice su contraseña. Asegúrese de que su nueva contraseña cumpla con los siguientes requisitos:
                                </p>
                                <ul>
                                    <li>Debe tener entre 8 y 20 caracteres de longitud.</li>
                                    <li>Debe incluir al menos una letra mayúscula.</li>
                                    <li>Debe incluir al menos una letra minúscula.</li>
                                    <li>Debe contener al menos un número.</li>
                                    <li>Debe incluir al menos un carácter especial, como *, #, o !.</li>
                                    <li>No debe tener números ni letras consecutivas.</li>
                                </ul>
                                <p>Gracias por su colaboración. Su seguridad es nuestra prioridad. Si decide no cambiar su contraseña en este momentos, 
                                    puede cerrar sesion <a href="#" onClick={()=>{location.href = '/logout'}} title='Cerrar sesión'>aquí</a>. </p> 
                            </Grid>
                            <Grid size={{ xs: 12, sm: 12, md: 5, lg: 4}}> 
                                <Box>
                                    <h1 className='titleInicio'>Cambiar contraseña</h1>
                                </Box>

                                <Card className="cardPrincipal">
                                    <CardContent>
                                        <form onSubmit={handleSubmit(onSubmit)}>
                                            <Grid container spacing={2}>
                                                <Grid size={{ xs: 12 }}>
                                                    <TextField
                                                        label="Contraseña"
                                                        type={mostrarPassword ? "text" : "password"}
                                                        fullWidth
                                                        variant="standard"
                                                        autoComplete="new-password"
                                                        {...register("password")}
                                                        onCopy={(e) => e.preventDefault()}
                                                        onCut={(e) => e.preventDefault()}
                                                        onPaste={(e) => e.preventDefault()}
                                                        error={!!errors.password}
                                                        helperText={errors.password?.message}
                                                        slotProps={{
                                                            input: {
                                                                endAdornment: (
                                                                    <InputAdornment position="end">
                                                                        <IconButton
                                                                            onClick={() => setMostrarPassword(prev => !prev)}
                                                                            edge="end"
                                                                            aria-label={mostrarPassword ? "Ocultar contraseña" : "Mostrar contraseña"}
                                                                        >
                                                                            {mostrarPassword ? <VisibilityOff /> : <Visibility />}
                                                                        </IconButton>
                                                                    </InputAdornment>
                                                                )
                                                            }
                                                        }}
                                                    />
                                                </Grid>

                                                <Grid size={{ xs: 12 }}>
                                                    <TextField
                                                        label="Repita la contraseña"
                                                        type={mostrarRepPassword ? "text" : "password"}
                                                        fullWidth
                                                        variant="standard"
                                                        autoComplete="new-password"
                                                        {...register("repPassword")}
                                                        error={!!errors.repPassword}
                                                        helperText={errors.repPassword?.message}
                                                        slotProps={{
                                                            input: {
                                                                endAdornment: (
                                                                    <InputAdornment position="end">
                                                                        <IconButton
                                                                            onClick={() => setMostrarRepPassword(prev => !prev)}
                                                                            edge="end"
                                                                            aria-label={mostrarRepPassword ? "Ocultar contraseña" : "Mostrar contraseña"}
                                                                        >
                                                                            {mostrarRepPassword ? <VisibilityOff /> : <Visibility />}
                                                                        </IconButton>
                                                                    </InputAdornment>
                                                                )
                                                            }
                                                        }}
                                                    />
                                                </Grid>

                                                <Grid size={{ xs: 12 }}>
                                                    <Button type={"submit"} style={{width: '100%', marginBottom: '1em'}} startIcon={<SaveIcon />}> Guardar</Button>
                                                </Grid>

                                            </Grid>
                                        </form>
                                    </CardContent>
                                </Card>

                                {(success) ? 
                                    <Box>
                                        <h1 className='titleInicio' style={{color: '#e92908'}}>Redireccionando en (<Contador tiempoInicial={6} onTiempoFinalizado={redireccionarUrl} /> )</h1>   
                                    </Box>
                                : null}

                            </Grid>
                        </Grid>
                    </Box>

                </ThemeProvider>
            </SnackbarSettings>
            <Footer />
        </Box>
    )
}

const root = createRoot(document.getElementById('app'));
root.render(<Reset />);