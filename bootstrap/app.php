<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

use App\Http\Middleware\RevalidateBackHistoryMiddleware;
use App\Http\Middleware\VerifyRequestSourceMiddleware;
use App\Http\Middleware\PreloadSecurityMiddleware;
use App\Http\Middleware\SecurityMiddleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        $middleware->alias([
            'revalidate'   => RevalidateBackHistoryMiddleware::class,
            'verifySource' => VerifyRequestSourceMiddleware::class,
            'preload'      => PreloadSecurityMiddleware::class,
            'security'     => SecurityMiddleware::class,
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions): void {
        //
    })->create();