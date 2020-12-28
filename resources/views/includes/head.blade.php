<meta charset="utf-8" />
<title>{{ config("app.name") }} @yield('title')</title>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
<link rel="icon" href="/assets/img/logo/favicon.png" type="image/gif">
<meta content="{{ config("app.name")." ".env('APP_COMPANY') }}" name="description" />
<meta content="Andi Fajar Nugraha" name="author" />
<meta name="csrf-token" content="{{ csrf_token() }}" />

<!-- ================== BEGIN BASE CSS STYLE ================== -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
<link href="/assets/css/default/app.min.css" rel="stylesheet" />
<link href="/assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" />
<!-- ================== END BASE CSS STYLE ================== -->

@stack('css')
