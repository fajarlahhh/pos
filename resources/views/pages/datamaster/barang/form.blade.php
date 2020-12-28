@extends('pages.datamaster.main')

@section('title', ' | '.$aksi.' Barang')

@push('css')
	<link href="/assets/plugins/parsleyjs/src/parsley.css" rel="stylesheet" />
	<link href="/assets/plugins/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet" />
@endpush

@section('page')
    <li class="breadcrumb-item">Barang</li>
	<li class="breadcrumb-item active">{{ $aksi }} Data</li>
@endsection

@section('header')
    <h1 class="page-header">Barang <small>{{ $aksi }} Data</small></h1>
@endsection

@section('subcontent')
<div class="panel panel-inverse" data-sortable-id="form-stuff-1">
    <!-- begin panel-heading -->
    <div class="panel-heading ui-sortable-handle">
        <h4 class="panel-title">Form</h4>
        <div class="panel-heading-btn">
            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
        </div>
    </div>
    <form action="{{ route('barang.simpan') }}" method="post" data-parsley-validate="true" data-parsley-errors-messages-disabled="">
        @if ($aksi == 'Edit')
        <input type="hidden" name="id" value="{{ $data->barang_id }}">
        @endif
        @csrf
        <div class="panel-body">
            <div class="row width-full">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="control-label">Nama Barang</label>
                        <input class="form-control" type="text" name="barang_nama" value="{{ old('barang_nama', ($aksi == 'Edit'? $data->barang_nama: '')) }}" autocomplete="off" required/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Stok Minimal</label>
                        <input class="form-control" type="number" name="barang_stok_min" value="{{ old('barang_stok_min', ($aksi == 'Edit'? $data->barang_stok_min: '')) }}" autocomplete="off" required/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Jenis Barang</label>
                        <select class="form-control selectpicker" name="jenis_barang_id" id="jenis_barang_id" data-live-search="true" data-style="btn-primary" data-width="100%" >
                            @foreach($jenis_barang as $row)
                            @php
                                $selected = '';
                                if($aksi == 'Edit'){
                                    if ($data->jenis_barang_id == $row->jenis_barang_id) {
                                        $selected =  'selected';
                                    }
                                }else{
                                    if(old('jenis_barang_id') == $row->jenis_barang_id){
                                        $selected =  'selected';
                                    }
                                }
                            @endphp
                            <option value="{{ $row->jenis_barang_id }}" {{ $selected }}>{{ $row->jenis_barang_uraian }}</option>
                            @endforeach
                            @php
                                $selected = '';
                                if($aksi == 'Edit'){
                                    if ($data->jenis_barang_id == '') {
                                        $selected =  'selected';
                                    }
                                }else{
                                    if(old('jenis_barang_id') == ''){
                                        $selected =  'selected';
                                    }
                                }
                            @endphp
                            <option value="" {{ $selected }}>Tidak Ada</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Konsinyasi</label>
                        <select class="form-control selectpicker" name="supplier_id" id="supplier_id" data-live-search="true" data-style="btn-warning" data-width="100%" >
                            @foreach($supplier as $row)
                            @php
                                $selected = '';
                                if($aksi == 'Edit'){
                                    if ($data->supplier_id == $row->supplier_id) {
                                        $selected =  'selected';
                                    }
                                }else{
                                    if(old('supplier_id') == $row->supplier_id){
                                        $selected =  'selected';
                                    }
                                }
                            @endphp
                            <option value="{{ $row->supplier_id }}" {{ $selected }}>{{ $row->supplier_nama }} - {{ $row->supplier_alamat }}</option>
                            @endforeach
                            @php
                                $selected = '';
                                if($aksi == 'Edit'){
                                    if ($data->supplier_id == '') {
                                        $selected =  'selected';
                                    }
                                }else{
                                    if(old('supplier_id') == ''){
                                        $selected =  'selected';
                                    }
                                }
                            @endphp
                            <option value="" {{ $selected }}>Tidak Ada</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Satuan Utama</label>
                        <input class="form-control" type="text" name="satuan_nama" value="{{ old('satuan_nama', ($aksi == 'Edit' && $data->satuan_utama? $data->satuan_utama->satuan_nama: '')) }}" autocomplete="off" required/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Harga Jual</label>
                        <input class="form-control decimal text-right" type="text" name="satuan_harga" value="{{ old('satuan_harga', ($aksi == 'Edit' && $data->satuan_utama? $data->satuan_utama->satuan_harga: '')) }}" required autocomplete="off"/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Keterangan</label>
                        <input class="form-control" type="text" name="barang_keterangan" value="{{ old('barang_keterangan', ($aksi == 'Edit'? $data->barang_keterangan: '')) }}" autocomplete="off" />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="note bg-grey-transparent-5">
                        <div class="note-content table-responsive p-l-5 p-r-5">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Satuan</th>
                                        <th>Harga</th>
                                        <th>Rasio atas Satuan Utama</th>
                                        <th class="width-10"></th>
                                    </tr>
                                </thead>
                                <tbody id="satuan">
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="4" class="text-center">
                                            <a href="#" class="btn btn-sm btn-primary" onclick="event.preventDefault(); tambah_satuan()" id="tambah-satuan">Tambah Satuan</a>
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Wajib Input Stok</label>
                        <select class="form-control selectpicker" name="stok" id="stok" data-live-search="true" data-style="btn-warning" data-width="100%" >
                            <option value="0" {{ old('stok', ($aksi == 'Edit'? $data->stok: 0)) == 0? 'selected': '' }}>Tidak</option>
                            <option value="1" {{ old('stok', ($aksi == 'Edit'? $data->stok: 1)) == 1? 'selected': '' }}>Ya</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel-footer">
            @role('user|super-admin|supervisor')
            <input type="submit" value="Simpan" class="btn btn-sm btn-success m-r-3"  />
            @endrole
            <a href="{{ $back }}" class="btn btn-sm btn-danger">Batal</a>
            <div class="pull-right">
                This page took {{ (microtime(true) - LARAVEL_START) }} seconds to render
            </div>
        </div>
    </form>
</div>
@include('includes.component.error')
@endsection

@push('scripts')
<script src="/assets/plugins/parsleyjs/dist/parsley.js"></script>
<script src="/assets/plugins/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="/assets/plugins/autonumeric/autoNumeric.js"></script>
<script>
    var i = 0;

    var satuan_lain = @php
            echo json_encode(old('satuan', ($data? $data->satuan_lain: [])), JSON_NUMERIC_CHECK)
            @endphp || []

    satuan_lain.forEach(satuan => {
        tambah_satuan(satuan);
    });

    AutoNumeric.multiple('.decimal', {
        modifyValueOnWheel : false,
        minimumValue: "0"
    });

    $(".satuan").each(function(button){
        tambah_satuan($(this).data());
    });

    function tambah_satuan(satuan = null){
        $.ajax({
            url : "/barang/tambahsatuan/" + i,
            type : "GET",
            data : { "satuan" : satuan },
            async : false,
            success: function(data){
                $("#satuan").append(data);
                new AutoNumeric('#harga' + i++, {
                    modifyValueOnWheel : false,
                    minimumValue: "0"
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
    }

    function hapus_satuan(id) {
        $("#" + id).remove();
    }
</script>
@endpush
