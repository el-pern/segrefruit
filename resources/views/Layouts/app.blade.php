<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <link rel="icon" type="image/x-icon" href="{{ asset('SEGRE_ICON.png') }}">
</head>
<body>

    <div id="app">

        <main class="py-4">
            @yield('content')
        </main>
    </div>
    
</body>
</html>