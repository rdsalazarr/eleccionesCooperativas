import {useState, Fragment, useEffect} from 'react';
import { Button, Grid, MenuItem, TextField, Icon, Table, TableHead, TableBody, TableRow, TableCell, Box } from '@mui/material';
import { ShowSnackbar } from '../../../../layout/snackBar';
import { LoaderModal } from "../../../../layout/loader";
import { yupResolver } from "@hookform/resolvers/yup";
import { useForm, Controller } from "react-hook-form";
import instance from '../../../../layout/instance';
import SaveAs from '@mui/icons-material/SaveAs';
import Save from '@mui/icons-material/Save';
import Add from '@mui/icons-material/Add';
import * as yup from "yup";

const schema = yup.object().shape({
    titulo:     yup.string().required("El título es obligatorio").min(6, "El título debe tener mínimo 6 caracteres").max(150, "Máximo 150 caracteres"),
    periodo:    yup.string().required("El período es requerido").min(4, "El período debe tener mínimo 4 caracteres").max(20, "El período debe tener máximo 20 caracteres"),
    horaInicio: yup.string().required("La hora de inicio es requerida")
                .matches(/^([01]\d|2[0-3]):([0-5]\d)$/, "La hora debe tener formato militar HH:mm"),
    horaCierre: yup.string().required("La hora de cierre es requerida")
                .matches(/^([01]\d|2[0-3]):([0-5]\d)$/, "La hora debe tener formato militar HH:mm")
                .test("hora-posterior", "La hora de cierre debe ser posterior a la hora de inicio",
                function (value) {
                    const { horaInicio } = this.parent;
                    if (!value || !horaInicio) return true;
                    return value > horaInicio;
                }),
    agencia:        yup.string().nullable(),
    lugar:          yup.string().nullable(),
    totalPrincipal: yup.string().nullable(),
    totalSuplente:  yup.string().nullable(),
});

export default function Frm({data, tipo}) {

     const { register, handleSubmit, getValues, setError, clearErrors, reset, control, setValue, formState: { errors } } = useForm({
        resolver: yupResolver(schema),
        defaultValues: tipo !== 'I'
            ? { codigo: data.eledelid, titulo: data.eledeltitulo, periodo: data.eledelperiodo, horaInicio:data.eledelhorainicio,
                horaCierre:data.eledelhoracierre, agencia:'', lugar:'', totalPrincipal:'',  totalSuplente:'', tipo: tipo }
            : { codigo: '000', titulo: '', periodo: '', horaInicio:'', horaCierre:'', 
                agencia:'', lugar:'', totalPrincipal:'',  totalSuplente:'', tipo: tipo }
    });

    const [delegadosAgencias, setDelegadosAgencias] = useState([]);
    const [habilitado, setHabilitado] = useState(true);
    const [agencias, setAgencias] = useState([]);
    const [loader, setLoader] = useState(false);

    const adicionarFila = () => {
        const totalPrincipal = getValues('totalPrincipal');
        const totalSuplente  = getValues('totalSuplente');
        const agencia        = getValues('agencia');
        const lugar          = getValues('lugar');

        if (!agencia) {
            setError('agencia', {type: 'manual',  message: 'Debe seleccionar una agencia' });
            return;
        }
        clearErrors('agencia');

        if (!lugar) {
            setError('lugar', {type: 'manual',  message: 'Debe ingresar el lugar' });
            return;
        }
        clearErrors('lugar');

         if (!totalPrincipal) {
            setError('totalPrincipal', {type: 'manual',  message: 'Debe ingresar el total delegado principal' });
            return;
        }
        clearErrors('totalPrincipal');

        if (Number(totalPrincipal) > 99) {
            setError('totalPrincipal', { type: 'manual', message: 'El total de delegados principales no puede ser mayor a 99'});
            return;
        }
        clearErrors('totalPrincipal');

        if (!totalSuplente) {
            setError('totalSuplente', {type: 'manual',  message: 'Debe ingresar el total delegado suplente' });
            return;
        }
        clearErrors('totalSuplente');

        if (Number(totalSuplente) > 99) {
            setError('totalSuplente', {type: 'manual', message: 'El total de delegados suplentes no puede ser mayor a 99'});
            return;
        }
        clearErrors('totalSuplente');

        if (delegadosAgencias.some(data => data.agencia == agencia)) {
            ShowSnackbar('Este registro ya fue adicionado', 'error');
            return;
        }

        const resultAgencias  = agencias.filter((data) => data.agenid == agencia);
        let newDelegadosAgencias = [...delegadosAgencias];
        newDelegadosAgencias.push({identificador: '', agencia: agencia, nombreAgencia: resultAgencias[0].agennombre, lugar: lugar, 
                              totalPrincipal: totalPrincipal, totalSuplente: totalSuplente, estado: 'I'});
        setDelegadosAgencias(newDelegadosAgencias);
        setValue('totalPrincipal', '');
        setValue('totalSuplente', '');
        setValue('agencia', '');
        setValue('lugar', '');
    };

    const eliminarFila = (id) =>{
        let newDelegadosAgencias = []; 
        delegadosAgencias.map((res,i) =>{
            if(res.estado === 'U' && i === id){
                newDelegadosAgencias.push({ identificador:res.identificador, agencia: res.agencia, nombreAgencia:res.nombreAgencia,
                    lugar: res.lugar, totalPrincipal: res.totalPrincipal, totalSuplente: res.totalSuplente, estado: 'D' });
            }else if(res.estado === 'D' && i === id){
                newDelegadosAgencias.push({identificador:res.identificador, agencia: res.agencia, nombreAgencia:res.nombreAgencia, 
                    lugar: res.lugar, totalPrincipal: res.totalPrincipal, totalSuplente: res.totalSuplente, estado: 'U'});
            }else if((res.estado === 'D' || res.estado === 'U') && i !== id){
                newDelegadosAgencias.push({identificador:res.identificador, agencia: res.agencia, nombreAgencia:res.nombreAgencia,
                    lugar: res.lugar, totalPrincipal: res.totalPrincipal, totalSuplente: res.totalSuplente, estado:res.estado});
            }else{
                if(i != id){
                    newDelegadosAgencias.push({identificador:res.identificador, agencia: res.agencia, nombreAgencia:res.nombreAgencia, 
                        lugar: res.lugar, totalPrincipal: res.totalPrincipal, totalSuplente: res.totalSuplente, estado: 'I' });
                }
            }
        })
        setDelegadosAgencias(newDelegadosAgencias);
    }

    const onSubmit = (formValues) => {

        if(delegadosAgencias.length === 0){
            ShowSnackbar('Debe adicionar como mínimo una agencia', 'error');
            return
        }

        const payload = {
            ...formValues,
            agencias: delegadosAgencias
        };

        setLoader(true);
        instance.post('/admin/eleccion/delegado/gestion/salve', payload).then(res => {
            let icono = res.success ? 'success' : 'error';
            ShowSnackbar(res.message, icono);
            (tipo !== 'I' && res.success) ? setHabilitado(false) : null; 
            (tipo === 'I' && res.success) ? reset({codigo: '000', titulo: '', periodo: '', horaInicio:'', horaCierre:'', 
                                                agencia:'', lugar:'', totalPrincipal:'',  totalSuplente:'', tipo: tipo }) : null;
            (tipo === 'I' && res.success) ? setDelegadosAgencias([]) : null;
            setLoader(false);
        });
    };

    useEffect(()=>{
        setLoader(true);
        instance.post('/admin/eleccion/delegado/gestion/list/datos', {codigo: data?.eledelid || '000', tipo:tipo}).then(res=>{
            setAgencias(res.agencias);
            if(tipo === 'U' && res.success){
                let newDelegadosAgencias = [];
                res.delegadosAgencias.forEach(function(data){
                    newDelegadosAgencias.push({
                        identificador:  data.eldeagid,
                        agencia:        data.agenid,
                        nombreAgencia:  data.agennombre,
                        lugar:          data.eldeaglugar,
                        totalPrincipal: data.eldeagnumerodeleprincipal,
                        totalSuplente:  data.eldeagnumerodelesuplente,
                        estado: 'U'
                    });
                });
                setDelegadosAgencias(newDelegadosAgencias);
            }
            setLoader(false);
        })
    }, []);

    if (loader) {
        return <LoaderModal />;
    }

    return (
        <form onSubmit={handleSubmit(onSubmit)}>

            <Grid container spacing={2}>

                <Grid size={{ xs: 12, sm: 6 }}>
                    <TextField
                        label="Título"
                        fullWidth
                        variant="standard"
                        {...register("titulo")}
                        error={!!errors.titulo}
                        helperText={errors.titulo?.message}
                        slotProps={{
                                htmlInput: {
                                    autoComplete: "off",
                                    maxLength: 150
                                }
                            }}
                    />
                </Grid>

                <Grid size={{ xs: 6, sm: 2 }}>
                    <TextField
                        label="Período"
                        fullWidth
                        variant="standard"
                        {...register("periodo")}
                        error={!!errors.periodo}
                        helperText={errors.periodo?.message}
                        slotProps={{
                                htmlInput: {
                                    autoComplete: "off",
                                    maxLength: 20
                                }
                            }}
                    />
                </Grid>

                <Grid size={{ xs: 6, sm: 2 }}>
                    <TextField
                        label="Hora de inicio"
                        type="time"
                        fullWidth
                        variant="standard"
                        {...register("horaInicio")}
                        error={!!errors.horaInicio}
                        helperText={errors.horaInicio?.message}
                        slotProps={{
                                htmlInput: {
                                    autoComplete: "off",
                                    step: 60
                                }
                            }}
                    />
                </Grid>

                <Grid size={{ xs: 6, sm: 2 }}>
                    <TextField
                        label="Hora de cierre"
                        type="time"
                        fullWidth
                        variant="standard"
                        {...register("horaCierre")}
                        error={!!errors.horaCierre}
                        helperText={errors.horaCierre?.message}              
                        slotProps={{
                            inputLabel: { shrink: true },
                            htmlInput: {
                                autoComplete: "off",
                                step: 60
                            }
                        }}
                    />
                </Grid>

                <Grid size={{ xs: 12 }}>
                    <Box className='divisionFormulario'>
                        Asignar información de las agencias
                    </Box>
                </Grid>

                <Grid size={{ xs: 6, sm: 2 }}>
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

                 <Grid size={{ xs: 12, sm: 4 }}>
                    <TextField
                        label="Lugar"
                        fullWidth
                        variant="standard"
                        {...register("lugar")}
                        error={!!errors.lugar}
                        helperText={errors.lugar?.message}
                        slotProps={{
                                htmlInput: {
                                    autoComplete: "off",
                                    maxLength: 90
                                }
                            }}
                    />
                </Grid>

                <Grid size={{ xs: 6, sm: 2 }}>
                    <TextField
                        label="Total delegado principal"
                        type="number"
                        variant="standard"
                        {...register("totalPrincipal")}
                        error={!!errors.totalPrincipal}
                        helperText={errors.totalPrincipal?.message}
                    />
                </Grid>

                <Grid size={{ xs: 6, sm: 2 }}>
                    <TextField
                        label="Total delegado suplente"
                        type="number"
                        variant="standard"
                        {...register("totalSuplente")}
                        error={!!errors.totalSuplente}
                        helperText={errors.totalSuplente?.message}
                    />
                </Grid>

                <Grid size={{ xs: 6, sm: 2 }} style={{textAlign: 'center'}}>
                    <Button type={"button"} className={'modalBtnIcono'} 
                        startIcon={<Add className='icono' />} onClick={() => {adicionarFila()}}> {"Agregar"}
                    </Button>
                </Grid>

                {(delegadosAgencias.length > 0) ?
                    <Fragment>
                        <Grid size={{ xs: 12 }}>
                            <Box className='divisionFormulario'>
                                Información de las agencias asignada a la elección de delegados
                            </Box>
                        </Grid>

                        <Grid size={{ xs: 12 }}>
                            <Table className={'tableAdicional'} sx={{width: '90%', margin:'auto'}} sm={{maxHeight: '96%', margin:'auto'}} >
                                <TableHead>
                                    <TableRow>
                                        <TableCell>Agencia</TableCell>
                                        <TableCell>Lugar</TableCell>
                                        <TableCell>Total delegado principal</TableCell>
                                        <TableCell>Total delegado suplente</TableCell>
                                        <TableCell style={{width: '10%'}} className='cellCenter'>Acción </TableCell>
                                    </TableRow>
                                </TableHead>
                                <TableBody>
                                { delegadosAgencias.map((data, a) => {
                                    return(
                                        <TableRow key={'rowD-' +a} className={(data['estado'] == 'D') ? 'tachado': null}>
                                            <TableCell>
                                                {data['nombreAgencia']}
                                            </TableCell> 

                                            <TableCell>
                                                {data['lugar']}
                                            </TableCell> 

                                             <TableCell>
                                                {data['totalPrincipal']}
                                            </TableCell> 

                                            <TableCell>
                                                {data['totalSuplente']}
                                            </TableCell>

                                            <TableCell className='cellCenter'>
                                                <Icon key={'iconDelete'+a} className={'icon top red'}
                                                        onClick={() => {eliminarFila(a);}}
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

            <Box className={'botonesModal'} style={{marginTop:'1em'}}>
                <Button type="submit" className={'modalBtn'} disabled={!habilitado} startIcon={(tipo === 'I') ? <Save /> : <SaveAs />} >
                    {(tipo === 'I') ? "Guardar" : "Actualizar"}
                </Button>
            </Box>

        </form>
    );
}