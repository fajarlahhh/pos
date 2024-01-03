@extends($cetak != 'cetak' ? 'pages.laporan.main' : 'pages.laporan.cetak')

@section('title', ' | Retur')

@push('css')
    <link href="/assets/plugins/parsleyjs/src/parsley.css" rel="stylesheet" />
    <link href="/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker.css" rel="stylesheet" />
    <link href="/assets/plugins/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet" />
@endpush

@section('page')
    <li class="breadcrumb-item active">Retur</li>
@endsection

@section('header')
    <h1 class="page-header">Retur</h1>
@endsection

@section('subcontent')
    @if ($cetak != 'cetak')
        <div class="panel panel-inverse" data-sortable-id="form-stuff-1">
            <!-- begin panel-heading -->
            <div class="panel-heading">
                <div class="row width-full">
                    <div class="col-xl-3 col-sm-3">
                        <div class="form-inline">
                            <a href="/laporanretur/cetak?bulan={{ $bulan }}&tahun={{ $tahun }}"
                                target="_blank" class="btn btn-warning"> Cetak</a>
                        </div>
                    </div>
                    <div class="col-xl-9 col-sm-9">
                        <form id="frm-cari" action="/laporanretur" method="GET">
                            <div class="form-inline pull-right">
                                <div class="form-group">
                                    <select class="form-control selectpicker cari" name="bulan" data-live-search="true"
                                        data-style="btn-info" data-width="100%">
                                        @for ($i = 1; $i <= 12; $i++)
                                            <option value="{{ $i }}" {{ $bulan == $i ? 'selected' : '' }}>
                                                {{ DateTime::createFromFormat('!m', $i)->format('F') }}</option>
                                        @endfor
                                    </select>
                                </div>&nbsp;
                                <div class="form-group">
                                    <select class="form-control selectpicker cari" name="tahun" data-live-search="true"
                                        data-style="btn-info" data-width="100%">
                                        @for ($i = 2016; $i <= date('Y'); $i++)
                                            <option value="{{ $i }}" {{ $tahun == $i ? 'selected' : '' }}>
                                                {{ $i }}</option>
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
                    <h3>{{ config('app.company') }} <br>
                        <small>{{ config('app.address') }}</small><br>
                        <small>LAPORAN RETUR PER {{ strtoupper(date('d M Y h:m:s')) }}</small>
                    </h3>
                </div>
                <br>
    @endif
    <table class="table table-hover">
        <thead>
            <tr>
                <th class="width-70">No.</th>
                <th>Tanggal</th>
                <th>Barang</th>
                <th>Satuan</th>
                <th>Harga Satuan</th>
                <th>Qty</th>
                <th>Sub Total</th>
                <th>Keterangan</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($data as $index => $row)
                <tr>
                    <td>{{ ++$index }}</td>
                    <td class="align-middle">{{ $row->tanggal }}</td>
                    <td class="text-nowrap align-middle">{{ $row->barang->nama }}</td>
                    <td class="text-nowrap align-middle">{{ $row->satuan }}</td>
                    <td class="text-nowrap align-middle text-right">{{ number_format($row->harga, 2) }}
                    <td class="text-nowrap align-middle">{{ $row->qty }}</td>
                    </td>
                    <td class="text-nowrap align-middle text-right">{{ number_format($row->harga * $row->qty, 2) }}
                    </td>
                    <td class="align-middle">{{ $row->keterangan }}</td>
                </tr>
            @endforeach
            <tr>
                <th colspan="6">TOTAL</th>
                <th class="text-nowrap text-right align-middle">
                    {{ number_format($data->sum(fn($q) => $q->harga * $q->qty), 2) }}</th>
                    <th></th>
            </tr>
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
