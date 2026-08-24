import { useState } from "react";
import { Grid, Card, CardContent, Button, TextField } from "@mui/material";
import QueuePlayNextIcon from "@mui/icons-material/QueuePlayNext";
import VisibilityOff from "@mui/icons-material/VisibilityOff";
import Visibility from "@mui/icons-material/Visibility";
import { yupResolver } from "@hookform/resolvers/yup";
import { ThemeProvider } from "@mui/material/styles";
import { ShowSnackbar } from "../../layout/snackBar";
import KeyIcon from "@mui/icons-material/VpnKey";
import { generalTema } from "../../layout/theme";
import Person from "@mui/icons-material/Person"
import { useForm } from "react-hook-form";
import Loader from "../../layout/loader";
import * as yup from "yup";
import axios from "axios";

const schema = yup.object({
        usuario:  yup.string().required("Campo obligatorio"),
        password: yup.string().required("Campo obligatorio").min(6, "Debe tener mínimo 6 caracteres"),
    });

export default function IniciarSesion() {

    const [showPassword, setShowPassword] = useState(false);
    const [loader, setLoader] = useState(false);

    const { register, handleSubmit,setValue, watch, formState: { errors } }
          = useForm({ resolver: yupResolver(schema), defaultValues: { usuario: "rsalazar",  password: "123456" }
                    });

    const passwordValue = watch("password") || "";

    const handleUsuario = (e) => {
        setValue("usuario", e.target.value.toUpperCase(), {shouldValidate: true });
    };

    const togglePassword = () => {
        if (!passwordValue) return;
        setShowPassword((prev) => !prev);
    };

    const onSubmit = async (data) => {
        try {
            setLoader(true);
            const res = await axios.post("/login", data, {
                headers: {
                    csrfToken: document.querySelector('meta[name="csrf-token"]').content
                }
            });

            ShowSnackbar(res.data.message, res.data.success ? "success" : "error");

            if (res.data.success) {
                location.replace(res.data.ruta);
            }
        } catch (error) {
            ShowSnackbar(error.response?.data?.message || "Error inesperado", "error");
        } finally {
            setLoader(false);
        }
    };

    if (loader) return <Loader />;

    return (
        <ThemeProvider theme={generalTema}>
            <Card className="cardPrincipal">
                <CardContent>

                    <form onSubmit={handleSubmit(onSubmit)}>
                        <h1 className="titleCard">Iniciar sesión</h1>

                        <Grid container spacing={2} style={{ alignItems: "center" }}>

                            <Grid size={{ xs: 12 }} className="inputIcon">
                                <TextField
                                    label="Usuario"
                                    variant="standard"
                                    className="inputGeneral"
                                    {...register("usuario")}
                                    onChange={handleUsuario}
                                    error={!!errors.usuario}
                                    helperText={errors.usuario?.message}
                                    slotProps={{
                                        htmlInput: {
                                            autoComplete: "off",
                                            maxLength: 20
                                        }
                                    }}
                                />
                                <Person className="icono" />
                            </Grid>

                            <Grid size={{ xs: 12 }} className="inputIcon">
                                <TextField
                                    label="Contraseña"
                                    type={showPassword ? "text" : "password"}
                                    variant="standard"
                                    className="inputGeneral"
                                    {...register("password")}
                                    onChange={(e) =>
                                        setValue("password", e.target.value, {
                                            shouldValidate: true
                                        })
                                    }
                                    error={!!errors.password}
                                    helperText={errors.password?.message}
                                    slotProps={{
                                        htmlInput: {
                                            autoComplete: "off"
                                        }
                                    }}
                                />

                                <span
                                    onClick={togglePassword}
                                    style={{ cursor: "pointer" }}
                                >
                                    {passwordValue.length === 0 ? (
                                        <KeyIcon className="icono" />
                                    ) : showPassword ? (
                                        <VisibilityOff className="icono" />
                                    ) : (
                                        <Visibility className="icono" />
                                    )}
                                </span>
                            </Grid>

                            <Grid size={{ xs: 12 }}>
                                <Button type="submit" fullWidth startIcon={<QueuePlayNextIcon />} style={{ marginBottom: "1em" }}>
                                    Ingresar
                                </Button>
                            </Grid>

                        </Grid>
                    </form>

                </CardContent>
            </Card>
        </ThemeProvider>
    );
}