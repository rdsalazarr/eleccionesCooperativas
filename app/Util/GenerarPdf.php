<?php

namespace App\Util;

use Exception, Auth, DB, URL, File, TCPDF;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Crypt;
use App\Util\Encrypt;
use App\Util\General;
use Carbon\Carbon;

class GenerarPdf extends TCPDF
{
    protected array $parametrosHeader = [];
    protected array $parametrosFooter = [];

    public function setParametrosHeader(array $parametros): void
    {
        $this->parametrosHeader = $parametros;
    }

    public function setParametrosFooter(array $parametros): void
    {
        $this->parametrosFooter = $parametros;
    }

    public function Header()
    {
        $parametros    = $this->parametrosHeader;
		$nitEmpresa    = $parametros['nitEmpresa']    ?? '';
        $nombreEmpresa = $parametros['nombreEmpresa'] ?? '';
        $lemaEmpresa   = $parametros['lemaEmpresa']   ?? '';
        $logoEmpresa   = $parametros['logoEmpresa']   ?? '';

        $this->Image($logoEmpresa,30,4,25,22);
        $this->SetY(6);
        $this->SetX(40);
        $this->SetFont('helvetica','B',14);
        $this->Cell(140,5,$nombreEmpresa,0,0,'C');
        $this->Ln(6); 
        $this->SetX(40);
        $this->SetFont('helvetica','',12);
        $this->Cell(140,5,$lemaEmpresa,0,0,'C');
        $this->Ln(6);
        $this->SetX(40);
        $this->Cell(140,5,$nitEmpresa,0,0,'C'); 
        $this->Line(30, 28, 190, 28);//colocamos las lineas
        $this->SetY(26);
        $this->SetX(178);
        $this->SetFont('helvetica','I',8);
        $this->SetTextColor(128);
        $this->Cell(0, 10, 'Página. '.$this->getAliasNumPage().'('.$this->getAliasNbPages().')', 0, false, 'C', 0, '', 0, false, 'T', 'M');
    }

	public function Footer()
    {
        $parametros       = $this->parametrosFooter;         
		$urlEmpresa       = $parametros['urlEmpresa']       ?? '';       
        $correoEmpresa    = $parametros['correoEmpresa']    ?? '';
        $telefonosEmpresa = $parametros['telefonosEmpresa'] ?? '';
        $direccionEmpresa = $parametros['direccionEmpresa'] ?? '';

        $this->SetY(274);
        $this->SetX(15);
        $this->SetFont('helvetica','',10);
        $this->SetTextColor(128);
        $this->Line(30, 274, 190, 274);//colocamos la linea
        $this->Cell(192,4,$direccionEmpresa,0,0,'C');
        $this->Ln(4); 
        $this->Cell(192,4,$correoEmpresa,0,0,'C');
        $this->Ln(4); 
        $this->Cell(192,4,$telefonosEmpresa,0,0,'C');
        $this->Ln(4); 
        $this->Cell(192,4,$urlEmpresa,0,0,'C');
    }

    public static function registro($solicitud, $anexos=[], $empresa, $metodo = 'I')
	{
        $esAnonimo 		       = $solicitud->esAnonimo;
	   	$tipoSolicitud 		   = $solicitud->tipsolnombre;
        $consecutivo 		   = $solicitud->consecutivo;
        $fechaRegistro         = $solicitud->solifechahora;
        $solicitudAnonima      = $solicitud->anonimo;
        $medioRecepcion        = $solicitud->tipmednombre;
        $dependencia           = $solicitud->dependencias;
        $tipoDocumento         = $solicitud->tipidenombre;
        $numeroIdentificacion  = ($esAnonimo === 'NO') ? $solicitud->persdocumento : '';
        $nombrePeticionario    = ($esAnonimo === 'NO') ? $solicitud->nombrePeticionario : 'Usuario anónimo';
        $correoPeticionario    = ($esAnonimo === 'NO') ? $solicitud->perscorreo : '';
        $telefonoPeticionario  = ($esAnonimo === 'NO') ? $solicitud->telefonos : '';
        $direccionPeticionario = ($esAnonimo === 'NO') ? $solicitud->persdireccion : '';
        $pais                  = 'Colombia';
        $departamento          = $solicitud->muninombre;
        $municipio             = $solicitud->depanombre;
        $descripcion           = $solicitud->solidescripcion;

		$nombreEmpresa   = $empresa->emprnombre;
        $parametrosFijos = [
            'urlEmpresa'       => $empresa->emprurl,
            'nitEmpresa'       => $empresa->nitEmpresa,
            'logoEmpresa'      => $empresa->escudo,
            'lemaEmpresa'      => $empresa->emprlema,
            'codigoPostal'     => $empresa->codigoPostal,
            'nombreEmpresa'    => $empresa->emprnombre,
            'correoEmpresa'    => $empresa->correoElectronico,
            'direccionEmpresa' => $empresa->direccionEmpresa,
            'telefonosEmpresa' => $empresa->telefonosEmpresa,
        ];

        $tcpdf = new GenerarPdf('P', 'mm', 'LEGAL', true, 'UTF-8', false);
        $tcpdf->SetAuthor($nombreEmpresa); 
        $tcpdf->SetCreator('Sistema PQRSDF de IMPLESOFT');
        $tcpdf->SetSubject('Registro de la solicitud con número '.$consecutivo);
        $tcpdf->SetKeywords('Registro, Solicitud,'.$consecutivo);
        $tcpdf->SetTitle('Registro de la solicitud número '.$consecutivo);
        $tcpdf->SetProtection(array('copy'), '', null, 0, null);
        $tcpdf->setParametrosHeader($parametrosFijos);
		$tcpdf->setParametrosFooter($parametrosFijos); 
        $tcpdf->SetPrintHeader(true);
        $tcpdf->SetPrintFooter(true);
        $tcpdf->AddPage('P', 'Letter');
        #Establecemos los márgenes izquierda, arriba y derecha
        $tcpdf->SetMargins(15, 40 , 10);
        $tcpdf->SetAutoPageBreak(true,35);
        $tcpdf->SetY(36);

        $tcpdf->SetFont('helvetica','B',11);
        $tcpdf->MultiCell(184, 4,'FORMATO ÚNICO PARA LA PRESENTACIÓN DE PETICIONES, QUEJAS, RECLAMOS, SUGERENCIAS, DENUNCIAS POR HECHOS DE CORRUPCIÓN Y FELICITACIONES DE CLIENTES Y PARTES INTERESADAS',0,'C',0); 
        $tcpdf->Ln(2);
        $tcpdf->SetTextColor(178,176,180);
        $tcpdf->SetFont('helvetica','I',7);
        $tcpdf->MultiCell(0,3,'En cumplimiento de los principios de confidencialidad, transparencia y mejoramiento continuo, nos comprometemos a brindar un tratamiento adecuado a la información suministrada a través de este formulario, garantizando el cumplimiento de la normativa aplicable, la protección de los datos personales y una gestión oportuna de las solicitudes presentadas.'."\n",0,'J',0);
        $tcpdf->SetFont('helvetica','B',10);
        $tcpdf->SetTextColor(0);
        $tcpdf->Ln(2);

        $tcpdf->SetFillColor(240, 240, 240);
        $tcpdf->Cell(184,6,'DATOS GENERALES',0,0,'C', true);
        $tcpdf->Ln(8);

        $tcpdf->SetFont('helvetica','',12);
        $tcpdf->Cell(46,4,'Consecutivo:',0,0,'L');
        $tcpdf->Cell(138,4,$consecutivo,0,0,'L');
        $tcpdf->Ln(4);

        $tcpdf->Cell(46,4,'Fecha de radicación:',0,0,'L');
        $tcpdf->Cell(138,4,$fechaRegistro,0,0,'L');
        $tcpdf->Ln(4);

        $tcpdf->Cell(46,4,'Tipo de solicitud:',0,0,'L');
        $tcpdf->Cell(138,4,$tipoSolicitud,0,0,'L');
        $tcpdf->Ln(4);

        $tcpdf->Cell(46,4,'Solicitud anónima:',0,0,'L');
        $tcpdf->Cell(138,4,$solicitudAnonima,0,0,'L');
        $tcpdf->Ln(4);

        $tcpdf->Cell(46,4,'Medio de recepción:',0,0,'L');
        $tcpdf->Cell(138,4,$medioRecepcion,0,0,'L');
        $tcpdf->Ln(4);

        $tcpdf->Cell(46,4,'Dependencia:',0,0,'L');
        $tcpdf->MultiCell(138,4,$dependencia."\n",0,'J',0);
        $tcpdf->Ln(8);

        $tcpdf->SetFont('helvetica','B',10);
        $tcpdf->Cell(184,6,'DATOS DEL SOLICITANTE',0,0,'C', true);
        $tcpdf->Ln(8);       

        $tcpdf->SetFont('helvetica','',12);
        $tcpdf->Cell(46,4,'Tipo de documento:',0,0,'L');
        $tcpdf->Cell(138,4,$tipoDocumento,0,0,'L');
        $tcpdf->Ln(4);
    
        $tcpdf->Cell(46,4,'Número de documento:',0,0,'L');
        $tcpdf->Cell(138,4,$numeroIdentificacion,0,0,'L');
        $tcpdf->Ln(4);

        $tcpdf->Cell(46,4,'Nombre completo:',0,0,'L');
        $tcpdf->Cell(138,4,$nombrePeticionario,0,0,'L');
        $tcpdf->Ln(4);

        $tcpdf->Cell(46,4,'Correo electrónico:',0,0,'L');
        $tcpdf->Cell(138,4,$correoPeticionario,0,0,'L');
        $tcpdf->Ln(4);

        $tcpdf->Cell(46,4,'Teléfono:',0,0,'L');
        $tcpdf->Cell(138,4,$telefonoPeticionario,0,0,'L');
        $tcpdf->Ln(4);

        $tcpdf->Cell(46,4,'Dirección:',0,0,'L');
        $tcpdf->Cell(138,4,$direccionPeticionario,0,0,'L');
        $tcpdf->Ln(4);

        $tcpdf->Cell(46,4,'País:',0,0,'L');
        $tcpdf->Cell(138,4,$pais,0,0,'L');
        $tcpdf->Ln(4);

        $tcpdf->Cell(46,4,'Departamento:',0,0,'L');
        $tcpdf->Cell(138,4,$departamento,0,0,'L');
        $tcpdf->Ln(4);

        $tcpdf->Cell(46,4,'Municipio:',0,0,'L');
        $tcpdf->Cell(138,4,$municipio,0,0,'L');
        $tcpdf->Ln(12);

        $tcpdf->SetFont('helvetica','B',10);
        $tcpdf->Cell(184,6,'DESCRIPCIÓN DE LA SOLICITUD',0,0,'C', true);
        $tcpdf->Ln(8);

        $tcpdf->SetFont('helvetica','',12);
        $tcpdf->MultiCell(184, 4, $descripcion."\n",0,'J',0); 
        $tcpdf->Ln(4);

        $tcpdf->SetFont('helvetica','B',10);
        $tcpdf->Cell(184,6,'DOCUMENTOS ANEXOS',0,0,'C', true);
        $tcpdf->Ln(8);

        $tcpdf->SetFont('helvetica','',12);
        if(count($anexos) > 0){
            foreach($anexos as $anexo){
                $solanenombre = $anexo->solanenombre;
                $solaneruta   = asset('/archivos/solicitud/'.Crypt::decrypt($anexo->solaneruta));
                //Generamos el enlace
                $html = <<<EOD
                            <a href="$solaneruta" target="_blank" title="$solanenombre">$solanenombre</a>
                        EOD;
                $tcpdf->writeHTMLCell($w=0, $h=0, $x='', $y='', $html, $border=0, $ln=1, $fill=0, $reseth=true, $align='', $autopadding=true);
            }
        }else{
            $tcpdf->Cell(21,4,'No se relacionó ningún archivo',0,0,'');
        }

        //Descargo o muestro el pdf
		$tituloPdf = $consecutivo.'.pdf';
        if($metodo == 'F'){
            $rutaPDF = public_path().'/archivos/pdf/REG-'.$tituloPdf;
            $tcpdf->output($rutaPDF, 'f');
            return $rutaPDF;
		}elseif($metodo === 'S'){
            return base64_encode($tcpdf->output($tituloPdf, 'S'));
        }else{
            $tcpdf->output($tituloPdf, 'I');
        }
	}

    public static function inscripcionDelegado($data, $empresa, $metodo = 'I')
    {
        $numeroInscripcion = $data['numeroInscripcion'] ?? '';
        $tituloEleccion    = $data['tituloEleccion'] ?? '';
        $contenido         = $data['contenido'] ?? '';

        $nombreEmpresa = $empresa->emprnombre;
        $siglaEmpresa  = $empresa->emprsigla;
        $nitEmpresa    = $empresa->emprnit;
        $parametrosFijos = [
            'urlEmpresa'       => $empresa->emprurl,
            'nitEmpresa'       => $empresa->nitEmpresa,
            'logoEmpresa'      => $empresa->escudo,
            'lemaEmpresa'      => $empresa->emprlema,           
            'nombreEmpresa'    => $empresa->emprnombre,
            'correoEmpresa'    => $empresa->correoElectronico,
            'direccionEmpresa' => $empresa->direccionEmpresa,
            'telefonosEmpresa' => $empresa->telefonosEmpresa,
        ];

        $tcpdf = new GenerarPdf('P', 'mm', 'LEGAL', true, 'UTF-8', false);
        $tcpdf->SetAuthor($nombreEmpresa); 
        $tcpdf->SetCreator('Sistema elecciones de '.$siglaEmpresa);
        $tcpdf->SetSubject('INSCRIPCIÓN DELEGADOS DE '.$siglaEmpresa);
        $tcpdf->SetKeywords('Sistema, Delegados, '.$siglaEmpresa.', IMPLESOFT, '.$numeroInscripcion);
        $tcpdf->SetTitle('Certificado aspirante a delegado número '.$numeroInscripcion);
        $tcpdf->SetProtection(array('copy'), '', null, 0, null);
        $tcpdf->setParametrosHeader($parametrosFijos);
		$tcpdf->setParametrosFooter($parametrosFijos); 
        $tcpdf->SetPrintHeader(true);
        $tcpdf->SetPrintFooter(true);
        $tcpdf->AddPage('P', 'Letter');
        #Establecemos los márgenes izquierda, arriba y derecha
        $tcpdf->SetMargins(20, 40 , 20);
        $tcpdf->SetAutoPageBreak(true,35);
        $tcpdf->SSetFont('helvetica','B',12);
        $tcpdf->SLn(28); 
        $tcpdf->SCell(170,5,$nombreEmpresa,0,0,'C');
        $tcpdf->SLn(5);
        $tcpdf->SCell(170,5,$siglaEmpresa,0,0,'C');
        $tcpdf->SLn(5);
        $tcpdf->SCell(170,5,$nitEmpresa,0,0,'C');
        $tcpdf->SLn(10);
        
        $tcpdf->SMultiCell(170,4,$tituloEleccion,0,'C',0);
        $tcpdf->SSetFont('helvetica','',12);
        $tcpdf->SLn(8);        
        $tcpdf->SwriteHTML($contenido, true, 0, true, true);
        $tcpdf->SLn(12);

        //Descargo o muestro el pdf
		$tituloPdf = $numeroInscripcion.'.pdf';
        if($metodo == 'F'){
            $rutaPDF = public_path().'/archivos/pdf/'.$tituloPdf;
            $tcpdf->output($rutaPDF, 'F');
            return $rutaPDF;
		}elseif($metodo === 'S'){
            return base64_encode($tcpdf->output($tituloPdf, 'S'));
        }else{
            $tcpdf->output($tituloPdf, 'I');
        }
    }
}