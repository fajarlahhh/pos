@if ($cetak == 1)
<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8" />
<title>{{ config("app.name") }} @yield('title')</title>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
<link rel="icon" href="/assets/img/logo/favicon.png" type="image/gif">
<meta content="{{ config("app.name")." ".env('APP_COMPANY') }}" name="description" />
<meta content="Andi Fajar Nugraha" name="author" />
<meta name="csrf-token" content="{{ csrf_token() }}" />

    <link href="/assets/css/default/app.min.css" rel="stylesheet" />
    <link href="/assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" />
    <link rel="stylesheet" href="/assets/dotmatri/dotmatri.ttf">
</head>
@php
	$bodyClass = (!empty($boxedLayout)) ? 'boxed-layout ' : '';
	$bodyClass .= (!empty($bodyExtraClass)) ? $bodyExtraClass . ' ' : '';
@endphp
<body style="background: white">
@endif
<div class="modal-body" style="font-family: Arial, sans-serif !important; font-size: 22px">
    <div class="text-center">
        <h2>UD LOMBOK FROZEN<br>
            <small>Jl. Barcelona V 214 Graha Royal Gunung Sari<br>
            Telp. 085337755533</small></h2>
    </div>
    <br>
    <br>
    <div class="table-responsive">
        ID : {{ $data->penjualan_id }}
        <div class="float-right">Tgl. Nota : {{ $data->tanggal }}</div>
        <table class="table">
            <tr>
                <th class="width-70 p-0">No.</th>
                <th class="p-0">Barang</th>
                <th class="width-70 p-0">Qty</th>
                <th class="width-150 p-0">Harga</th>
            </tr>
            @foreach ($data->detail as $index => $row)
            <tr>
                <td class="p-0">
                    {{ ++$index }}
                </td>
                <td class="p-0">
                    {{ $row->barang->nama }}
                </td>
                <td class="p-0">
                    {{ number_format($row->qty) }}
                </td>
                <td class="text-right p-0">
                    {{ number_format($row->total, 2) }}
                </td>
            </tr>
            @endforeach
            <tr>
                <th colspan="3" class="text-right p-0">Total :</th>
                <td class="text-right p-0" >
                    {{ number_format($data->detail->sum('total'), 2) }}
                </th>
            </tr>
        </table>
    </div>
</div>
@if ($cetak == 1)
        <script>
            window.print();
        </script>
    </body>
</html>
@endif
@if ($cetak == 0)
<div class="modal-footer">
    <a href="javascript:;" class="btn btn-white" data-dismiss="modal">Tutup</a>
    <a href="/penjualan/kwitansi/1/{{ $data->penjualan_id }}" class="btn btn-success" target="_blank"><i class="fas fa-print"></i> Cetak</a>
</div>
@endif
