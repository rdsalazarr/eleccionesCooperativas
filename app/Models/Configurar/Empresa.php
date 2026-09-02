<?php

namespace App\Models\Configurar;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['emprnit','emprnombre','emprsigla','emprlema','emprdireccion','emprciudad',
            'emprcorreo','emprtelefonofijo','emprtelefonocelular','emprurl','emprlogo'])]
class Empresa extends Model
{
    protected $table      = 'empresa';
	protected $primaryKey = 'emprid';  
}