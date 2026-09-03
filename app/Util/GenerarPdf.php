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

        $this->SetY(254);
        $this->SetX(15);
        $this->SetFont('helvetica','',10);
        $this->SetTextColor(128);
        $this->Line(30, 254, 190, 254);//colocamos la linea
        $this->Cell(192,4,$direccionEmpresa,0,0,'C');
        $this->Ln(4); 
        $this->Cell(192,4,$correoEmpresa,0,0,'C');
        $this->Ln(4); 
        $this->Cell(192,4,$telefonosEmpresa,0,0,'C');
        $this->Ln(4); 
        $this->Cell(192,4,$urlEmpresa,0,0,'C');
    }

    public static function inscripcionDelegado($data, $empresa, $metodo = 'I')
    {
        $numeroInscripcion = $data['numeroInscripcion'] ?? '';
        $tituloEleccion    = $data['tituloEleccion'] ?? '';
        $contenido         = $data['contenido'] ?? '';

        $nombreEmpresa   = $empresa->emprnombre;
        $siglaEmpresa    = $empresa->emprsigla;
        $nitEmpresa      = $empresa->emprnit;
        $parametrosFijos = [
            'urlEmpresa'       => $empresa->emprurl,
            'nitEmpresa'       => $empresa->nitEmpresa,
            'logoEmpresa'      => $empresa->logoEmpresa,
            'lemaEmpresa'      => $empresa->emprlema,
            'nombreEmpresa'    => $empresa->emprnombre,
            'correoEmpresa'    => $empresa->correoElectronico,
            'direccionEmpresa' => $empresa->direccionEmpresa,
            'telefonosEmpresa' => $empresa->telefonosEmpresa,
        ];

       
        $tcpdf = new GenerarPdf('P', 'mm', 'LETTER', true, 'UTF-8', false);
         $tcpdf->SetProtection(array('copy'), '', null, 0, null);
        $tcpdf->setParametrosHeader($parametrosFijos);
        $tcpdf->setParametrosFooter($parametrosFijos); 
        $tcpdf->SetPrintHeader(true);
        $tcpdf->SetPrintFooter(true);
        $tcpdf->SetMargins(20, 40, 20);
        $tcpdf->SetAutoPageBreak(true, 35);
        $tcpdf->AddPage('P', 'LETTER');
        $tcpdf->SetAuthor($nombreEmpresa.' '.$siglaEmpresa); 
        $tcpdf->SetCreator('Sistema elecciones de '.$siglaEmpresa);
        $tcpdf->SetSubject('INSCRIPCIÓN DELEGADOS DE '.$siglaEmpresa);
        $tcpdf->SetKeywords('Sistema, Delegados, '.$siglaEmpresa.', IMPLESOFT, '.$numeroInscripcion);
        $tcpdf->SetTitle('Certificado aspirante a delegado número '.$numeroInscripcion);
               
        $tcpdf->SetFont('helvetica','B',12);
        $tcpdf->Ln(4); 
        $tcpdf->Cell(170,5,$nombreEmpresa,0,0,'C');
        $tcpdf->Ln(5);
        $tcpdf->Cell(170,5,$siglaEmpresa,0,0,'C');
        $tcpdf->Ln(5);
        $tcpdf->Cell(170,5,$nitEmpresa,0,0,'C');
        $tcpdf->Ln(10);

        $tcpdf->MultiCell(170,4,$tituloEleccion,0,'C',0);
        $tcpdf->SetFont('helvetica','',12);
        $tcpdf->Ln(8);
        $tcpdf->writeHTML($contenido, true, 0, true, true);
        $tcpdf->Ln(12);

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