@extends('pages.main')

@section('title', ' | Tambah Barang Masuk')

@push('css')
<link href="/assets/plugins/parsleyjs/src/parsley.css" rel="stylesheet" />
<link href="/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker.css" rel="stylesheet" />
<link href="/assets/plugins/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet" />
@endpush

@section('page')
    <li class="breadcrumb-item">Barang Masuk</li>
	<li class="breadcrumb-item active">Tambah Data</li>
@endsection

@section('header')
    <h1 class="page-header">Barang Masuk<small>Tambah Data</small></h1>
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
    <form action="{{ route('barangmasuk.simpan') }}" method="post" data-parsley-validate="true" >
        @csrf
        <div class="panel-body">
            <div class="form-group">
                <label class="control-label">Tanggal Masuk</label>
                <input type="text" readonly class="form-control date" id="barang_masuk_tanggal" name="barang_masuk_tanggal" value="{{ date('d M Y', strtotime(old('barang_masuk_tanggal', now()))) }}" required/>
            </div>
            <div class="form-group">
                <label class="control-label">No. Faktur</label>
                <input class="form-control" type="text" name="barang_masuk_faktur" value="{{ old('barang_masuk_faktur') }}" autocomplete="off" required/>
            </div>
            <div class="form-group">
                <label class="control-label">Supplier</label>
                <select class="form-control selectpicker" name="supplier_id" id="supplier_id" data-live-search="true" data-style="btn-warning" data-width="100%" >
                    <option value="" {{ old('supplier_id') == ''? 'selected': '' }}>-- Pilih Supplier --</option>
                    @foreach($supplier as $row)
                    <option value="{{ $row->supplier_id }}" {{ old('supplier_id') == $row->supplier_id? 'selected': '' }}>{{ $row->supplier_nama }} - {{ $row->supplier_alamat }}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group">
                <label class="control-label">Tanggal Jatuh Tempo</label>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <div class="input-group-text">
                            <input type="checkbox" aria-label="Checkbox for following text input" id="jatuh_tempo" value="1">
                        </div>
                    </div>
                    <input type="text" readonly class="form-control datepicker" id="barang_masuk_jatuh_tempo" name="barang_masuk_jatuh_tempo" value="{{ date('d M Y', strtotime(old('barang_masuk_jatuh_tempo', now()))) }}" required disabled/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label">Nama Sales</label>
                <input class="form-control" type="text" name="barang_masuk_sales" value="{{ old('barang_masuk_sales') }}" autocomplete="off"/>
            </div>
            <div class="form-group">
                <label class="control-label">Keterangan</label>
                <textarea class="form-control" rows="3" name="barang_masuk_keterangan">{{ old('barang_masuk_keterangan') }}</textarea>
            </div>
            <div class="note bg-grey-transparent-5">
                <div class="note-content table-responsive p-l-5 p-r-5">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Nama Barang</th>
                                <th>Satuan</th>
                                <th>No. Batch</th>
                                <th>Harga</th>
                                <th>Diskon (%)</th>
                                <th>PPN (%)</th>
                                <th>Qty</th>
                                <th>Total</th>
                                <th>Tanggal Kadaluarsa</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody id="barang">
                        </tbody>
                        <tfoot>
                            <tr>
                                <th colspan="6" class="text-right">Sub Total : </th>
                                <td colspan="3" class="with-btn">
                                    <input type="text" class="form-control text-right currency" id="sub-total-harga" name="barang_masuk_sub_total" value="{{ old('barang_masuk_sub_total', 0) }}" autocomplete="off" readonly/>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <th colspan="6" class="text-right">Sub Total PPN : </th>
                                <td colspan="3" class="with-btn">
                                    <input type="text" class="form-control text-right currency" id="sub-total-ppn" name="barang_masuk_sub_total_ppn" value="{{ old('barang_masuk_sub_total_ppn', 0) }}" autocomplete="off" readonly/>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="8" class="text-center">
                                    <a href="javascript:;" class="btn btn-sm btn-primary" onclick="event.preventDefault(); tambah_barang()" id="tambah-barang">Tambah Barang</a>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
            <div class="form-inline">
                <div class="switcher form-group">
                    <input type="checkbox" id="switcher_checkbox_1" {{ $banyak == 'banyak' || old('banyak') == 1? 'checked': '' }} value="1" name="banyak">
                    <label for="switcher_checkbox_1" class="control-label"></label>
                    &nbsp; &nbsp;Input Banyak
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
<script src="/assets/plugins/autonumeric/autoNumeric.js"></script>
<script src="/assets/plugins/parsleyjs/dist/parsley.js"></script>
<script src="/assets/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
<script src="/assets/plugins/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script>
    var i = 0;

    var barang = @php
            echo json_encode(array_values(old('barang_masuk', [])), JSON_NUMERIC_CHECK)
            @endphp || []

    barang.forEach(barang => {
        tambah_barang(barang);
    });

    $("#jatuh_tempo").on('change', function name() {
        $("#barang_masuk_jatuh_tempo").prop('disabled', !$(this).is(':checked'));
    })

    AutoNumeric.multiple('.currency', {
                    modifyValueOnWheel : false,
                    minimumValue: "0"
                });

    init_hitungan();

    function satuan(id) {
        var satuan = $("#barang" + id + " option:selected").data('satuan');
        $("#barang" + id).closest('tr').find('.satuan').val(satuan);
    }

    function init_hitungan() {
        $(".hitungan").on("keyup change", function () {
            var harga = parseFloat($(this).closest("tr").find(".harga").val().split(',').join('') || 0);
            var diskon = parseFloat($(this).closest("tr").find(".diskon").val().split(',').join('') || 0);
            var ppn = parseFloat($(this).closest("tr").find(".ppn").val().split(',').join('') || 0);
            var qty = parseFloat($(this).closest("tr").find(".qty").val().split(',').join('') || 0);

            var harga_diskon = harga - (harga * diskon/100);
            var harga_ppn = harga_diskon * ppn/100;

            $(this).closest("tr").find(".total-harga").val(((harga_diskon + harga_ppn) * qty).toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));

            sub_total();
        });

        $(".hapus-barang").on("click", function (e) {
            e.preventDefault();
            $(this).closest("tr").remove();
            sub_total();
        })
    }

    function sub_total(){
        var sub_total = 0;
        var sub_total_ppn = 0;
        $('.total-harga').each(function(i, obj) {
            var harga = parseFloat($(this).closest("tr").find(".harga").val().split(',').join('') || 0);
            var diskon = parseFloat($(this).closest("tr").find(".diskon").val().split(',').join('') || 0);
            var ppn = parseFloat($(this).closest("tr").find(".ppn").val().split(',').join('') || 0);
            var qty = parseFloat($(this).closest("tr").find(".qty").val().split(',').join('') || 0);

            var harga_diskon = harga - (harga * diskon/100);
            var harga_ppn = harga_diskon * ppn/100;

            sub_total_ppn += harga_ppn * qty;
            sub_total += parseFloat(this.value.split(',').join('') || 0);
        });

        AutoNumeric.getAutoNumericElement('#sub-total-harga').set(sub_total);
        AutoNumeric.getAutoNumericElement('#sub-total-ppn').set(sub_total_ppn);
    }

    $('.datepicker').datepicker({
        todayHighlight: true,
        format: 'dd M yyyy',
        autoclose: true
    });

    function tambah_barang(barang = null){
        $.ajax({
            url : "/barangmasuk/tambahbarang/" + i,
            type : "GET",
            data : { "barang" : barang },
            async : false,
            success: function(data){
                $("#barang").append(data);

                $('.selectpicker').selectpicker('refresh');

                new AutoNumeric('.currency' + i++, {
                    modifyValueOnWheel : false,
                    minimumValue: "0"
                });

                $('.date').datepicker({
                    todayHighlight: true,
                    format: 'dd M yyyy',
                    autoclose: true
                });
                init_hitungan();
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
</script>
@endpush
