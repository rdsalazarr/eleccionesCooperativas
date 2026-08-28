import {useState, Fragment, useEffect} from 'react';
import { Button, Grid, MenuItem, TextField, Icon, Table, TableHead, TableBody, TableRow, TableCell, Box } from '@mui/material';
import {ShowSnackbar} from '../../../layout/snackBar';
import { yupResolver } from "@hookform/resolvers/yup";
import { useForm, Controller } from "react-hook-form";
import {LoaderModal} from "../../../layout/loader";
import instance from '../../../layout/instance';
import SaveAs from '@mui/icons-material/SaveAs';
import Save from '@mui/icons-material/Save';
import Add from '@mui/icons-material/Add';
import * as yup from "yup";

const schema = yup.object({
        documento:        yup.string().required('El número de documento es obligatorio').min(6, 'El número de documento debe tener al menos 6 caracteres').max(15, 'El número de documento no puede exceder los 15 caracteres'),
        nombre:           yup.string().required('El nombre es obligatorio').min(4, 'El nombre de usuario debe tener al menos 4 caracteres').max(50, 'El nombre de usuario no puede exceder los 50 caracteres'),
        apellido:         yup.string().required('El apellido es obligatorio').min(4, 'El apellido de usuario debe tener al menos 4 caracteres').max(50, 'El apellido de usuario no puede exceder los 50 caracteres'),        
        nickUsuario:      yup.string().required('El nick de usuario es obligatorio').min(6, 'El nick de usuario debe tener al menos 6 caracteres').max(15, 'El nick de usuario no puede exceder los 15 caracteres'),
        correo:           yup.string().required("El campo correo es requerido").email("Debe ser un correo válido"),
        cambiarPassword:  yup.string().when('tipo', {
                                    is: (val) => val === 'U',
                                    then: (schema) => schema.required('El campo cambiar password es requerido'),
                                    otherwise: (schema) => schema.notRequired()
                                }),
        bloqueado:        yup.string().when('tipo', {
                                    is: (val) => val === 'U', 
                                    then: (schema) => schema.required('El campo cambiar password es requerido'),
                                    otherwise: (schema) => schema.notRequired()
                                }),
        estado:           yup.string().required('El campo estado es obligatorio'),
        rol:              yup.string().nullable(),
    });

export default function Frm({data, tipo}){

    const { register, handleSubmit, getValues, setError, clearErrors, reset, control, watch, setValue, formState: { errors } } = useForm({
                resolver: yupResolver(schema),
                defaultValues: tipo !== 'I'
                    ? {codigo:data.usuaid,     documento:data.usuadocumento, nombre:data.usuanombre,  apellido:data.usuaapellidos, 
                        correo:data.usuaemail, agencia:data.agenid, nickUsuario:data.usuanick,   cambiarPassword:data.usuacambiarpassword, 
                        bloqueado:data.usuabloqueado, estado:data.usuaactivo, rol:'', tipo:tipo }
                    : {codigo:'000',    documento:'', nombre:'', apellido: '', correo: '', agencia: '',
                        nickUsuario:'', cambiarPassword:'0', bloqueado:'0',  estado:'1', rol:'', tipo: tipo }
            }); 

    const [rolesUsuario, setRolesUsuario] = useState([]);
    const [habilitado, setHabilitado] = useState(true);
    const [agencias, setAgencias] = useState([]);
    const [loader, setLoader] = useState(true);    
    const [roles, setRoles] = useState([]);    

    const adicionarFilaRol = () => {
        const rolSeleccionado = getValues('rol');

        if (!rolSeleccionado) {
            setError('rol', {type: 'manual',  message: 'Debe seleccionar un rol' });
            return;
        }
        clearErrors('rol');

        if (rolesUsuario.some(rolUsua => rolUsua.rol == rolSeleccionado)) {
            ShowSnackbar('Este registro ya fue adicionado', 'error');
            return;
        }

        const resultRoles   = roles.filter((rol) => rol.rolid == rolSeleccionado);
        let newRolesUsuario = [...rolesUsuario];
        newRolesUsuario.push({ identificador: '', rol: rolSeleccionado, nombreRol: resultRoles[0].rolnombre, estado: 'I'});
        setRolesUsuario(newRolesUsuario);
        setValue('rol', '');
    };

    const eliminarFilaRol = (id) =>{
        let newRolesUsuario = []; 
        rolesUsuario.map((res,i) =>{
            if(res.estado === 'U' && i === id){
                newRolesUsuario.push({ identificador:res.identificador, rol: res.rol, nombreRol:res.nombreRol, estado: 'D' }); 
            }else if(res.estado === 'D' && i === id){
                newRolesUsuario.push({identificador:res.identificador, rol: res.rol, nombreRol:res.nombreRol, estado: 'U'});
            }else if((res.estado === 'D' || res.estado === 'U') && i !== id){
                newRolesUsuario.push({identificador:res.identificador, rol: res.rol, nombreRol:res.nombreRol, estado:res.estado});
            }else{
                if(i != id){
                    newRolesUsuario.push({identificador:res.identificador, rol: res.rol, nombreRol:res.nombreRol, estado: 'I' });
                }
            }
        })
        setRolesUsuario(newRolesUsuario);
    }

    const onSubmit = (formValues) => {

        if(rolesUsuario.length === 0){
            ShowSnackbar('Debe adicionar como mínimo un rol al usuario', 'error');
            return
        }

        const payload = {
            ...formValues,
            roles: rolesUsuario
        };

        setLoader(true);
        instance.post('/admin/usuario/salve', payload).then(res=>{
            let icono = (res.success) ? 'success' : 'error';
            ShowSnackbar(res.message, icono);
            (tipo !== 'I' && res.success) ? setHabilitado(false) : null;
            (tipo === 'I' && res.success) ? reset({codigo:'000',    documento:'', nombre:'', apellido: '', correo: '', agencia: '',
                                                    nickUsuario:'', cambiarPassword:'0', bloqueado:'0',  estado:'1', rol:'', tipo: tipo}) : null;
            setLoader(false);
        })
    }
 
    useEffect(()=>{
        setLoader(true);
        instance.post('/admin/usuario/list/datos', {codigo: data?.usuaid || '000', tipo:tipo}).then(res=>{
            setAgencias(res.agencias);
            setRoles(res.roles);            
            if(tipo === 'U' && res.success){
                let newRolesUsuario = [];
                res.usuariosRoles.forEach(function(usua){
                    newRolesUsuario.push({
                        identificador: usua.usurolid,
                        rol:           usua.rolid,
                        nombreRol:     usua.rolnombre,
                        estado: 'U'
                    });
                });
                setRolesUsuario(newRolesUsuario);
            }
            setLoader(false);
        })
    }, []);

    if(loader){
        return <LoaderModal />
    }

    return (
       <form onSubmit={handleSubmit(onSubmit)} >
            <Grid container spacing={2}>

                <Grid size={{ xs: 12, sm: 3 }}>
                    <TextField
                        label="Documento"
                        fullWidth
                        variant="standard"
                        {...register("documento")}
                        error={!!errors.documento}
                        helperText={errors.documento?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 3  }}>
                    <TextField
                        label="Nombre (s)"
                        fullWidth
                        variant="standard"
                        {...register("nombre")}
                        error={!!errors.nombre}
                        helperText={errors.nombre?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 3  }}>
                    <TextField
                        label="Apellido (s)"
                        fullWidth
                        variant="standard"
                        {...register("apellido")}
                        error={!!errors.apellido}
                        helperText={errors.apellido?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 3 }}>
                    <TextField
                        label="Nick usuario"
                        fullWidth
                        variant="standard"
                        {...register("nickUsuario")}
                        error={!!errors.nickUsuario}
                        helperText={errors.nickUsuario?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 3 }}>
                    <TextField
                        label="Correo"
                        fullWidth
                        variant="standard"
                        {...register("correo")}
                        error={!!errors.correo}
                        helperText={errors.correo?.message}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 3 }}>
                    <Controller
                        name="agencia"
                        control={control}
                        render={({ field }) => (
                            <TextField
                                select
                                label="Agencia"
                                fullWidth
                                variant="standard"
                                {...field}
                                onBlur={(e) => {
                                    field.onBlur();
                                    buscarPersona(e.target.value);
                                }}
                                error={!!errors.agencia}
                                helperText={errors.agencia?.message}
                            >
                                <MenuItem value="">Seleccione</MenuItem>
                                {agencias.map(res=>{
                                    return <MenuItem value={res.agenid} key={res.agenid}> {res.agennombre}</MenuItem>
                                })}
                            </TextField>
                        )}
                    />
                </Grid>

                { (tipo === 'U') ?
                    <Fragment>
                     
                        <Grid size={{ xs: 12, sm: 3 }}>
                            <Controller
                                name="cambiarPassword"
                                control={control}
                                render={({ field }) => (
                                    <TextField
                                        select
                                        label="Cambiar clave"
                                        fullWidth
                                        variant="standard"
                                        {...field}
                                        error={!!errors.cambiarPassword}
                                        helperText={errors.cambiarPassword?.message}
                                    >
                                        <MenuItem value="">Seleccione</MenuItem>
                                        <MenuItem value={"1"}>Sí</MenuItem>
                                        <MenuItem value={"0"}>No</MenuItem>
                                    </TextField> 
                                )}
                            />
                        </Grid>

                        <Grid size={{ xs: 12, sm: 3 }}>
                            <Controller
                                name="bloqueado"
                                control={control}
                                render={({ field }) => (
                                    <TextField
                                        select
                                        label="¿Usuario bloqueado?"
                                        fullWidth
                                        variant="standard"
                                        {...field}
                                        error={!!errors.bloqueado}
                                        helperText={errors.bloqueado?.message}
                                    >
                                        <MenuItem value="">Seleccione</MenuItem>
                                        <MenuItem value={"1"}>Sí</MenuItem>
                                        <MenuItem value={"0"}>No</MenuItem>
                                    </TextField> 
                                )}
                            />
                        </Grid>
                     
                    </Fragment>
                : null } 

                <Grid size={{ xs: 12, sm: 3 }}>
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
                                <MenuItem value={"1"}>Sí</MenuItem>
                                <MenuItem value={"0"}>No</MenuItem>
                            </TextField> 
                        )}
                    />
                </Grid>

                <Grid size={{ xs: 12 }}>
                    <Box className='divisionFormulario'>
                        Asignar roles al usuario
                    </Box>
                </Grid>

                <Grid size={{ xs: 1, sm: 1, md: 2}}>
                </Grid>

                <Grid size={{ xs: 11, sm: 11, md: 8 }}>
                    <Controller
                        name="rol"
                        control={control}
                        render={({ field }) => (
                            <TextField
                                select
                                label="Rol"
                                fullWidth
                                variant="standard"
                                {...field}
                                error={!!errors.rol}
                                helperText={errors.rol?.message}
                            >
                                <MenuItem value="">Seleccione</MenuItem>
                                {roles.map(res=>{
                                    return <MenuItem value={res.rolid} key={res.rolid}> {res.rolnombre}</MenuItem>
                                })}
                            </TextField> 
                        )}
                    />
                </Grid>

                <Grid size={{ xs: 12, sm: 12, md: 2 }}>
                    <Button type={"button"} className={'modalBtnIcono'} 
                        startIcon={<Add className='icono' />} onClick={() => {adicionarFilaRol()}}> {"Agregar"}
                    </Button>
                </Grid>

                {(rolesUsuario.length > 0) ?
                    <Fragment>
                        <Grid size={{ xs: 12 }}>
                            <Box className='divisionFormulario'>
                                Roles asignados al usuario
                            </Box>
                        </Grid>

                        <Grid size={{ xs: 12 }}>
                            <Table className={'tableAdicional'} md={{width: '70%', margin:'auto'}}  sx={{width: '80%', margin:'auto'}} sm={{maxHeight: '90%', margin:'auto'}} >
                                <TableHead>
                                    <TableRow>
                                        <TableCell style={{width: '90%'}}>Nombre del rol</TableCell>
                                        <TableCell style={{width: '10%'}} className='cellCenter'>Acción </TableCell>
                                    </TableRow>
                                </TableHead>
                                <TableBody>
                                { rolesUsuario.map((rolUsuar, a) => {
                                    return(
                                        <TableRow key={'rowD-' +a} className={(rolUsuar['estado'] == 'D')? 'tachado': null}>
                                            <TableCell>
                                                {rolUsuar['nombreRol']}
                                            </TableCell> 

                                            <TableCell className='cellCenter'>
                                                <Icon key={'iconDelete'+a} className={'icon top red'}
                                                        onClick={() => {eliminarFilaRol(a);}}
                                                    >clear</Icon>
                                            </TableCell>
                                        </TableRow>
                                        );
                                    })
                                }
                                </TableBody>
                            </Table>
                        </Grid>
                    </Fragment>
                : null }

            </Grid>

            <Box className={'botonesModal'}>
                <Button type="submit" className={'modalBtn'} disabled={!habilitado} startIcon={(tipo === 'I') ? <Save /> : <SaveAs />} >
                    {(tipo === 'I') ? "Guardar" : "Actualizar"}
                </Button>
            </Box>
        </form>
    );
}