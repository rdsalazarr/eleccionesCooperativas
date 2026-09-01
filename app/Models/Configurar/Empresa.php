<?php

namespace App\Models\Configurar;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['emprmunid','emprnit','emprnombre','emprsigla','emprlema','emprdireccion',
            'emprcorreo','emprtelefonofijo','emprhorarioatencion','emprurl','emprcodigopostal',
            'emprescudo','emprfavicon','emprtelefonocelular','emprrepresentantelegal','emprcargorepresentantelegal'])]
class Empresa extends Model
{
    protected $table      = 'empresa';
	protected $primaryKey = 'emprid';

    public static function consultar()
    {
		return DB::table('empresa as e')
					->select('e.*','d.depanombre', 
                        DB::raw("CONCAT('/images/logo_intitucion/',e.emprfavicon) as favicon"),
                        DB::raw("CONCAT('/images/logo_intitucion/',e.emprescudo) as escudo")   
                        )	
					->leftjoin('municipio as m', 'm.muniid', '=', 'e.emprmunid') 
                    ->leftjoin('departamento as d', 'd.depaid', '=', 'm.munidepaid')  
					->where('e.emprid', 1)->first();
    }
}