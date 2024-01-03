@extends('pages.main')

@section('title', ' | Barang Masuk')

@push('css')
    <link href="/assets/plugins/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet" />
    <link href="/assets/plugins/parsleyjs/src/parsley.css" rel="stylesheet" />
    <link href="/assets/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" />
@endpush

@section('page')
    <li class="breadcrumb-item active">Barang Masuk</li>
@endsection

@section('header')
    <h1 class="page-header">Barang Masuk</h1>
@endsection

@section('subcontent')
    <div class="panel panel-inverse" data-sortable-id="form-stuff-1">
        <!-- begin panel-heading -->
        <div class="panel-heading">
            <div class="row width-full">
                <div class="col-xl-3 col-sm-3">
                    @role('user|super-admin|supervisor')
                        <div class="form-inline">
                            <a href="{{ route('barangmasuk.tambah') }}" class="btn btn-primary"><i class="fa fa-plus"></i>
                                Tambah</a>
                        </div>
                    @endrole
                </div>
                <div class="col-xl-9 col-sm-9">
                    <form id="frm-cari" action="{{ route('barangmasuk') }}" method="GET">
                        <div class="form-inline pull-right">
                            <div class="input-group" id="default-daterange">
                                <input type="text" name="tanggal" class="form-control" value="{{ $tgl }}"
                                    placeholder="Pilih Tanggal Izin" readonly />
                                <span class="input-group-append">
                                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                </span>
                            </div>&nbsp;
                            <div class="form-group">
                                <select class="form-control selectpicker cari" name="tipe" data-live-search="true"
                                    data-style="btn-warning" data-width="100%">
                                    <option value="0" {{ $tipe == '0' ? 'selected' : '' }}>Exist</option>
                                    <option value="1" {{ $tipe == '1' ? 'selected' : '' }}>Deleted</option>
                                    <option value="2" {{ $tipe == '2' ? 'selected' : '' }}>All</option>
                                </select>
                            </div>&nbsp;
                            <div class="input-group">
                                <input type="text" class="form-control cari" name="cari" placeholder="Cari"
                                    aria-label="Sizing example input" autocomplete="off" aria-describedby="basic-addon2"
                                    value="{{ $cari }}">
                                <div class="input-group-append">
                                    <span class="input-group-text" id="basic-addon2"><i class="fa fa-search"></i></span>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="panel-body table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th class="width-70">No.</th>
                        <th>Waktu</th>
                        <th>No. Faktur</th>
                        <th>Supplier</th>
                        <th>Jatuh Tempo</th>
                        <th>Keterangan</th>
                        <th>Barang</th>
                        @role('super-admin|supervisor|user')
                            <th class="width-90"></th>
                        @endrole
                    </tr>
                </thead>
                <tbody>
                    @foreach ($data as $index => $row)
                        <tr>
                            <td class="align-middle">{{ ++$i }}</td>
                            <td class="align-middle">
                                <span data-toggle="tooltip" data-container="body" data-placement="right" data-html="true"
                                    data-placement="top" title="{!! $row->pengguna->nama . ', <br><small>' . $row->updated_at . '</small>' !!}">{{ $row->updated_at }}</span>
                            </td>
                            <td class="text-nowrap align-middle">{{ $row->faktur }}</td>
                            <td class="text-nowrap align-middle">{{ $row->supplier ? $row->supplier->nama : '' }}</td>
                            <td class="text-nowrap align-middle">
                                {{ $row->jatuh_tempo ? date('d F Y', strtotime($row->jatuh_tempo)) : 'Lunas' }}</td>
                            <td class="align-middle">{{ $row->keterangan }}</td>
                            <td>
                                <table class="table table-bordered">
                                    <tr>
                                        <th>Nama Barang</th>
                                        <th>Harga</th>
                                        <th>Qty</th>
                                    </tr>
                                    @foreach ($row->detail as $det)
                                        <tr>
                                            <td class="text-nowrap">{{ $det->barang ? $det->barang->nama : '' }}</td>
                                            <td class="text-nowrap text-right">{{ number_format($det->harga, 2) }}
                                            </td>
                                            <td class="text-nowrap text-right">{{ number_format($det->qty) }}</td>
                                        </tr>
                                    @endforeach
                                </table>
                            </td>
                            @role('super-admin|supervisor|user')
                                <td class="with-btn-group align-middle" nowrap>
                                    @if ($row->trashed())
                                        @role('super-admin|supervisor')
                                            <a href="javascript:;" data-id="{{ $row->id }}" data-no="{{ $i }}"
                                                class="btn-restore btn-sm btn btn-success">
                                                Restore</a>
                                        @endrole
                                    @else
                                        <a href="javascript:;" data-id="{{ $row->id }}" data-no="{{ $i }}"
                                            class="btn-hapus btn-sm btn btn-danger"> Hapus</a>
                                    @endif
                                </td>
                            @endrole
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
        @include('includes.component.pagination', [
            'pagination' => $data,
        ])
    </div>
@endsection

@push('scripts')
    <script src="/assets/plugins/bootstrap-daterangepicker/moment.min.js"></script>
    <script src="/assets/plugins/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script src="/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
    <script>
        $(".cari").change(function() {
            $("#frm-cari").submit();
        });

        $('#default-daterange').daterangepicker({
            opens: 'right',
            format: 'DD MMMM YYYY',
            separator: ' s/d ',
            startDate: moment('{{ $tgl1 }}'),
            endDate: moment('{{ $tgl2 }}'),
            dateLimit: {
                days: 30
            },
        }, function(start, end) {
            $('#default-daterange input').val(start.format('DD MMMM YYYY') + ' - ' + end.format('DD MMMM YYYY'));
        });

        $('#default-daterange').on('apply.daterangepicker', function(ev, picker) {
            $("#frm-cari").submit();
        });


        $(".btn-restore").on('click', function() {
            var no = $(this).data('no');
            var id = $(this).data('id');
            Swal.fire({
                title: 'Restore Data',
                text: 'Anda akan mengembalikan data no ' + no,
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Ya',
                cancelButtonText: 'Tidak'
            }).then((result) => {
                if (result.value == true) {
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        }
                    });
                    $.ajax({
                        url: "/barangmasuk/restore",
                        type: "POST",
                        data: {
                            "_method": 'PATCH',
                            "id": id
                        },
                        success: function(data) {
                            location.reload(true);
                        },
                        error: function(xhr, ajaxOptions, thrownError) {
                            Swal.fire({
                                icon: 'error',
                                title: 'Restore data',
                                text: xhr.responseJSON.message
                            })
                        }
                    });
                }
            });
        });

        $(".btn-hapus").on('click', function() {
            var no = $(this).data('no');
            var id = $(this).data('id');
            Swal.fire({
                title: 'Hapus Data',
                text: 'Anda akan menghapus data no ' + no,
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Ya',
                cancelButtonText: 'Tidak'
            }).then((result) => {
                if (result.value == true) {
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        }
                    });
                    $.ajax({
                        url: "/barangmasuk/hapus",
                        type: "POST",
                        data: {
                            "_method": 'DELETE',
                            "id": id
                        },
                        success: function(data) {
                            location.reload(true);
                        },
                        error: function(xhr, ajaxOptions, thrownError) {
                            Swal.fire({
                                icon: 'error',
                                title: 'Hapus data',
                                text: xhr.responseJSON.message
                            })
                        }
                    });
                }
            });
        });
    </script>
@endpush
