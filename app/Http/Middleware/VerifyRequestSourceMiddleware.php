<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class VerifyRequestSourceMiddleware
{
    public function handle(Request $request, Closure $next)
    {
        $referer = $request->headers->get('referer');

        if (!$referer || !str_contains($referer, $request->getSchemeAndHttpHost())) {
            return response()->view('errors.403', ['title' => 'Acceso no autorizado'], 403);
        }

        return $next($request);
    }
}