@extends('pages.main')

@section('title', ' | Cek Stok')

@push('css')
	<link href="/assets/plugins/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet" />
	<link href="/assets/plugins/parsleyjs/src/parsley.css" rel="stylesheet" />
	<link href="/assets/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" />
@endpush

@section('page')
	<li class="breadcrumb-item active">Cek Stok</li>
@endsection

@section('header')
	<h1 class="page-header">Cek Stok</h1>
@endsection

@section('subcontent')
<div class="panel panel-inverse" data-sortable-id="form-stuff-1">
    <!-- begin panel-heading -->
    <div class="panel-body table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th>Nama Barang</th>
                    <th>Satuan</th>
                    <th>Harga</th>
                    <th>Qty</th>
                    <th>Diskon</th>
                    <th>Total</th>
                    <th class="width-10"></th>
                </tr>
            </thead>
            <tbody  id="barang">
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="7" class="text-center">
                        <a href="#" class="btn btn-sm btn-warning" onclick="event.preventDefault(); tambah_barang()" id="tambah-barang">Tambah Barang</a>
                    </td>
                </tr>
            </tfoot>
        </table>
    </div>

    <div class="panel-footer">
        @role('user|super-admin|supervisor')
        <input type="submit" value="Simpan" class="btn btn-sm btn-success m-r-3"  />
        @endrole
        <a href="/penjualanbebas/data" class="btn btn-sm btn-primary">Data Penjualan</a>
        <div class="pull-right">
            This page took {{ (microtime(true) - LARAVEL_START) }} seconds to render
        </div>
    </div>
</form>
</div>
@endsection

@push('scripts')
<script src="/assets/plugins/bootstrap-daterangepicker/moment.min.js"></script>
<script src="/assets/plugins/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<script>
    var i = 0;

    function tambah_barang(barang = null){
        $.ajax({
            url : "/cekstok/tambahbarang/" + i,
            type : "GET",
            data : { "barang" : barang },
            async : false,
            success: function(data){
                $("#barang").append(data);

                $('#barang' + i).selectpicker({
                    noneSelectedText : 'Nama Barang'
                });
            },
            error: function (xhr, ajaxOptions, thrownError) {
                Swal.fire({
                    icon: 'error',
                    title: 'Tambah Barang',
                    text: xhr.responseJSON.message
                })
            }
        });
        i++;
    }

    function hapus_barang(id) {
        $("#" + id).remove();
    }
</script>
@endpush
