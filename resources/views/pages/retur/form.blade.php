@extends('pages.main')

@section('title', ' | Tambah Retur')

@push('css')
    <link href="/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker.css" rel="stylesheet" />
    <link href="/assets/plugins/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet" />
@endpush

@section('page')
    <li class="breadcrumb-item">Retur</li>
    <li class="breadcrumb-item active">Tambah Data</li>
@endsection

@section('header')
    <h1 class="page-header">Retur<small>Tambah Data</small></h1>
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
        <form action="{{ route('retur.simpan') }}" method="post" data-parsley-validate="true">
            @csrf
            <div class="panel-body">
                <div class="form-group">
                    <label class="control-label">Tanggal Retur</label>
                    <input type="text" readonly class="form-control datepicker" id="tanggal" name="tanggal"
                        value="{{ date('d M Y', strtotime(old('tanggal', now()))) }}" required />
                </div>
                <div class="form-group">
                    <label class="control-label">Pelanggan</label>
                    <select class="form-control selectpicker" name="pelanggan_id" id="pelanggan_id" data-live-search="true"
                        data-style="btn-warning" data-width="100%" >
                        <option value="" {{ old('pelanggan_id') == '' ? 'selected' : '' }}>-- Pilih Pelanggan --
                        </option>
                        @foreach ($pelanggan as $row)
                            <option value="{{ $row->pelanggan_id }}"
                                {{ old('pelanggan_id') && old('pelanggan_id') == $row->pelanggan_id ? 'selected' : '' }}>
                                {{ $row->nama }} -
                                {{ $row->alamat }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label class="control-label">Keterangan</label>
                    <textarea class="form-control" rows="3" name="keterangan" required>{{ old('keterangan') }}</textarea>
                </div>
                <div class="note bg-grey-transparent-5">
                    <div class="note-content table-responsive p-l-5 p-r-5">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Nama Barang</th>
                                    <th>Satuan</th>
                                    <th class="width-200">Harga</th>
                                    <th>Qty</th>
                                    <th class="width-200">Total</th>
                                    <th class="width-10"></th>
                                </tr>
                            </thead>
                            <tbody id="barang">
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="4" class="text-right">Sub Total : </th>
                                    <td colspan="1" class="with-btn">
                                        <input type="text" class="form-control text-right currency" id="sub-total-harga"
                                            name="sub_total" value="{{ old('sub_total', 0) }}" autocomplete="off"
                                            readonly />
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="6" class="text-center">
                                        <a href="javascript:;" class="btn btn-sm btn-primary"
                                            onclick="event.preventDefault(); tambah_barang()" id="tambah-barang">Tambah
                                            Barang</a>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
                <div class="form-inline">
                    <div class="switcher form-group">
                        <input type="checkbox" id="switcher_checkbox_1"
                            {{ $banyak == 'banyak' || old('banyak') == 1 ? 'checked' : '' }} value="1" name="banyak">
                        <label for="switcher_checkbox_1" class="control-label"></label>
                        &nbsp; &nbsp;Input Banyak
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
    <script src="/assets/plugins/autonumeric/autoNumeric.js"></script>
    <script src="/assets/plugins/parsleyjs/dist/parsley.js"></script>
    <script src="/assets/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
    <script src="/assets/plugins/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script>
        var i = 0;

        var barang = @php
            echo json_encode(array_values(old('barang', [])), JSON_NUMERIC_CHECK);
        @endphp || []

        barang.forEach(barang => {
            tambah_barang(barang);
        });

        $("#jatuh_tempo").on('change', function name() {
            $("#jatuh_tempo").prop('disabled', !$(this).is(':checked'));
        })

        AutoNumeric.multiple('.currency', {
            modifyValueOnWheel: false,
            minimumValue: "0"
        });

        init_hitungan();

        function satuan(id) {
            var satuan = $("#barang" + id + " option:selected").data('satuan');
            $("#barang" + id).closest('tr').find('#satuan' + id).val(satuan);
        }

        function init_hitungan() {
            $(".hitungan").on("keyup change", function() {
                var harga = parseFloat($(this).closest("tr").find(".harga").val().split(',').join('') || 0);
                var qty = parseFloat($(this).closest("tr").find(".qty").val().split(',').join('') || 0);

                $(this).closest("tr").find(".total-harga").val(((harga) * qty).toFixed(2).toString().replace(
                    /(\d)(?=(\d{3})+(?!\d))/g, "$1,"));

                sub_total();
            });

            $(".hapus-barang").on("click", function(e) {
                e.preventDefault();
                $(this).closest("tr").remove();
                sub_total();
            })
        }

        function sub_total() {
            var sub_total = 0;
            var sub_total_ppn = 0;
            $('.total-harga').each(function(i, obj) {
                var harga = parseFloat($(this).closest("tr").find(".harga").val().split(',').join('') || 0);
                var qty = parseFloat($(this).closest("tr").find(".qty").val().split(',').join('') || 0);

                sub_total += parseFloat(this.value.split(',').join('') || 0);
            });

            AutoNumeric.getAutoNumericElement('#sub-total-harga').set(sub_total);
        }

        $('.datepicker').datepicker({
            todayHighlight: true,
            format: 'dd M yyyy',
            autoclose: true
        });

        function tambah_barang(barang = null) {
            $.ajax({
                url: "/retur/tambahbarang/" + i,
                type: "GET",
                data: {
                    "barang": barang
                },
                async: false,
                success: function(data) {
                    $("#barang").append(data);

                    $('.selectpicker').selectpicker('refresh');

                    new AutoNumeric('.currency' + i++, {
                        modifyValueOnWheel: false,
                        minimumValue: "0"
                    });

                    $('.date').datepicker({
                        todayHighlight: true,
                        format: 'dd M yyyy',
                        autoclose: true
                    });
                    init_hitungan();
                },
                error: function(xhr, ajaxOptions, thrownError) {
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
