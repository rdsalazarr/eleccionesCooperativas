<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script>
            (function () {
                const theme = localStorage.getItem('theme') || 'light';
                document.documentElement.setAttribute('data-theme', theme);
            })();
        </script>
        <meta name="description" content="Sistema de elecciones, Implesoft, desarrollo de software" />
        <meta name="keywords" content="Sistema de elecciones, cooperativas"/>
        <meta name="author" content="Implesoft - Ramón David Salazar Rincón">
        <meta name="robots" content="index, follow">
        <meta name="theme-color" content="#003A78" />
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>{{ isset($title) && $title ? $title : 'Sistema de Elecciones' }}</title> 
        <link rel="shortcut icon" href="{{asset('images/logo.png')}}" type="image/png"/>
    </head>

    <body>
        @viteReactRefresh
        <div id="app"></div>
        @yield('content')        
        <script src="{{asset('tinymce/tinymce.min.js')}}"></script>
        @yield('script')
    </body>
</html>