@extends('pages.datamaster.main')

@section('title', ' | '.$aksi.' Jenis Barang')

@push('css')
	<link href="/assets/plugins/parsleyjs/src/parsley.css" rel="stylesheet" />
@endpush

@section('page')
    <li class="breadcrumb-item">Jenis Barang</li>
	<li class="breadcrumb-item active">{{ $aksi }} Data</li>
@endsection

@section('header')
    <h1 class="page-header">Jenis Barang <small>{{ $aksi }} Data</small></h1>
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
    <form action="{{ route('jenisbarang.'.strtolower($aksi)) }}" method="post" data-parsley-validate="true" data-parsley-errors-messages-disabled="">
        @if ($aksi == 'Edit')
        <input type="hidden" name="id" value="{{ $data->jenis_barang_id }}">
        @method('PUT')
        @endif
        @csrf
        <div class="panel-body">
            <div class="form-group">
                <label class="control-label">Jenis Barang</label>
                <input class="form-control" type="text" name="jenis_barang_uraian" value="{{ old('jenis_barang_uraian')? old('jenis_barang_uraian'): ($aksi == 'Edit'? $data->jenis_barang_uraian: '') }}" autocomplete="off" required/>
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
@endpush
