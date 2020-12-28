@extends('pages.main')

@section('title', ' | Dashboard')

@section('page')
	<li class="breadcrumb-item active">Dashboard</li>
@endsection

@section('header')
    <!-- begin page-header -->
    <h1 class="page-header">Dashboard</h1>
    <!-- end page-header -->
@endsection

@section('subcontent')
<div class="row">
    <div class="col-lg-6 col-xl-4 col-md-6 m-t-15">
        <div class="widget-todolist widget-todolist-rounded " data-id="widget">
            <!-- begin widget-todolist-header -->
            <div class="widget-todolist-header bg-warning">
                <div class="widget-todolist-header-left">
                    <h4 class="widget-todolist-header-title f-s-16">Barang Masuk Jatuh Tempo</h4>
                </div>
                <div class="widget-todolist-header-right">
                    <div class="widget-todolist-header-total"><span>{{ $barang_masuk->count() }}</span><small>Faktur</small></div>
                </div>
            </div>
            <div class="widget-todolist-body overflow-auto height-300">
                @foreach ($barang_masuk as $row)
                <div class="widget-todolist-item">
                    <div class="widget-todolist-content">
                        <h4 class="widget-todolist-title">{{ \Carbon\Carbon::parse($row->barang_masuk_tanggal)->isoFormat('LL') }}</h4>
                        <p class="widget-todolist-desc">{{ $row->barang_masuk_faktur." - ".($row->supplier? $row->supplier->supplier_nama:'') }}</p>
                    </div>
                    <div class="widget-todolist-icon">
                        <a href="#" class="btn-barang-masuk" data-id="{{ $row->barang_masuk_id }}" data-faktur="{{ $row->barang_masuk_faktur." - ".($row->supplier? $row->supplier->supplier_nama:'') }}"><span class="badge badge-warning">Detail</span> </a>
                    </div>
                </div>
                @endforeach
            </div>
            <!-- end widget-todolist-body -->
        </div>
    </div>
    <div class="col-lg-6 col-xl-4 col-md-6 m-t-15">
        <div class="widget-todolist widget-todolist-rounded " data-id="widget">
            <!-- begin widget-todolist-header -->
            <div class="widget-todolist-header bg-success">
                <div class="widget-todolist-header-left">
                    <h4 class="widget-todolist-header-title f-s-16">Penjualan Jatuh Tempo</h4>
                </div>
                <div class="widget-todolist-header-right">
                    <div class="widget-todolist-header-total"><span>{{ $penjualan->count() }}</span><small>Penjualan</small></div>
                </div>
            </div>
            <div class="widget-todolist-body overflow-auto height-300">
                @foreach ($penjualan as $row)
                <div class="widget-todolist-item">
                    <div class="widget-todolist-content">
                        <h4 class="widget-todolist-title">{{ \Carbon\Carbon::parse($row->penjualan_tanggal)->isoFormat('LL') }}</h4>
                        <p class="widget-todolist-desc">{{ $row->penjualan_id." - ".($row->pelanggan? $row->pelanggan->pelanggan_nama:'') }}</p>
                    </div>
                    <div class="widget-todolist-icon">
                        <a href="#" class="btn-penjualan" data-id="{{ $row->penjualan_id }}" data-faktur="{{ $row->penjualan_id ." - ".($row->pelanggan? $row->pelanggan->pelanggan_nama:'') }}"><span class="badge badge-warning">Detail</span> </a>
                    </div>
                </div>
                @endforeach
            </div>
            <!-- end widget-todolist-body -->
        </div>
    </div>
    <div class="col-lg-6 col-xl-4 col-md-6 m-t-15">
        <div class="widget-todolist widget-todolist-rounded " data-id="widget">
            <!-- begin widget-todolist-header -->
            <div class="widget-todolist-header bg-danger">
                <div class="widget-todolist-header-left">
                    <h4 class="widget-todolist-header-title f-s-16">Barang Kadaluarsa</h4>
                </div>
                <div class="widget-todolist-header-right">
                    <div class="widget-todolist-header-total"><span>{{ $barang_masuk->count() }}</span><small>Barang</small></div>
                </div>
            </div>
            <div class="widget-todolist-body overflow-auto height-300">
                @foreach ($kadaluarsa as $row)
                <div class="widget-todolist-item">
                    <div class="widget-todolist-content">
                        <h4 class="widget-todolist-title">{{ $row->barang_masuk_kadaluarsa }}</h4>
                        <p class="widget-todolist-desc">{{ $row->barang->barang_nama." (".$row->barang_masuk_qty." ".$row->barang->satuan_utama->satuan_nama.")" }}</p>
                    </div>
                    <div class="widget-todolist-icon">
                        <a href="javascript:;" class="btn btn-sm btn-danger btn-ok" data-nama="{{ $row->barang->barang_nama }}" data-tanggal="{{ $row->barang_masuk_kadaluarsa }}" data-barang="{{ $row->barang_id }}" data-id="{{ $row->barang_masuk_id }}"/>OK</a>
                    </div>
                </div>
                @endforeach
            </div>
            <!-- end widget-todolist-body -->
        </div>
    </div>
</div>
<div class="modal fade" id="modal-barang-masuk">
	<div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title"><label id="judul-faktur">Detail Faktur</label></h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div id="modal-detail"></div>
        </div>
	</div>
</div>
<div class="modal fade" id="modal-penjualan">
	<div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title"><label id="judul-faktur">Detail Nota</label></h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div id="modal-detail-penjualan"></div>
        </div>
	</div>
</div>
@endsection

@push('scripts')
<script>
    $(".btn-penjualan").on('click', function () {
        var faktur = $(this).data('faktur');
        $.ajax({
            url : "/dashboard/nota",
            type : "GET",
            async : false,
            data : {
                "id" : $(this).data('id'),
             },
            success: function(data){
                console.log(data);
                if(data){
                    $('#judul-faktur').text('Detail Nota ' + faktur);
                    $("#modal-detail-penjualan").empty();
                    $("#modal-detail-penjualan").append(data);
                    $('#modal-penjualan').modal('show');
                }else{
                    location.reload();
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                Swal.fire({
                    icon: 'error',
                    title: 'Tambah Barang',
                    text: xhr.responseJSON.message
                })
            }
        });
    });

    $(".btn-barang-masuk").on('click', function () {
        var faktur = $(this).data('faktur');
        $.ajax({
            url : "/dashboard/faktur",
            type : "GET",
            async : false,
            data : {
                "id" : $(this).data('id'),
             },
            success: function(data){
                if(data){
                    $('#judul-faktur').text('Detail Faktur ' + faktur);
                    $("#modal-detail").empty();
                    $("#modal-detail").append(data);
                    $('#modal-barang-masuk').modal('show');
                }else{
                    location.reload();
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                Swal.fire({
                    icon: 'error',
                    title: 'Tambah Barang',
                    text: xhr.responseJSON.message
                })
            }
        });
    });

    $(".btn-ok").on('click', function () {
        var id = $(this).data('id');
        var barang = $(this).data('barang');
        var nama = $(this).data('nama');
        var tanggal = $(this).data('tanggal');
        Swal.fire({
            title: 'Cek Stok',
            text: 'Barang ' + nama + ' kadaluarsa tanggal ' + tanggal + ' sudah dicek stok?',
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
                    url: "/dashboard/kadaluarsa",
                    type: "POST",
                    data: {
                        "id" : id,
                        "barang" : barang
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
</script>
@endpush
