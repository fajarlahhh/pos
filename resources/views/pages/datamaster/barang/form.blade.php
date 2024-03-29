@extends('pages.datamaster.main')

@section('title', ' | ' . $aksi . ' Barang')

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
                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i
                        class="fa fa-expand"></i></a>
            </div>
        </div>
        <form action="{{ route('barang.simpan') }}" method="post" data-parsley-validate="true"
            data-parsley-errors-messages-disabled="">
            @if ($aksi == 'Edit')
                <input type="hidden" name="id" value="{{ $data->id }}">
            @endif
            @csrf
            <div class="panel-body">
                <div class="row width-full">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label">Nama</label>
                            <input class="form-control" type="text" name="nama"
                                value="{{ old('nama', $aksi == 'Edit' ? $data->nama : '') }}" autocomplete="off" required />
                        </div>
                        <div class="form-group">
                            <label class="control-label">Stok Minimal</label>
                            <input class="form-control" type="number" name="stok_min"
                                value="{{ old('stok_min', $aksi == 'Edit' ? $data->stok_min : '') }}" autocomplete="off"
                                required />
                        </div>
                        <div class="form-group">
                            <label class="control-label">Jenis Barang</label>
                            <select class="form-control selectpicker" name="jenis_barang_id" id="jenis_barang_id"
                                data-live-search="true" data-style="btn-primary" data-width="100%">
                                <option value="" selected>Tidak Ada</option>
                                @foreach ($jenis_barang as $row)
                                    @php
                                        $selected = '';
                                        if ($aksi == 'Edit') {
                                            if ($data->jenis_barang_id == $row->id) {
                                                $selected = 'selected';
                                            }
                                        } else {
                                            if (old('jenis_barang_id') == $row->id) {
                                                $selected = 'selected';
                                            }
                                        }
                                    @endphp
                                    <option value="{{ $row->id }}" {{ $selected }}>{{ $row->nama }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        {{-- <div class="form-group">
                            <label class="control-label">Konsinyasi</label>
                            <select class="form-control selectpicker" name="supplier_id" id="supplier_id"
                                data-live-search="true" data-style="btn-warning" data-width="100%">
                                <option value="" selected>Tidak Ada</option>
                                @foreach ($supplier as $row)
                                    @php
                                        $selected = '';
                                        if ($aksi == 'Edit') {
                                            if ($data->supplier_id == $row->id) {
                                                $selected = 'selected';
                                            }
                                        } else {
                                            if (old('supplier_id') == $row->id) {
                                                $selected = 'selected';
                                            }
                                        }
                                    @endphp
                                    <option value="{{ $row->id }}" {{ $selected }}>{{ $row->nama }} -
                                        {{ $row->alamat }}</option>
                                @endforeach
                            </select>
                        </div> --}}
                        <div class="form-group">
                            <label class="control-label">Satuan </label>
                            <input class="form-control" type="text" name="satuan"
                                value="{{ old('nama', $aksi == 'Edit' && $data->satuan_utama ? $data->satuan_utama->nama : '') }}"
                                autocomplete="off" required />
                        </div>
                        <div class="form-group">
                            <label class="control-label">Harga Jual</label>
                            <input class="form-control decimal text-right" type="text" name="harga"
                                value="{{ old('harga', $aksi == 'Edit' && $data->satuan_utama ? $data->satuan_utama->harga : '') }}"
                                required autocomplete="off" />
                        </div>
                        <div class="form-group">
                            <label class="control-label">Keterangan</label>
                            <input class="form-control" type="text" name="keterangan"
                                value="{{ old('keterangan', $aksi == 'Edit' ? $data->keterangan : '') }}"
                                autocomplete="off" />
                        </div>
                        {{-- </div>
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
                                                <a href="#" class="btn btn-sm btn-primary"
                                                    onclick="event.preventDefault(); tambah_satuan()"
                                                    id="tambah-satuan">Tambah Satuan</a>
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div> --}}
                        <div class="form-group">
                            <label class="control-label">Wajib Input Stok</label>
                            <select class="form-control selectpicker" name="stok" id="stok" data-live-search="true"
                                data-style="btn-warning" data-width="100%">
                                <option value="0"
                                    {{ old('stok', $aksi == 'Edit' ? $data->stok : 0) == 0 ? 'selected' : '' }}>Tidak
                                </option>
                                <option value="1"
                                    {{ old('stok', $aksi == 'Edit' ? $data->stok : 1) == 1 ? 'selected' : '' }}>Ya</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                @role('user|super-admin|supervisor')
                    <input type="submit" value="Simpan" class="btn btn-sm btn-success m-r-3" />
                @endrole
                <a href="{{ $back }}" class="btn btn-sm btn-danger">Batal</a>
                <div class="pull-right">
                    This page took {{ microtime(true) - LARAVEL_START }} seconds to render
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

        AutoNumeric.multiple('.decimal', {
            modifyValueOnWheel: false,
            minimumValue: "0"
        });
    </script>
@endpush
