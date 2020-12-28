@extends('pages.datamaster.main')

@section('title', ' | Edit Biaya')

@push('css')
<link href="/assets/plugins/parsleyjs/src/parsley.css" rel="stylesheet" />
<link href="/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker.css" rel="stylesheet" />
<link href="/assets/plugins/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet" />
@endpush

@section('page')
    <li class="breadcrumb-item">Biaya</li>
	<li class="breadcrumb-item active">Edit Data</li>
@endsection

@section('header')
    <h1 class="page-header">Biaya<small>Edit Data</small></h1>
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
    <form action="{{ route('biaya.simpan') }}" method="post" data-parsley-validate="true" >
        @csrf
        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th class="width-20">No.</th>
                        <th>Nama Biaya</th>
                        <th>Nilai</th>
                        <th>Satuan</th>
                        <th>Biaya Per</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($data as $index => $row)
                    <tr>
                        <tr>
                            <td class="">
                                {{ ++$index }}
                            </td>
                            <td class="with-btn width-200">
                                <input class="form-control" type="text" name="biaya[{{ $index }}][biaya_nama]" value="{{ $row->biaya_nama }}" autocomplete="off" readonly/>
                            </td>
                            <td class="with-btn width-200">
                                <input class="form-control currency text-right" type="text" name="biaya[{{ $index }}][biaya_nilai]" value="{{ $row->biaya_nilai }}" autocomplete="off" />
                            </td>
                            <td class="with-btn width-200">
                                <input class="form-control" type="text" name="biaya[{{ $index }}][biaya_satuan]" value="{{ $row->biaya_satuan }}" autocomplete="off" readonly />
                            </td>
                            <td class="with-btn width-200">
                                <input class="form-control" type="text" name="biaya[{{ $index }}][biaya_per]" value="{{ $row->biaya_per }}" autocomplete="off" readonly />
                            </td>
                        </tr>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
        <div class="panel-footer">
            @role('super-admin|user')
            <input type="submit" value="Simpan" class="btn btn-sm btn-success m-r-3"  />
            @endrole
        </div>
    </form>
</div>
@include('includes.component.error')
@endsection

@push('scripts')
<script src="/assets/plugins/autonumeric/autoNumeric.js"></script>
<script src="/assets/plugins/parsleyjs/dist/parsley.js"></script>
<script src="/assets/plugins/autonumeric/autoNumeric.js"></script>
<script>
    AutoNumeric.multiple('.currency', {
        modifyValueOnWheel : false,
        minimumValue: "0"
    });
</script>
@endpush
