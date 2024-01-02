@extends('pages.main')

@section('title', ' | Tambah Penjualan')

@push('css')
    <link href="/assets/plugins/parsleyjs/src/parsley.css" rel="stylesheet" />
    <link href="/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker.css" rel="stylesheet" />
    <link href="/assets/plugins/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet" />
@endpush

@section('page')
    <li class="breadcrumb-item">Penjualan</li>
    <li class="breadcrumb-item active">Tambah Data</li>
@endsection

@section('header')
    <h1 class="page-header">Penjualan<small>Tambah Data</small></h1>
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
        <form action="{{ route('penjualan.simpan') }}" method="post" data-parsley-validate="true">
            @csrf
            <div class="panel-body">
                <div class="form-group">
                    <label class="control-label">Keterangan</label>
                    <textarea class="form-control" rows="3" name="keterangan">{{ old('keterangan') }}</textarea>
                </div>
                <div class="form-group">
                    <label class="control-label">Pelanggan</label>
                    <select class="form-control selectpicker" name="pelanggan_id" id="pelanggan_id" data-live-search="true"
                        data-style="btn-warning" data-width="100%">
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
                    <label class="control-label">Tanggal Jatuh Tempo</label>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <input type="checkbox" aria-label="Checkbox for following text input" id="jatuh_tempo"
                                    value="1">
                            </div>
                        </div>
                        <input type="text" readonly class="form-control datepicker" id="tanggal_jatuh_tempo"
                            name="tanggal_jatuh_tempo"
                            value="{{ date('d M Y', strtotime(old('tanggal_jatuh_tempo', now()))) }}" required disabled />
                    </div>
                </div>
                <div class="note bg-grey-transparent-5">
                    <div class="note-content table-responsive p-l-5 p-r-5">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Nama Barang</th>
                                    <th>Satuan</th>
                                    <th>Harga</th>
                                    <th>Qty</th>
                                    <th>Total</th>
                                    <th class="width-10"></th>
                                </tr>
                            </thead>
                            <tbody id="barang">
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="4" class="text-right">Sub Total : </td>
                                    <td class="with-btn">
                                        <input type="text" class="form-control text-right currency" id="sub-total"
                                            name="sub_total" value="0" autocomplete="off" readonly />
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="4" class="text-right">Diskon</td>
                                    <td class="with-btn">
                                        <input class="form-control text-right currency diskon" type="text" id="diskon"
                                            name="diskon" value="{{ old('diskon') }}" autocomplete="off" />
                                    </td>
                                    <td></td>

                                </tr>
                                <tr>
                                    <th colspan="4" class="text-right">Tagihan : </th>
                                    <th lass="with-btn">
                                        <input type="text" class="form-control text-right currency f-w-700"
                                            id="tagihan" name="tagihan" value="0" autocomplete="off" readonly />
                                    </th>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="7" class="text-center">
                                        <a href="#" class="btn btn-sm btn-warning"
                                            onclick="event.preventDefault(); tambah_barang()" id="tambah-barang">Tambah
                                            Barang</a>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
                @if (Session::has('stok_kurang'))
                    <div class="alert alert-danger">
                        @foreach (Session::get('stok_kurang') as $item)
                            {!! $item !!}
                        @endforeach
                    </div>
                @endif
                <div class="form-group">
                    <label class="control-label">Bayar</label>
                    <input class="form-control text-right currency" type="text" id="bayar" name="bayar"
                        value="{{ old('bayar') }}" autocomplete="off" required />
                </div>
                <div class="form-group">
                    <label class="control-label">Sisa</label>
                    <input class="form-control text-right currency bg-danger text-white" type="text" id="sisa"
                        name="sisa" value="{{ old('sisa', 0) }}" autocomplete="off" required readonly />
                </div>
            </div>

            <div class="panel-footer">
                @role('super-admin|user')
                    <input type="submit" id="submit" value="Simpan" class="btn btn-sm btn-success m-r-3" />
                @endrole
                <a href="/penjualan/data" class="btn btn-sm btn-primary">Data Penjualan</a>
                <div class="pull-right">
                    This page took {{ microtime(true) - LARAVEL_START }} seconds to render
                </div>
            </div>
        </form>
    </div>
    @include('includes.component.error')
    <div class="modal fade" id="modal-kwitansi">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Nota</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div id="modal-detail"></div>
            </div>
        </div>
    </div>

@endsection

@push('scripts')
    <script src="/assets/plugins/autonumeric/autoNumeric.js"></script>
    <script src="/assets/plugins/parsleyjs/dist/parsley.js"></script>
    <script src="/assets/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
    <script src="/assets/plugins/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    @if (Session::has('kwitansi'))
        <script>
            $("#modal-detail").load("{{ Session::get('kwitansi') }}");
            $('#modal-kwitansi').modal('show');
        </script>
    @endif
    <script>
        $(document).ready(function() {
            $(window).keydown(function(event) {
                if (event.keyCode == 13) {
                    event.preventDefault();
                    return false;
                }
            });
        });

        var i = 0;
        AutoNumeric.multiple('.currency', {
            modifyValueOnWheel: false,
            minimumValue: "0"
        });

        $("#jatuh_tempo").on('change', function name() {
            $("#tanggal_jatuh_tempo").prop('disabled', !$(this).is(':checked'));
        })

        $('.datepicker').datepicker({
            todayHighlight: true,
            format: 'dd M yyyy',
            autoclose: true
        });

        var barang = @php
            echo json_encode(old('barang') ? array_values(old('barang')) : [], JSON_NUMERIC_CHECK);
        @endphp;


        $("#bayar").on('keyup change', function() {
            bayar();
        });

        $("#diskon").on('keyup change', function() {
            hitung_diskon();
        });

        function bayar() {
            var bayar = parseFloat($("#bayar").val().split(',').join('') || 0);
            var tagihan = parseFloat($("#tagihan").val().split(',').join('') || 0);
            AutoNumeric.getAutoNumericElement('#sisa').set(bayar - tagihan > 0 ? bayar - tagihan : 0);

            if (tagihan > bayar) {
                $("#submit").hide();
            } else {
                $("#submit").show();
            }
        };

        function hitung_diskon() {
            var sub_total = parseFloat($("#sub-total").val().split(',').join('') || 0);
            var diskon = parseFloat($("#diskon").val() !== '' ? $("#diskon").val().split(',').join('') : 0);
            AutoNumeric.getAutoNumericElement('#tagihan').set(sub_total - diskon > 0 ? sub_total - diskon : 0);
            bayar();
        };

        function total_harga_barang(id) {
            var qty = $("#qty" + id).val() || 0;
            var harga = parseFloat($("#harga" + id).val() !== undefined ? $("#harga" + id).val().split(',').join('') : 0);

            AutoNumeric.getAutoNumericElement('#total' + id).set(harga * qty);
            sub_total();
            // hitung_diskon();
        }

        function sub_total() {
            var sub_total = 0;
            $('.total-harga-barang').each(function(i, obj) {
                if (this.value)
                    sub_total += parseFloat(this.value.split(',').join('') || 0);
            });
            AutoNumeric.getAutoNumericElement('#sub-total').set(sub_total);
            hitung_diskon();
            bayar();
        }

        function set_satuan_harga(id, slct = null) {
            $("#satuan" + id).val($("#barang" + id + " option:selected").data('satuan'));
            var harga = parseFloat($("#barang" + id + " option:selected").data('harga'));
            AutoNumeric.getAutoNumericElement(
                    '#harga' + id) !== null ? AutoNumeric.getAutoNumericElement('#harga' + id)
                .set(harga) : 0;
            total_harga_barang(id);
        }

        function tambah_barang(barang = null) {
            $.ajax({
                url: "/penjualan/tambahbarang/" + i,
                type: "GET",
                data: {
                    "barang": barang
                },
                async: false,
                success: function(data) {
                    $("#barang").append(data);

                    $('#barang' + i).selectpicker({
                        noneSelectedText: 'Nama Barang'
                    });

                    $('#satuan' + i).selectpicker({
                        noneSelectedText: 'Tidak Ada'
                    });

                    new AutoNumeric('#harga' + i, {
                        modifyValueOnWheel: false,
                        minimumValue: "0"
                    });

                    new AutoNumeric('#total' + i, {
                        modifyValueOnWheel: false,
                        minimumValue: "0"
                    });
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Tambah Barang',
                        text: xhr.responseJSON.message
                    })
                }
            });
            sub_total();
            i++;
        }

        function hapus_barang(id) {
            $("#" + id).remove();
            sub_total();
        }
    </script>
@endpush
