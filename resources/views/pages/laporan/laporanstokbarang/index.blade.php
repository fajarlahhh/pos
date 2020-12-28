
@extends($cetak != 'cetak'? 'pages.laporan.main': 'pages.laporan.cetak')

@section('title', ' | Stok Barang')

@push('css')
<link href="/assets/plugins/parsleyjs/src/parsley.css" rel="stylesheet" />
<link href="/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker.css" rel="stylesheet" />
<link href="/assets/plugins/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet" />
@endpush

@section('page')
	<li class="breadcrumb-item active">Stok Barang</li>
@endsection

@section('header')
    <h1 class="page-header">Stok Barang</h1>
@endsection

@section('subcontent')
@if ($cetak != 'cetak')
<div class="panel panel-inverse" data-sortable-id="form-stuff-1">
    <!-- begin panel-heading -->
    <div class="panel-heading">
        <div class="row width-full">
            <div class="col-xl-3 col-sm-3">
                <div class="form-inline">
                    <a href="/laporanstokbarang/cetak?bulan={{ $bulan }}&tahun={{ $tahun }}" target="_blank" class="btn btn-warning"> Cetak</a>
                </div>
            </div>
            <div class="col-xl-9 col-sm-9">
                <form id="frm-cari" action="/laporanstokbarang" method="GET">
                    <div class="form-inline pull-right">
                        <div class="form-group">
                            <select class="form-control selectpicker cari" name="bulan" data-live-search="true" data-style="btn-info" data-width="100%">
                                @for($i=1; $i <= 12; $i++)
                                <option value="{{ $i }}" {{ $bulan == $i? 'selected': '' }}>{{ (DateTime::createFromFormat('!m', $i))->format('F') }}</option>
                                @endfor
                            </select>
                        </div>&nbsp;
                        <div class="form-group">
                            <select class="form-control selectpicker cari" name="tahun" data-live-search="true" data-style="btn-info" data-width="100%">
                                @for($i=2016; $i <= date('Y'); $i++)
                                <option value="{{ $i }}" {{ $tahun == $i? 'selected': ''}}>{{ $i }}</option>
                                @endfor
                            </select>
                        </div>&nbsp;
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="panel-body table-responsive">
@else
    <div class="text-center">
        <h3>APOTEK SEJAHTERA <br>
        <small>LAPORAN STOK PER {{ strtoupper(date('d M Y h:m:s')) }}</small></h3>
    </div>
    <br>
@endif
        <table class="table table-hover">
            <thead>
                <tr>
                    <th class="width-70">No.</th>
                    <th>Nama Barang</th>
                    <th>Jenis</th>
                    <th>Satuan</th>
                    <th>Stok Awal</th>
                    <th>Stok Masuk</th>
                    <th>Stok Keluar</th>
                    <th>Sisa</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($data as $index => $row)
                <tr>
                    <td>{{  ++$index }}</td>
                    <td>{{  $row->barang_nama }}</td>
                    <td>{{  $row->jenis_barang? $row->jenis_barang->jenis_barang_uraian: '' }}</td>
                    <td>{{  $row->satuan_utama? $row->satuan_utama->satuan_nama: '' }}</td>
                    <td>{{  number_format($row->stok_awal->count() > 0? $row->stok_awal->sum('barang_qty'): 0) }}</td>
                    <td>{{  number_format($row->barang_masuk->count() > 0? $row->barang_masuk->sum('masuk'): 0) }}</td>
                    <td>{{  number_format($row->penjualan->count() > 0? $row->penjualan->sum('keluar'): 0 )}}</td>
                    <td>{{  number_format(($row->stok_awal->count() > 0? $row->stok_awal->sum('barang_qty'): 0) + ($row->barang_masuk->count() > 0? $row->barang_masuk->sum('masuk'): 0) - ($row->penjualan->count() > 0? $row->penjualan->sum('keluar'): 0)) }}</td>
                </tr>
                @endforeach
            </tbody>
        </table>
@if ($cetak != 'cetak')
    </div>
</div>
@endif
@endsection

@push('scripts')
@if ($cetak == 'cetak')
    <script>

        window.print();
    </script>
@else
<script src="/assets/plugins/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script>
    $(".cari").change(function() {
         $("#frm-cari").submit();
    });
</script>
@endif
@endpush
