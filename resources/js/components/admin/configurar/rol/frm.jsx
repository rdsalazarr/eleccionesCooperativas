import { useState, useEffect } from 'react';
import { Button, Grid, MenuItem, FormGroup, FormLabel, FormControlLabel, Checkbox, Box, TextField } from '@mui/material';
import { ShowSnackbar } from '../../../layout/snackBar';
import { yupResolver } from "@hookform/resolvers/yup";
import { useForm, Controller } from "react-hook-form";
import { LoaderModal } from "../../../layout/loader";
import instance from '../../../layout/instance';
import SaveAs from '@mui/icons-material/SaveAs';
import Save from '@mui/icons-material/Save';
import * as yup from "yup";

const schema = yup.object().shape({
    nombre: yup.string().required("El nombre es requerido").min(4, "Debe tener mínimo 4 caracteres").max(70, "Máximo 70 caracteres"),
    estado: yup.string().required("El estado es requerido")
});

export default function Frm({ data, tipo }) {

    const { register, handleSubmit, reset, control, formState: { errors } } = useForm({
        resolver: yupResolver(schema),
        defaultValues: tipo !== 'I'
            ? { codigo: data.rolid, nombre: data.rolnombre, estado: data.rolactivo, tipo: tipo }
            : { codigo: '000', nombre: '', estado: '1', tipo: tipo }
    });

    const [formDataMenu, setFormDataMenu] = useState([]);
    const [habilitado, setHabilitado] = useState(true);
    const [loader, setLoader] = useState(false);
    const [menus, setMenus] = useState([]);

    const handleChangeMenu = (e) => {
        const value = parseInt(e.target.value);
        setFormDataMenu(prev => {
            if (e.target.checked) {
                return [...prev, { funcid: value }];
            } else {
                return prev.filter(item => item.funcid !== value);
            }
        });
    };

    const onSubmit = (formValues) => {
        setLoader(true);
        const payload = { ...formValues, funcionalidades: formDataMenu };
        instance.post('/admin/rol/salve', payload).then(res => {
            let icono = res.success ? 'success' : 'error';
            ShowSnackbar(res.message, icono);
            (tipo !== 'I' && res.success) ? setHabilitado(false) : null; 
            (tipo === 'I' && res.success) ? (reset({ codigo: '000', nombre: '', estado: '1', tipo: tipo }), setFormDataMenu([])) : null;
            setLoader(false);
        });
    };

    const inicio = () => {
        setLoader(true);
        instance.post('/admin/rol/listar/funcionalidad', { codigo: data?.rolid || '000' }).then(res => {
            const marcados = res.marcados.map(m => ({funcid: m.funcid}));
            setFormDataMenu(marcados);
            setMenus(res.data);
            setLoader(false);
        });
    };

    useEffect(() => {
        inicio();
    }, []);

    if (loader) {
        return <LoaderModal />;
    }

    return (
        <form onSubmit={handleSubmit(onSubmit)}>

            <Grid container spacing={2}>

                <Grid size={{ xs: 12, md: 9 }}>
                    <TextField
                        label="Nombre"
                        fullWidth
                        variant="standard"
                        {...register("nombre")}
                        error={!!errors.nombre}
                        helperText={errors.nombre?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, md: 3 }}>
                    <Controller
                        name="estado"
                        control={control}
                        render={({ field }) => (
                            <TextField
                                select
                                label="Activo"
                                fullWidth
                                variant="standard"
                                {...field}
                                error={!!errors.estado}
                                helperText={errors.estado?.message}
                            >
                                <MenuItem value="">Seleccione</MenuItem>
                                <MenuItem value="1">Sí</MenuItem>
                                <MenuItem value="0">No</MenuItem>
                            </TextField>
                        )}
                    />
                </Grid>

                <Grid size={{ xs: 12 }}>
                    <FormLabel>Listado de menús para asignar</FormLabel>

                    <FormGroup row>
                        {menus.map(res => {
                            const checked = formDataMenu.some(m => m.funcid === res.funcid);
                            return (
                                <Grid size={{ xs: 6, md: 4 }} key={res.funcid}>
                                    <FormControlLabel
                                        control={
                                            <Checkbox color="secondary" value={res.funcid} checked={checked} onChange={handleChangeMenu} />
                                        }
                                        label={res.titulo}
                                    />
                                </Grid>
                            );
                        })}
                    </FormGroup>
                </Grid>

            </Grid>

            <Box className={'botonesModal'}>
                <Button type="submit" className={'modalBtn'} disabled={!habilitado} startIcon={(tipo === 'I') ? <Save /> : <SaveAs />} >
                    {(tipo === 'I') ? "Guardar" : "Actualizar"}
                </Button>
            </Box>

        </form>
    );
}