@extends('pages.datamaster.main')

@section('title', ' | Barang')

@push('css')
	<link href="/assets/plugins/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet" />
	<link href="/assets/plugins/parsleyjs/src/parsley.css" rel="stylesheet" />
@endpush

@section('page')
	<li class="breadcrumb-item active">Barang</li>
@endsection

@section('header')
	<h1 class="page-header">Barang</h1>
@endsection

@section('subcontent')
<div class="panel panel-inverse" data-sortable-id="form-stuff-1">
    <!-- begin panel-heading -->
    <div class="panel-heading">
        <div class="row width-full">
            <div class="col-xl-3 col-sm-3">
                @role('user|super-admin|supervisor')
                <div class="form-inline">
                    <a href="{{ route('barang.tambah') }}" class="btn btn-primary"><i class="fa fa-plus"></i> Tambah</a>
                </div>
                @endrole
            </div>
            <div class="col-xl-9 col-sm-9">
                <form id="frm-cari" action="{{ route('barang') }}" method="GET">
                    <div class="form-inline pull-right">
                        <div class="form-group">
                            <select class="form-control selectpicker cari" name="jenis" data-live-search="true" data-style="btn-success" data-width="100%">
                                <option value="semua" {{ $jenis == 'semua'? 'selected': '' }}>Semua Jenis</option>
                                @foreach ($jenis_barang as $row)
                                <option value="{{ $row->jenis_barang_id }}" {{ $jenis == $row->jenis_barang_id? 'selected': '' }}>{{ $row->jenis_barang_uraian }}</option>
                                @endforeach
                            </select>
                        </div>&nbsp;
                        <div class="form-group">
                            <select class="form-control selectpicker cari" name="konsinyasi" data-live-search="true" data-style="btn-danger" data-width="100%">
                                <option value="semua" {{ $konsinyasi == 'semua'? 'selected': '' }}>Semua Konsinyasi</option>
                                @foreach ($supplier as $row)
                                <option value="{{ $row->supplier_id }}" {{ $konsinyasi == $row->supplier_id? 'selected': '' }}>{{ $row->nama }}</option>
                                @endforeach
                            </select>
                        </div>&nbsp;
                        <div class="form-group">
                            <select class="form-control selectpicker cari" name="tipe" data-live-search="true" data-style="btn-warning" data-width="100%">
                                <option value="0" {{ $tipe == '0'? 'selected': '' }}>Exist</option>
                                <option value="1" {{ $tipe == '1'? 'selected': '' }}>Deleted</option>
                                <option value="2" {{ $tipe == '2'? 'selected': '' }}>All</option>
                            </select>
                        </div>&nbsp;
                        <div class="input-group">
                            <input type="text" class="form-control cari" name="cari" placeholder="Cari" aria-label="Sizing example input" autocomplete="off" aria-describedby="basic-addon2" value="{{ $cari }}">
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
                    <th class="width-60">No.</th>
                    <th>Nama</th>
                    <th class="text-nowrap">Stok Minimal</th>
                    <th class="text-nowrap">Satuan</th>
                    <th class="text-nowrap">Harga Jual</th>
                    <th class="text-nowrap">Jenis Barang</th>
                    <th>Konsinyasi</th>
                    <th>Keterangan</th>
                    @role('super-admin|supervisor|user')
                    <th class="width-90"></th>
                    @endif
                </tr>
            </thead>
            <tbody>
                @foreach ($data as $index => $row)
                <tr>
                    <td class="align-middle">{{ ++$i }}</td>
                    <td class="align-middle">
                        <span data-toggle="tooltip" data-container="body" data-placement="right" data-html="true" data-placement="top" title="{!! $row->pengguna->nama.", <br><small>".$row->updated_at."</small>" !!}">{{ $row->nama }}</span>
                    </td>
                    <td class="align-middle text-center text-nowrap">{{ number_format($row->stok_min) }}</td>
                    <td class="align-middle">{{ $row->satuan_utama? $row->satuan_utama->nama: '' }}</td>
                    <td class="align-middle text-right text-nowrap">{{ number_format($row->satuan_utama? $row->satuan_utama->harga: 0, 2) }}</td>
                    <td class="align-middle">{{ $row->jenis_barang? $row->jenis_barang->jenis_barang_uraian: "" }}</td>
                    <td class="align-middle">{{ $row->supplier? $row->supplier->nama: "" }}</td>
                    <td class="align-middle">{{ $row->keterangan }}</td>
                    @role('super-admin|supervisor')
                    <td class="with-btn-group align-middle" nowrap>
                        <div class="btn-group">
                            @if ($row->trashed())
                            <a href="javascript:;" data-id="{{ $row->barang_id }}" data-no="{{ $i }}" class="btn btn-danger btn-sm btn-restore"> Restore</a>
                            @else
                            <a href="{{ route('barang.edit', array('id' => $row->barang_id)) }}" class="btn btn-aqua btn-sm"> Edit</a>
                            <a href="#" class="btn btn-white btn-sm dropdown-toggle width-30 no-caret" data-toggle="dropdown">
                            <span class="caret"></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a href="javascript:;" data-id="{{ $row->barang_id }}" data-no="{{ $i }}" class="btn-hapus dropdown-item" > Hapus</a>
                            </div>
                            @endif
                        </div>
                    </td>
                    @endrole
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
    @include('includes.component.pagination', [
        'pagination' => $data
    ])
</div>
@endsection

@push('scripts')
<script src="/assets/plugins/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script>
    $(".cari").change(function() {
         $("#frm-cari").submit();
    });

    $(".btn-restore").on('click', function () {
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
                    url: "/barang/restore",
                    type: "POST",
                    data: {
                        "_method": 'PATCH',
                        "id" : id
                    },
                    success: function(data){
                        location.reload(true);
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
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

    $(".btn-hapus").on('click', function () {
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
                    url: "/barang/hapus",
                    type: "POST",
                    data: {
                        "_method": 'DELETE',
                        "id" : id
                    },
                    success: function(data){
                        location.reload(true);
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
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
