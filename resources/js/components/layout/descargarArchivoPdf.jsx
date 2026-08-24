import instance from './instance';
import {ShowSnackbar} from './snackBar';

/**
 * Descarga un archivo desde un endpoint que devuelve JSON con:
 * {
 *   filename: string,
 *   contenido: base64 string
 * }
 * 
 * @param {string} url - Endpoint de la API
 * @param {object} payload - Datos a enviar en POST
 * @param {function} setLoader - Opcional: función para activar/desactivar loader
 */
const descargarArchivoPdf = async (url, payload = {}, setLoader = null) => {
  try {
    if (setLoader) setLoader(true);

    const response = await instance.post(url, payload);

    if (!response || !response.contenido || !response.filename) {
      console.error('No se recibió contenido del archivo', response);
      ShowSnackbar('No se recibió contenido del archivo', 'error');
      if (setLoader) setLoader(false);
      return;
    }

    const { filename, contenido } = response;

    // Convertir Base64 a bytes
    const byteCharacters = atob(contenido);
    const byteNumbers = new Array(byteCharacters.length);
    for (let i = 0; i < byteCharacters.length; i++) {
      byteNumbers[i] = byteCharacters.charCodeAt(i);
    }
    const byteArray = new Uint8Array(byteNumbers);

    // Crear Blob y URL temporal
    const blob = new Blob([byteArray], { type: 'application/pdf' });
    const urlBlob = window.URL.createObjectURL(blob);

    // Disparar descarga
    const link = document.createElement('a');
    link.href = urlBlob;
    link.setAttribute('download', filename);
    document.body.appendChild(link);
    link.click();

    // Limpiar recursos
    link.remove();
    window.URL.revokeObjectURL(urlBlob);

    if (setLoader) setLoader(false);
    ShowSnackbar(`Archivo ${filename} descargado correctamente`, 'success');

  } catch (err) {
    console.error('Error al descargar el archivo:', err);
    ShowSnackbar('Error al descargar el archivo', 'error');
    if (setLoader) setLoader(false);
  }
};

export default descargarArchivoPdf;
