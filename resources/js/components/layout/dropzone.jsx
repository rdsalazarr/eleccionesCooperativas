import { useCallback } from "react";
import logoNoVistaPrevia from "../../../images/files/noVistaPrevia.png";
import InsertDriveFileIcon from '@mui/icons-material/InsertDriveFile';
import DescriptionIcon from '@mui/icons-material/Description';
import TableChartIcon from '@mui/icons-material/TableChart';
import { useDropzone } from "react-dropzone";
import {ShowSnackbar} from "./snackBar";
import { Box } from "@mui/material";
import '../../../scss/files.scss';

export function Dropzone({nombre, accept, maxFiles, label, handleFiles, maxFileSize = 2000000, currentFiles = []}) {
    const onDrop = useCallback(
        (acceptedFiles, fileRejections) => {
            if (fileRejections && fileRejections.length > 0) {
                fileRejections.forEach(({ file, errors }) => {
                    errors.forEach((err) => {
                        if (err.code === "file-invalid-type") {
                            ShowSnackbar(`El archivo ${file.name} no tiene una extensión permitida`, "error");
                        }else if (err.code === "file-too-large") {
                            ShowSnackbar(`El archivo ${file.name} supera el tamaño máximo permitido (${(maxFileSize / 1024 / 1024).toFixed(2)} MB).`, "error");
                        }else if (err.code === "too-many-files") {
                            ShowSnackbar(`Solo se permite subir ${maxFiles} archivo${maxFiles > 1 ? "s" : ""}.`, "error" );
                        }else {
                            ShowSnackbar(`El archivo ${file.name} fue rechazado: ${err.message || err.code}`, "error");
                        }
                    });
                });
            }

            // Normalizamos las extensiones permitidas (array plano de extensiones sin punto, ej: ['pdf','jpg'])
            let validExtensions = [];
            if (Array.isArray(accept)) {
                validExtensions = accept.map((ext) => ext.replace(".", "").toLowerCase());
            } else if (accept && typeof accept === "object") {
                validExtensions = Object.values(accept)
                .flat()
                .map((ext) => ext.replace(".", "").toLowerCase());
            }

            const totalFiles = currentFiles.length + acceptedFiles.length;
            // Validar cantidad total de archivos seleccionados
            if (totalFiles > maxFiles) {
                ShowSnackbar( `Solo se permite subir ${maxFiles} archivo${maxFiles > 1 ? "s" : ""}. Actualmente tiene ${currentFiles.length} y está intentando agregar ${acceptedFiles.length}.`, "error" );
                return;
            }

        // Filtrar por extensión y tamaño (por si acceptedFiles viene vacío por rechazos, esto no rompe)
        const validFiles = acceptedFiles.filter((file) => {
            const fileExtension = file.name.split(".").pop().toLowerCase();

            if (validExtensions.length > 0 && !validExtensions.includes(fileExtension)) {
                ShowSnackbar(`El archivo ${file.name} tiene una extensión no permitida.`, "error");
                return false;
            }

            if (file.size > maxFileSize) {
                ShowSnackbar(`El archivo ${file.name} supera el tamaño máximo permitido (${(maxFileSize / 1024 / 1024).toFixed(2)} MB).`, "error" );
                return false;
            }

            return true;
        });

        if (validFiles.length === 0) {
            // Si no hay archivos válidos (o todos fueron rechazados), no hacemos nada más.
            return;
        }

        // Preparar archivos para enviar al padre
        const processedFiles = validFiles.map((file) => {
            const isImage = file.type && file.type.startsWith("image/");
            const isPdf = file.type === "application/pdf";

            return {
                file,
                name: file.name,
                extension: file.name.split(".").pop(),
                preview: isImage || isPdf ? URL.createObjectURL(file) : null,
                type: file.type,
            };
        });

        handleFiles(nombre, processedFiles);
        },
        [accept, nombre, handleFiles, maxFiles, maxFileSize]
    );

    const acceptProp = Array.isArray(accept)
                            ? Object.fromEntries(
                                accept.map(ext => {
                                    const mime =
                                    ext === '.pdf' ? 'application/pdf' :
                                    ext === '.doc' ? 'application/msword' :
                                    ext === '.docx' ? 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' :
                                    ext === '.xls' ? 'application/vnd.ms-excel' :
                                    ext === '.xlsx' ? 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' :
                                    `image/${ext.replace('.', '')}`;

                                    return [mime, [ext]];
                                })
                                )
                            : accept;

    const { getRootProps, getInputProps } = useDropzone({
        onDrop,
        accept: acceptProp,
        multiple: maxFiles > 1,
        maxFiles,
        maxSize: maxFileSize,
    });

    return (
        <Box {...getRootProps()} className="filesDropzone">
            <input {...getInputProps()} />
            <p>{label}</p>
        </Box>
    );
}

export function ContentFile({ file, label, name, remove }) {

    const extension = String(file.extension).toLowerCase();
    const isImage   = ['jpg','jpeg','png','gif','webp'].includes(extension);
    const isWord    = ['doc','docx'].includes(extension);
    const isExcel   = ['xls','xlsx'].includes(extension);
    const isPdf     = extension === 'pdf';

    return (
        <Box className="fileInd">

            {isImage && (<img className="fileImg" src={file.preview} alt="preview" /> )}
            {isPdf && (<iframe className="fileImg" src={file.preview} /> )}
            {isWord && (<Box className="fileIconWrapper"> <DescriptionIcon sx={{ fontSize: "4rem", color: "#1976d2" }} /></Box>)}
            {isExcel && (<Box className="fileIconWrapper"> <TableChartIcon sx={{ fontSize: "4rem", color: "#2e7d32" }} /> </Box>)}
            {!isImage && !isPdf && !isWord && !isExcel && (<Box className="fileIconWrapper"><InsertDriveFileIcon sx={{ fontSize: 80 }} /> </Box>   )}

            <Box onClick={() => { remove(label, name); }} className={'eliminar'}>Eliminar </Box>
        </Box>
    );
}

export function canPreviewFile(file, extension) {
  const previewableExtensions = ['pdf', 'jpg', 'jpeg', 'png', 'gif'];
  return (previewableExtensions.includes(String(extension).toLowerCase())) ? file.preview : logoNoVistaPrevia;
}