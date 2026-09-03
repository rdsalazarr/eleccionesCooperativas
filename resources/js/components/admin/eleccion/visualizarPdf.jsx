import {useState , useEffect} from 'react';
import {ShowSnackbar} from '../../layout/snackBar';
import instancePdf from '../../layout/instancePdf';
import {LoaderModal} from "../../layout/loader";
import { Grid } from '@mui/material';

export default function VisualizarPdf({id, ruta}){

    const [loader, setLoader] = useState(false); 
    const [pdf, setPdf] = useState(null);

    useEffect(()=>{
        setLoader(true);
        instancePdf.post(ruta, {codigo: id}).then(res => {
            if (res.success === false || !res.data) {
                ShowSnackbar(res.message, "error");
                setLoader(false);
                return;
            }

            let url = 'data:application/pdf;base64,' + res.data;
            setPdf(url);
            setLoader(false);
        }).catch(() => {
            ShowSnackbar("Ocurrió un error al generar el PDF", "error");
            setLoader(false);
        });
    }, []);

    if(loader){
        return <LoaderModal />
    }

    return (
        <Grid size={{ xs: 12, sm: 12, md: 12, lg: 12, xl: 12 }}>
            {(pdf !== null) ?
                <iframe style={{width: '100%', height: '40em', border: 'none'}} 
                src={pdf} allow="fullscreen"/>
            :
                <div className='mensajePdf'>
                    No fue posible generar el PDF
                </div>
             }
        </Grid>
     );
}