@extends('pages.datamaster.main')

@section('title', ' | '.$aksi.' Supplier')

@push('css')
	<link href="/assets/plugins/parsleyjs/src/parsley.css" rel="stylesheet" />
	<link href="/assets/plugins/switchery/switchery.min.css" rel="stylesheet" />
@endpush

@section('page')
    <li class="breadcrumb-item">Supplier</li>
	<li class="breadcrumb-item active">{{ $aksi }} Data</li>
@endsection

@section('header')
    <h1 class="page-header">Supplier <small>{{ $aksi }} Data</small></h1>
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
    <form action="{{ route('supplier.simpan') }}" method="post" data-parsley-validate="true" data-parsley-errors-messages-disabled="">
        @if ($aksi == 'Edit')
        <input type="hidden" name="id" value="{{ $data->supplier_id }}">
        @endif
        @csrf
        <div class="panel-body">
            <div class="form-group">
                <label class="control-label">Nama</label>
                <input class="form-control" type="text" name="nama" value="{{ old('nama')? old('nama'): ($aksi == 'Edit'? $data->nama: '') }}" autocomplete="off" required/>
            </div>
            <div class="form-group">
                <label class="control-label">Alamat</label>
                <input class="form-control" type="text" name="alamat" value="{{ old('alamat')? old('alamat'): ($aksi == 'Edit'? $data->alamat: '') }}" autocomplete="off" required/>
            </div>
            <div class="form-group">
                <label class="control-label">Kontak</label>
                <input class="form-control" type="text" name="kontak" value="{{ old('kontak')? old('kontak'): ($aksi == 'Edit'? $data->kontak: '') }}" autocomplete="off" required/>
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
<script src="/assets/plugins/switchery/switchery.min.js"></script>
<script src="/assets/plugins/parsleyjs/dist/parsley.js"></script>
<script>
    if ($('[data-render=switchery]').length !== 0) {
        $('[data-render=switchery]').each(function() {
            var themeColor = COLOR_GREEN;
            if ($(this).attr('data-theme')) {
                switch ($(this).attr('data-theme')) {
                    case 'red':
                        themeColor = COLOR_RED;
                        break;
                    case 'blue':
                        themeColor = COLOR_BLUE;
                        break;
                    case 'purple':
                        themeColor = COLOR_PURPLE;
                        break;
                    case 'orange':
                        themeColor = COLOR_ORANGE;
                        break;
                    case 'black':
                        themeColor = COLOR_BLACK;
                        break;
                }
            }
            var option = {};
            option.color = themeColor;
            option.secondaryColor = ($(this).attr('data-secondary-color')) ? $(this).attr('data-secondary-color') : '#dfdfdf';
            option.className = ($(this).attr('data-classname')) ? $(this).attr('data-classname') : 'switchery';
            option.disabled = ($(this).attr('data-disabled')) ? true : false;
            option.disabledOpacity = ($(this).attr('data-disabled-opacity')) ? parseFloat($(this).attr('data-disabled-opacity')) : 0.5;
            option.speed = ($(this).attr('data-speed')) ? $(this).attr('data-speed') : '0.5s';
            var switchery = new Switchery(this, option);
        });
    }
</script>
@endpush
