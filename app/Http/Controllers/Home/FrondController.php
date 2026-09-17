<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class FrondController extends Controller
{
    public function index()
	{
        return view('page.home');
    }

    public function admin() 
	{
        return view('page.admin');
    }
}