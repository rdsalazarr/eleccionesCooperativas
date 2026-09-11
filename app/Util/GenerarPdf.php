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

    public static function listaAspiranteDelegado($data, $empresa, $metodo = 'I')
    {
        $tituloEleccion = $data['tituloEleccion'];
        $agencias       = $data['agencias'];

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

        $tcpdf->SetAuthor($nombreEmpresa.' '.$siglaEmpresa);
        $tcpdf->SetCreator('Sistema elecciones de '.$siglaEmpresa);
        $tcpdf->SetSubject('Lista delegados inscritos en '.$siglaEmpresa);
        $tcpdf->SetKeywords('Sistema, Delegados, '.$siglaEmpresa.', IMPLESOFT ');
        $tcpdf->SetTitle('Lista delegados inscritos en '.$siglaEmpresa);

        foreach($agencias as $agencia){
            $tcpdf->AddPage('P', 'LETTER');
            $tcpdf->SetFont('helvetica','B',12);
            $tcpdf->Cell(170,5,$nombreEmpresa,0,0,'C');
            $tcpdf->Ln(5);
            $tcpdf->Cell(170,5,$siglaEmpresa.mb_strtoupper(' agencia '.$agencia->agennombre,'UTF-8'),0,0,'C');
            $tcpdf->Ln(5);
            $tcpdf->Cell(170,5,$nitEmpresa,0,0,'C');
            $tcpdf->SetFont('helvetica','',12);
            $tcpdf->Ln(10);
            $tcpdf->MultiCell(170,4,$tituloEleccion,0,'L',0);
            $tcpdf->SetFont('helvetica','B',12);
            $tcpdf->Ln(8);
            $tcpdf->Cell(140,6,' NOMBRES Y APELLIDOS',1,0,'L'); 
            $tcpdf->Cell(40,6,'NÚMERO',1,0,'C');
            $tcpdf->Ln(6);
            $tcpdf->SetFont('helvetica','',9); 
           foreach ($agencia->aspirantes as $aspirante) {
                $tcpdf->Cell(140,6,' '.$aspirante->nombreCompleto,1,0,'L'); 
                $tcpdf->Cell(40,6,$aspirante->numeroAsignado,1,0,'C');
                $tcpdf->Ln(6);
            }
        }

        //Descargo o muestro el pdf
		$tituloPdf = 'Lista_aspirante_a_delegados.pdf';
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

    public static function actaInicio($data, $empresa, $metodo = 'I')
    {
        $tituloEleccion = $data['tituloEleccion'];  
        $agencias       = $data['agencias'];

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

        $tcpdf->SetAuthor($nombreEmpresa.' '.$siglaEmpresa);
        $tcpdf->SetCreator('Sistema elecciones de '.$siglaEmpresa);
        $tcpdf->SetSubject('ACTA DE INICIO DE ELECCIONES DE DELEGADOS DE '.$siglaEmpresa);
        $tcpdf->SetKeywords('Sistema, Delegados, '.$siglaEmpresa.', IMPLESOFT ');
        $tcpdf->SetTitle('Acta de inicio de elecciones de delegados de '.$siglaEmpresa);

        foreach($agencias as $agencia){
            $tcpdf->AddPage('P', 'Letter');
            $tcpdf->SetFont('helvetica','B',12);
            $tcpdf->Cell(170,5,$nombreEmpresa,0,0,'C');
            $tcpdf->Ln(5);
            $tcpdf->Cell(170,5,$siglaEmpresa,0,0,'C');
            $tcpdf->Ln(5);
            $tcpdf->Cell(170,5,$nitEmpresa,0,0,'C');
            $tcpdf->Ln(10);
            $tcpdf->MultiCell(170,4,$agencia->titulo,0,'C',0);
            $tcpdf->Ln(8);
            $tcpdf->SetFont('helvetica','',12);
            $tcpdf->MultiCell(0,4,$agencia->contenido."\n",0,'J',0);
            $tcpdf->Ln(24);

            $xInicial = $tcpdf->GetX();
            $yInicial = $tcpdf->GetY();

            $anchoColumna    = 80;
            $espacioColumnas = 15;

            foreach ($agencia->jurados as $indice => $jurado) {
                $columna = $indice % 2;
                $x       = $xInicial + ($columna * ($anchoColumna + $espacioColumnas));

                $tcpdf->SetXY($x, $yInicial);
                $tcpdf->Cell($anchoColumna, 4, $jurado->eldeajnombre, 'T',  0, 'L');   

                $tcpdf->SetXY($x, $yInicial);
                $tcpdf->Cell($anchoColumna, 4, $jurado->eldeajnombre, 'T', 0, 'L');

                $tcpdf->SetXY($x, $yInicial + 4);
                $tcpdf->Cell($anchoColumna, 4, $jurado->eldeajcargo, 0, 0, 'L');

                $tcpdf->SetXY($x, $yInicial + 8);
                $tcpdf->Cell($anchoColumna, 4, $jurado->eldeajdocumento, 0, 0, 'L');

                if ($columna == 1) {
                    $yInicial += 12;
                }
            }
        }

        //Descargo o muestro el pdf
		$tituloPdf = 'Acta_inicio_eleccion_delegados.pdf';
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

    public static function actaCierre($data, $empresa, $metodo = 'I')
    {
        $tituloEleccion = $data['tituloEleccion'];
        $agencias       = $data['agencias'];

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

        $tcpdf->SetAuthor($nombreEmpresa.' '.$siglaEmpresa);
        $tcpdf->SetCreator('Sistema elecciones de '.$siglaEmpresa);
        $tcpdf->SetSubject('ACTA DE CIERRE DE ELECCIONES DE DELEGADOS DE '.$siglaEmpresa);
        $tcpdf->SetKeywords('Sistema, Delegados, '.$siglaEmpresa.', IMPLESOFT ');
        $tcpdf->SetTitle('Acta de cierre de elecciones de delegados de '.$siglaEmpresa);

        foreach($agencias as $agencia){
            $tcpdf->AddPage('P', 'Letter');
            $tcpdf->SetFont('helvetica','B',12);
            $tcpdf->Cell(170,5,$nombreEmpresa,0,0,'C');
            $tcpdf->Ln(5);
            $tcpdf->Cell(170,5,$siglaEmpresa.mb_strtoupper(' agencia '.$agencia->agennombre,'UTF-8'),0,0,'C');
            $tcpdf->Ln(5);
            $tcpdf->Cell(170,5,$nitEmpresa,0,0,'C');
            $tcpdf->Ln(10);
            $tcpdf->MultiCell(170,4,$agencia->titulo,0,'C',0);
            $tcpdf->Ln(8);
            $tcpdf->SetFont('helvetica','',12);
            $tcpdf->MultiCell(0,4,$agencia->contenido."\n",0,'J',0);
            $tcpdf->Ln(12);
            $tcpdf->Cell(10,6,' N° ',1,0,'C');
            $tcpdf->Cell(40,6,' IDENTIFICACIÓN ',1,0,'L');
            $tcpdf->Cell(75,6,' NOMBRES Y APELLIDOS',1,0,'L'); 
            $tcpdf->Cell(20,6,'VOTOS',1,0,'C');
            $tcpdf->Cell(30,6,'CARGO',1,0,'C');
            $tcpdf->Ln(6);
            $tcpdf->SetFont('helvetica','',9); 
            $i          = 0;
            $votosTotal = 0;
            foreach($agencia->aspirantes as $aspirante){
                $votosTotal += $aspirante->totalVotos;
                $i ++;
                $totalPrincipal = $aspirante->eldeagnumerodeleprincipal;
                $totalSuplente  = $aspirante->eldeagnumerodelesuplente;
                $tituloCargo    = ($i <= $totalPrincipal && $aspirante->totalVotos > 0 ) ? 'PRINCIPAL' : (($i > $totalPrincipal and $i <= ($totalPrincipal + $totalSuplente)) ? 'SUPLENTE' : 'NO APTO');

                if($aspirante->totalVotos === '0'){
                    $tituloCargo    = 'CERO VOTOS';
                }

                $tcpdf->Cell(10,6, $i, 1, 0, 'C');
                $tcpdf->Cell(40,6,' '.$aspirante->tipoIdentificacion, 1, 0, 'L');
                $tcpdf->Cell(75,6,' '.$aspirante->nombreCompleto, 1, 0, 'L');
                $tcpdf->Cell(20,6,$aspirante->totalVotos, 1, 0, 'C');
                $tcpdf->Cell(30,6,$tituloCargo, 1, 0, 'C');
                $tcpdf->Ln(6);
            }

            $votosBlanco = 0;
            if($agencia->totalVotosBlanco){
                $votosBlanco = $agencia->totalVotosBlanco->votosBlanco;
            }

            $tcpdf->Ln(6);
            $tcpdf->Cell(30,6,'VOTO EN BLANCO',"0",0,'L');
            $tcpdf->Cell(20,6,$votosBlanco,"0",0,'C');
            $tcpdf->Cell(30,6,'',"0",0,'L'); 
            $tcpdf->Ln(6);
            $tcpdf->Cell(30,6,'TOTAL VOTOS',"0",0,'L'); 
            $tcpdf->Cell(20,6,$votosTotal,"0",0,'C');
            $tcpdf->Cell(30,6,'',"0",0,'L'); 

            $tcpdf->Ln(24);
            $tcpdf->SetFont('helvetica','',12);
            $tcpdf->Cell(60,6,' Para constancia firman: ',"0",0,'L');
            $tcpdf->Ln(28);

            $xInicial = $tcpdf->GetX();
            $yInicial = $tcpdf->GetY();

            $anchoColumna    = 80;
            $espacioColumnas = 15;

            foreach ($agencia->jurados as $indice => $jurado) {
                $columna = $indice % 2;
                $x       = $xInicial + ($columna * ($anchoColumna + $espacioColumnas));

                $tcpdf->SetXY($x, $yInicial);
                $tcpdf->Cell($anchoColumna, 4, $jurado->eldeajnombre, 'T',  0, 'L');

                $tcpdf->SetXY($x, $yInicial);
                $tcpdf->Cell($anchoColumna, 4, $jurado->eldeajnombre, 'T', 0, 'L');

                $tcpdf->SetXY($x, $yInicial + 4);
                $tcpdf->Cell($anchoColumna, 4, $jurado->eldeajcargo, 0, 0, 'L');

                $tcpdf->SetXY($x, $yInicial + 8);
                $tcpdf->Cell($anchoColumna, 4, $jurado->eldeajdocumento, 0, 0, 'L');

                if ($columna == 1) {
                    $yInicial += 12;
                }
            } 
        }

        //Descargo o muestro el pdf
		$tituloPdf = 'Acta_cierre_eleccion_delegados.pdf';
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

    public static function resultadosEleccionDelegados($data, $empresa, $metodo = 'I')
    {
        $eleccionDelegadoId = $data['eleccionDelegadoId'];
        $consecutivo        = $data['consecutivo'] ?? '';
        $tituloEleccion     = $data['tituloEleccion'];
        $agencias           = $data['agencias'];

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

        $tcpdf->SetAuthor($nombreEmpresa.' '.$siglaEmpresa);
        $tcpdf->SetCreator('Sistema elecciones de '.$siglaEmpresa);
        $tcpdf->SetSubject('Resultados de elección de delegados de '.$siglaEmpresa);
        $tcpdf->SetKeywords('Sistema, Delegados, '.$siglaEmpresa.', IMPLESOFT ');
        $tcpdf->SetTitle('Resultados de elección de delegados en '.$siglaEmpresa);

        foreach($agencias as $agencia){
            $tcpdf->AddPage('P', 'Letter');
            $tcpdf->SetFont('helvetica','B',12);
            $tcpdf->Cell(170,5,$nombreEmpresa,0,0,'C');
            $tcpdf->Ln(5);
            $tcpdf->Cell(170,5,$siglaEmpresa.mb_strtoupper(' agencia '.$agencia->agennombre,'UTF-8'),0,0,'C');
            $tcpdf->Ln(5);
            $tcpdf->Cell(170,5,$nitEmpresa,0,0,'C');
            $tcpdf->Ln(10);
            $tcpdf->MultiCell(170,4,$agencia->titulo,0,'C',0);
            $tcpdf->Ln(8);
            $tcpdf->SetFont('helvetica','',12);
            $tcpdf->Cell(20,6,'', 0,0,'C');
            $tcpdf->Cell(10,6,'N° ',1,0,'C');
            $tcpdf->Cell(120,6,' NOMBRES Y APELLIDOS',1,0,'L'); 
            $tcpdf->Cell(20,6,'VOTOS',1,0,'C');
            $tcpdf->Ln(6);

            $tcpdf->SetFont('helvetica','',9); 
            $votosTotal = 0;
            $i          = 0;
           foreach($agencia->aspirantes as $aspirante){
                $i ++;
                $votosTotal += $aspirante->totalVotos;
                $tcpdf->Cell(20,6,'', 1, 0,'C'); 
                $tcpdf->Cell(10,6, $i, 1, 0,'L');
                $tcpdf->Cell(120,6,' '.$aspirante->nombreCompleto, 1 ,0,'L'); 
                $tcpdf->Cell(20,6,$aspirante->totalVotos, 1 ,0,'C');
                $tcpdf->Ln(6);
            }

            $votosBlanco = 0;
            if($agencia->totalVotosBlanco){
                $votosBlanco = $agencia->totalVotosBlanco->votosBlanco;
            }

            $tcpdf->Ln(6);
            $tcpdf->Cell(30,6,'VOTO EN BLANCO',0,0,'L');
            $tcpdf->Cell(20,6,$votosBlanco,0,0,'C');
            $tcpdf->Ln(6);
            $tcpdf->Cell(30,6,'TOTAL VOTOS',0,0,'L');
            $tcpdf->Cell(20,6,$votosTotal,0,0,'C');
        }

        $tituloPdf    = 'Boletin_resultado_'.$eleccionDelegadoId.$consecutivo.'.pdf';
        if($metodo === 'F'){
            $directory = public_path('archivos/pdf/boletin');
            if (!File::isDirectory($directory)) {
                File::makeDirectory($directory, 0755, true, true);
            }           
            $rutaCompleta = $directory . DIRECTORY_SEPARATOR . $tituloPdf;
            $pdfContenido = $tcpdf->Output('', 'S');
            File::put($rutaCompleta, $pdfContenido);
        }elseif($metodo === 'S'){
            return base64_encode($tcpdf->output($tituloPdf, 'S'));
        }else{
            $tcpdf->output($tituloPdf, 'I');
        }

        return [
            'rutaPDF'    => $tituloPdf,
            'totalVotos' => $votosTotal + $votosBlanco
        ];
    }

    public static function listaDelegadoActivos($agencias, $empresa, $metodo = 'I')
    {
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

        $tcpdf->SetAuthor($nombreEmpresa.' '.$siglaEmpresa);
        $tcpdf->SetCreator('Sistema elecciones de '.$siglaEmpresa);
        $tcpdf->SetSubject('Lista delegados activos en '.$siglaEmpresa);
        $tcpdf->SetKeywords('Sistema, Delegados, '.$siglaEmpresa.', IMPLESOFT ');
        $tcpdf->SetTitle('Lista delegados activos en '.$siglaEmpresa);

        foreach($agencias as $agencia){
            $tcpdf->AddPage('P', 'LETTER');
            $tcpdf->SetFont('helvetica','B',12);
            $tcpdf->Cell(170,5,$nombreEmpresa,0,0,'C');
            $tcpdf->Ln(5);
            $tcpdf->Cell(170,5,$siglaEmpresa.mb_strtoupper(' agencia '.$agencia->agennombre,'UTF-8'),0,0,'C');
            $tcpdf->Ln(5);
            $tcpdf->Cell(170,5,$nitEmpresa,0,0,'C');
            $tcpdf->SetFont('helvetica','',12);
            $tcpdf->Ln(10);
            $tcpdf->MultiCell(170,4,'Lista de delegados hábiles',0,'L',0);
            $tcpdf->SetFont('helvetica','B',12);
            $tcpdf->Ln(8);
            $tcpdf->Cell(30,6,' DOCUMENTO',1,0,'L');
            $tcpdf->Cell(120,6,' NOMBRES Y APELLIDOS',1,0,'L');
            $tcpdf->Cell(30,6,'NÚMERO',1,0,'C');
            $tcpdf->Ln(6);
            $tcpdf->SetFont('helvetica','',9); 
           foreach ($agencia->delegados as $delegado) {
                $tcpdf->Cell(30,6,' '.$delegado->documento,1,0,'L'); 
                $tcpdf->Cell(120,6,' '.$delegado->nombreCompleto,1,0,'L'); 
                $tcpdf->Cell(30,6,$delegado->numeroInscripcion,1,0,'C');
                $tcpdf->Ln(6);
            }
        }

        //Descargo o muestro el pdf
		$tituloPdf = 'Lista_delegados_habiles.pdf';
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

    public static function generarToken($tokens, $metodo = 'I')
    {
        $tcpdf = new GenerarPdf('P', 'mm', 'LETTER', true, 'UTF-8', false);
        $tcpdf->SetProtection(array('copy'), '', null, 0, null);
        $tcpdf->SetPrintHeader(false);
        $tcpdf->SetPrintFooter(false);
        $tcpdf->SetMargins(15, 15, 15);
        $tcpdf->SetAutoPageBreak(true, 10);
        $tcpdf->AddPage('P', 'LETTER');
        $tcpdf->SetAuthor('Implesoft Elecciones');
        $tcpdf->SetCreator('Sistema elecciones');
        $tcpdf->SetSubject('Impresión del token');
        $tcpdf->SetKeywords('Sistema, Delegados, IMPLESOFT');
        $tcpdf->SetTitle('Impresión del token');
        $tcpdf->SetFont('helvetica','B',46);
        $i = 0;
        foreach ($tokens as $token) {
          $i ++;
          $tcpdf->Cell(42,30, $token->toketoken,1,0,'C');
          $tcpdf->Cell(5,30,'',0,0,'');
          if($i == 4){
            $tcpdf->Ln(36);
            $i = 0;
          }
        }

        if(count($tokens) < 1){
            $tcpdf->SetFont('helvetica','B',30);
            $tcpdf->Cell(180,4,'No existen token creados',0,0,'C');
        } 

        $tituloPdf = "Token.pdf";
        if($metodo === 'S'){
            return base64_encode($tcpdf->output($tituloPdf, 'S'));
        }else{
            $tcpdf->output($tituloPdf, 'I');
        }
    }

    public static function listaAspiranteTipoOrganos($data, $empresa, $metodo = 'I')
    {
        $nombreTpOrgano = $data['nombreTpOrgano'];
        $participantes  = $data['participantes'];
        $titulo         = $data['titulo'];

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

        $tcpdf->SetAuthor($nombreEmpresa.' '.$siglaEmpresa);
        $tcpdf->SetCreator('Sistema elecciones de '.$siglaEmpresa);
        $tcpdf->SetSubject('Lista aspirante al tipo de órgano '.$titulo);
        $tcpdf->SetKeywords('Sistema, Delegados, '.$siglaEmpresa.', IMPLESOFT ');
        $tcpdf->SetTitle('Lista aspirante al tipo de órgano '.$titulo);
 
        $tcpdf->AddPage('P', 'LETTER');
        $tcpdf->SetFont('helvetica','B',12);
        $tcpdf->MultiCell(170,4,$titulo,0,'L',0);
        $tcpdf->SetFont('helvetica','B',12);
        $tcpdf->Ln(8);   
        $tcpdf->Cell(40,6,' DOCUMENTO',1,0,'L');
        $tcpdf->Cell(115,6,' NOMBRES Y APELLIDOS ',1,0,'L');
        $tcpdf->Cell(20,6,'ORDEN',1,0,'C');
        $tcpdf->Ln(6);
        $tcpdf->SetFont('helvetica','',9);
        foreach ($participantes as $aspirante) {
            $tcpdf->Cell(40,6,' '.number_format($aspirante->deledocumento, 0, '.', '.'),"LBR",0,'L'); 
            $tcpdf->Cell(115,6,' '.$aspirante->nombreCompleto,"LBR",0,'L'); 
            $tcpdf->Cell(20,6,$aspirante->orelpaordenparticipacion,"LBR",0,'C');
            $tcpdf->Ln(6);
        }

        //Descargo o muestro el pdf
		$tituloPdf = 'Lista_aspirante_organos.pdf';
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

    public static function actaApertura($data, $empresa, $metodo = 'I')
    {
        $titulo     = $data['tipoEleccion'];
        $fechanicio = $data['fechanicio'];
        $contenido  = $data['contenido'];
        $tituloPdf  = $data['tituloPdf'];
        $jurados    = $data['jurados'];

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

        $tcpdf->SetAuthor($nombreEmpresa.' '.$siglaEmpresa);
        $tcpdf->SetCreator('Sistema elecciones de '.$siglaEmpresa);
        $tcpdf->SetSubject('ACTA DE APERTURA DE '.$titulo);
        $tcpdf->SetKeywords('Sistema, Delegados, '.$siglaEmpresa.', IMPLESOFT ');
        $tcpdf->SetTitle('ACTA DE APERTURA DE '.$titulo);
 
        $tcpdf->AddPage('P', 'LETTER');
        $tcpdf->SetFont('helvetica','B',12);
        $tcpdf->Ln(4);
        $tcpdf->Cell(170,5,'ACTA APERTURA ELECCIONES',0,0,'C');
        $tcpdf->Ln(6); 
        $tcpdf->Cell(170,5,'Fecha '.$fechanicio, 0,0,'C');
        $tcpdf->Ln(16); 
        $tcpdf->SetFont('helvetica','',12);
        $tcpdf->MultiCell(0,4,$contenido."\n",0,'J',0);
        $tcpdf->Ln(8); 
        $tcpdf->Cell(170,5,'Material entregado:',0,0,'L');
        $tcpdf->Ln(12); 
        $tcpdf->Cell(170,5,'   * Computadores.',0,0,'L');
        $tcpdf->Ln(6); 
        $tcpdf->Cell(170,5,'   * Listado delegados hábiles.',0,0,'L');
        $tcpdf->Ln(6); 
        $tcpdf->Cell(170,5,'   * Planilla registro de sufragantes.',0,0,'L');
        $tcpdf->Ln(6); 
        $tcpdf->Cell(170,5,'   * Reglamento para elecciones de delegados.',0,0,'L');
        $tcpdf->Ln(18);
        $tcpdf->Cell(170,5,' Para constancia firman',0,0,'L');
        $tcpdf->Ln(26);
        $tcpdf->SetFont('helvetica','B',12);
        $i = 0;
        foreach ($jurados as $jurado) {
            $i ++;
            $html = '<b>'.$jurado->nombreCompleto.'<br>CC No. '.number_format($jurado->documento, 0, '.', '.');
            $html .= ' <br>'.$jurado->tipoPersona.'</b><br>';
            if($i == 1){
                $tcpdf->writeHTMLCell(80, 0, 20, '', $html, "T", 0, 0, true, 'J');
            }else{
                $tcpdf->writeHTMLCell(80, 0, 110, '', $html, "T", 0, 0, true, 'J');
                $tcpdf->Ln(36);
                $i = 0;
            }  
        }

        //Descargo o muestro el pdf
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

    public static function listaResultado($data, $empresa, $metodo = 'I')
    {
        $totalVotosBlanco = $data['totalVotosBlanco'];
        $totalPrincipal   = $data['totalPrincipal'];
        $totalSuplente    = $data['totalSuplente'];
        $participantes    = $data['participantes'];
        $titulo           = $data['tipoEleccion'];
        $tituloPdf        = $data['tituloPdf'];

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

        $tcpdf->SetAuthor($nombreEmpresa.' '.$siglaEmpresa);
        $tcpdf->SetCreator('Sistema elecciones de '.$siglaEmpresa);
        $tcpdf->SetSubject('INFORME DE RESULTADOS DE '.$titulo);
        $tcpdf->SetKeywords('Sistema, Delegados, '.$siglaEmpresa.', IMPLESOFT ');
        $tcpdf->SetTitle('INFORME DE RESULTADOS DE LA VOTACIÓN DEL '.$titulo);
 
        $tcpdf->AddPage('P', 'LETTER');
        $tcpdf->SetFont('helvetica','B',12);
        $tcpdf->Ln(4);
        $tcpdf->SetTextColor(102,102,102);
        $tcpdf->MultiCell(0,4,'INFORME DE RESULTADOS DE LA VOTACIÓN DEL '.$titulo.''."\n",0,'C',0);
        $tcpdf->SetTextColor(0);
        $tcpdf->Ln(12);
        $tcpdf->SetFont('helvetica','B',10);
        $tcpdf->SetFillColor(231,231,231);
        $tcpdf->Cell(15,5,'Ítem',1,0,'C',true);
    	$tcpdf->Cell(30,5,' Documento',1,0,'C',true);
    	$tcpdf->Cell(100,5,' Nombre y Apellidos',1,0,'C',true); 
    	$tcpdf->Cell(15,5,'Votos',1,0,'C',true);
        $tcpdf->Cell(20,5,'Tipo',1,0,'C',true);
    	$tcpdf->Ln(5);
		$tcpdf->SetFont('helvetica','',10);

		$i = 0;	
    	foreach ($participantes as $participante) {
			$i ++;

    		if($i <= $totalPrincipal){
    			$tipo = 'Principal';
    		}else if($i > $totalPrincipal and $i <= ($totalPrincipal + $totalSuplente)){
    			$tipo = 'Suplente';
    		}else{
    			$tipo = '';
    		}

            if($participante->totalVotos == '0'){
                $tipo = '';
            }

    		$tcpdf->Cell(15,5, $i, "LBR", 0, 'C');
	    	$tcpdf->Cell(30,5,' '.number_format($participante->documento, 0, '.', '.'), "LBR" ,0, 'L');
	    	$tcpdf->Cell(100,5,' '.substr($participante->nombreCompleto,  0, 45), "LBR", 0, 'L');
	    	$tcpdf->Cell(15,5,$participante->totalVotos, "LBR" ,0, 'C');
            $tcpdf->Cell(20,5,$tipo, "LBR", 0, 'C');
	    	$tcpdf->Ln(5);
    	}

		$tcpdf->Ln(5); 
		$tcpdf->SetFont('helvetica','B',10);
		$tcpdf->Cell(45,5,'Votos en blanco:',0,0,'C',true);
		$tcpdf->Cell(30,5,$totalVotosBlanco,0,0,'C');

        //Descargo o muestro el pdf
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

    public static function actaEscrutinio($data, $empresa, $metodo = 'I')
    {
        $totalDelegadosHabiles = $data['totalDelegadosHabiles'];
        $totalVotosNoMarcados  = $data['totalVotosNoMarcados'];
        $totalVotosMarcados    = $data['totalVotosMarcados'];
        $totalVotosBlancos     = $data['totalVotosBlancos'];
        $fechaEleccion         = $data['fechaEleccion'];
        $titulo                = $data['tipoEleccion'];
        $totalVotos            = $data['totalVotos'];
        $contenido             = $data['contenido'];
        $tituloPdf             = $data['tituloPdf'];
        $jurados               = $data['jurados'];

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

        $tcpdf->SetAuthor($nombreEmpresa.' '.$siglaEmpresa);
        $tcpdf->SetCreator('Sistema elecciones de '.$siglaEmpresa);
        $tcpdf->SetSubject('ACTA RESULTADOS DE ESCRUTINIO '.$titulo);
        $tcpdf->SetKeywords('Sistema, Delegados, '.$siglaEmpresa.', IMPLESOFT ');
        $tcpdf->SetTitle('ACTA RESULTADOS DE ESCRUTINIO '.$titulo);
 
        $tcpdf->AddPage('P', 'LETTER');
        $tcpdf->SetFont('helvetica','B',12);
        $tcpdf->Ln(4);
        $tcpdf->Cell(170,5,'ACTA RESULTADOS DE ESCRUTINIO',0,0,'C');
        $tcpdf->Cell(170,5,'ELECCIONES '.$fechaEleccion,0,0,'C');
        $tcpdf->Ln(16); 
        $tcpdf->SetFont('helvetica','',12);
        $tcpdf->MultiCell(0,4,$contenido."\n",0,'J',0);
        $tcpdf->Ln(8); 
        $tcpdf->Cell(170,5,'El proceso de elección dio el siguiente resultado :',0,0,'L');
        $tcpdf->Ln(12); 
        $tcpdf->SetFont('helvetica','B',12);
        $tcpdf->Cell(50,5,'Delegados Hábiles:',0,0,'L');
        $tcpdf->Cell(50,5,$totalDelegadosHabiles,0,0,'L');
        $tcpdf->Ln(6); 
        $tcpdf->Cell(50,5,'Votos Marcados:',0,0,'L');
        $tcpdf->Cell(50,5,$totalVotosMarcados,0,0,'L');
        $tcpdf->Ln(6); 
        $tcpdf->Cell(50,5,'Votos no Marcados:',0,0,'L');
        $tcpdf->Cell(50,5,$totalVotosNoMarcados,0,0,'L');
        $tcpdf->Ln(6); 
        $tcpdf->Cell(50,5,'Votos en Blancos:',0,0,'L');
        $tcpdf->Cell(50,5,$totalVotosBlancos,0,0,'L');
        $tcpdf->Ln(6); 
        $tcpdf->Cell(50,5,'Total Votos:',0,0,'L');
        $tcpdf->Cell(50,5, $totalVotos,0,0,'L');
        $tcpdf->Ln(18);
        $tcpdf->SetFont('helvetica','',12);
        $tcpdf->Cell(170,5,' Para constancia firman',0,0,'L');
        $tcpdf->Ln(28);

        $i = 0;
        foreach ($jurados as $jurado) {
            $i ++;
            $html = '<b>'.$jurado->nombreCompleto.'<br>CC No. '.number_format($jurado->documento, 0, '.', '.');
            $html .= ' <br>'.$jurado->tipo.'</b><br>';
            if($i == 1){
                $tcpdf->writeHTMLCell(80, 0, 20, '', $html, "T", 0, 0, true, 'J');
            }else{
                $tcpdf->writeHTMLCell(80, 0, 110, '', $html, "T", 0, 0, true, 'J');
                $tcpdf->Ln(36);
                $i = 0;
            }  
        } 

        //Descargo o muestro el pdf
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

    public static function actaResultado($data, $empresa, $metodo = 'I')
    {
        $totalPrincipal = $data['totalPrincipal'];
        $tituloEleccion = $data['tituloEleccion'];
        $totalSuplente  = $data['totalSuplente'];
        $fechaEleccion  = $data['fechaEleccion'];
        $participantes  = $data['participantes'];
        $titulo         = $data['tipoEleccion'];
        $contenido      = $data['contenido'];
        $tituloPdf      = $data['tituloPdf'];
        $periodo        = $data['periodo'];
        $jurados        = $data['jurados'];

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

        $tcpdf->SetAuthor($nombreEmpresa.' '.$siglaEmpresa);
        $tcpdf->SetCreator('Sistema elecciones de '.$siglaEmpresa);
        $tcpdf->SetSubject('ACTA RESULTADOS DE '.$titulo);
        $tcpdf->SetKeywords('Sistema, Delegados, '.$siglaEmpresa.', IMPLESOFT ');
        $tcpdf->SetTitle('ACTA RESULTADOS DE '.$titulo);
 
        $tcpdf->AddPage('P', 'LETTER');
        $tcpdf->SetFont('helvetica','B',12);
        $tcpdf->Ln(4); 
        $tcpdf->Cell(170,5,$nombreEmpresa,0,0,'C');
        $tcpdf->Ln(5);
        $tcpdf->Cell(170,5,$siglaEmpresa,0,0,'C');
        $tcpdf->Ln(5);
        $tcpdf->Cell(170,5,$nitEmpresa,0,0,'C');
        $tcpdf->Ln(8);
        $tcpdf->MultiCell(170,4,'RESULTADOS DE ELECCIONES MIEMBROS '.$titulo,0,'C',0);
        $tcpdf->Cell(170,5,mb_strtoupper($tituloEleccion,'UTF-8'),0,0,'C');
        $tcpdf->Ln(5);
        $tcpdf->Cell(170,5,mb_strtoupper($fechaEleccion,'UTF-8'),0,0,'C');
        $tcpdf->Ln(12); 
        $tcpdf->SetFont('helvetica','',12);
        $tcpdf->MultiCell(0,4,$contenido."\n",0,'J',0);
        $tcpdf->Ln(8);
        $tcpdf->SetFont('helvetica','B',9);
        $tcpdf->Cell(178,6,'MIEMBROS DE '.$titulo.' PARA EL PERÍODO '.$periodo,1,0,'C');
        $tcpdf->Ln(6); 
        $tcpdf->Cell(76,6,' NOMBRES Y APELLIDOS',"LBR",0,'L');
        $tcpdf->Cell(32,6,' IDENTIFICACIÓN ',"LBR",0,'L');
        $tcpdf->Cell(50,6,' FECHA EXPEDICIÓN CÉDULA',"LBR",0,'L');
        $tcpdf->Cell(20,6,' CARGO',"LBR",0,'L');
        $tcpdf->Ln(6);
        $tcpdf->SetFont('helvetica','',9); 

        $i = 0;
        foreach ($participantes as $participante) {
            $i ++;

            if($i <= $totalPrincipal){
                $tipo = 'Principal';
            }else if($i > $totalPrincipal and $i <= ($totalPrincipal + $totalSuplente)){
                $tipo = 'Suplente';
            }else{
                $tipo = '';
            }

            if($participante->totalVotos == '0'){
                $tipo = '';
            }

            $tcpdf->Cell(76,6,' '.substr($participante->nombreCompleto,  0, 34),"LBR",0,'L');
            $tcpdf->Cell(32,6,' '.number_format($participante->documento, 0, '.', '.'),"LBR",0,'L');
            $tcpdf->Cell(50,6,' '.$participante->fechaExpedicion,"LBR",0,'L');
            $tcpdf->Cell(20,6,' '.$tipo,"LBR",0,'L');
            $tcpdf->Ln(6);
        }
       
        $tcpdf->Ln(12);
        $tcpdf->SetFont('helvetica','',12);
        $tcpdf->Cell(170,5,' Para constancia firman',0,0,'L');
        $tcpdf->Ln(20);

        $i = 0;
        foreach ($jurados as $jurado) {
            $i ++;
            $html = '<b>'.$jurado->nombreCompleto.'<br>CC No. '.number_format($jurado->documento, 0, '.', '.');
            $html .= ' <br>'.$jurado->tipo.'</b><br>';
            if($i == 1){
                $tcpdf->writeHTMLCell(80, 0, 20, '', $html, "T", 0, 0, true, 'J');
            }else{
                $tcpdf->writeHTMLCell(80, 0, 110, '', $html, "T", 0, 0, true, 'J');
                $tcpdf->Ln(36);
                $i = 0;
            }
        }

        //Descargo o muestro el pdf
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