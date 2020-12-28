@extends('pages.main')

@section('title', ' | Posting Stok Akhir')

@push('css')
<link href="/assets/plugins/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet" />
@endpush

@section('page')
	<li class="breadcrumb-item active">Posting Stok Akhir</li>
@endsection

@section('header')
    <h1 class="page-header">Posting Stok Akhir</h1>
@endsection

@section('subcontent')
<div class="panel panel-inverse" data-sortable-id="form-stuff-1">
    <!-- begin panel-heading -->
    <form id="form-posting" method="post">
        @csrf
        <div class="panel-body">
            <div class="form-group input-group-sm">
                <label class="control-label">Bulan</label>
                <select class="form-control selectpicker" id="bulan" data-live-search="true" data-style="btn-info" data-width="100%">
                    @for($i=1; $i < 13; $i++)
                    <option value="{{ $i }}"
                        @if($bulan == $i)
                            selected
                        @endif
                    >{{ (DateTime::createFromFormat('!m', $i))->format('F') }}</option>
                    @endfor
                </select>
            </div>
            <div class="form-group input-group-sm">
                <label class="control-label">Tahun</label>
                <select class="form-control selectpicker" id="tahun" data-live-search="true" data-style="btn-info" data-width="100%">
                    @for($i=2015; $i <= date('Y'); $i++)
                    <option value="{{ $i }}"
                        @if($tahun == $i)
                            selected
                        @endif
                    >{{ $i }}</option>
                    @endfor
                </select>
            </div>
        </div>
        <div class="panel-footer">
            @role('super-admin|user')
            <input type="submit" id="btn-posting" class="btn btn-sm btn-success" value="Posting" />
            @endrole
            <div class="pull-right">
                This page took {{ (microtime(true) - LARAVEL_START) }} seconds to render
            </div>
        </div>
    </form>
</div>
@include('includes.component.error')
@endsection

@push('scripts')
<script src="/assets/plugins/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="/assets/plugins/parsleyjs/dist/parsley.js"></script>
<script type="text/javascript">
    var waitingDialog = waitingDialog || (function ($) {
        'use strict';

        var $dialog = $(
        '<div class="modal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top:15%; overflow-y:visible;">' +
            '<div class="modal-dialog modal-m">' +
                '<div class="modal-content">' +
                    '<div class="modal-header"><h3 style="margin:0;"></h3></div>' +
                    '<div class="modal-body">' +
                        '<center><img src="/assets/img/loading.svg" width="200"></center>' +
                    '</div>' +
                '</div>' +
            '</div>' +
        '</div>');

        return {
            show: function (message, options) {
                if (typeof options === 'undefined') {
                    options = {};
                }
                if (typeof message === 'undefined') {
                    message = 'Loading';
                }
                var settings = $.extend({
                    dialogSize: 'm',
                    progressType: '',
                    onHide: null
                }, options);

                $dialog.find('.modal-dialog').attr('class', 'modal-dialog').addClass('modal-' + settings.dialogSize);
                $dialog.find('h3').text(message);
                if (typeof settings.onHide === 'function') {
                    $dialog.off('hidden.bs.modal').on('hidden.bs.modal', function (e) {
                        settings.onHide.call($dialog);
                    });
                }
                $dialog.modal('show');
            },
            hide: function () {
                $dialog.modal('hide');
            }
        };

    })(jQuery);

    $('#form-posting').on('submit', function(e){
        e.preventDefault();

        if ($('#btn-posting').val() == 'Posting') {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.ajax({
                url : '/postingstok',
                method : 'POST',
                data : { "bulan": $('#bulan').val(), "tahun": $('#tahun').val() },
                beforeSend: function(data) {
                    waitingDialog.show('Mohon tunggu...');
                },
                success: function(data){
                    waitingDialog.hide();
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    waitingDialog.hide();
                    console.log(jqXHR);
                    alert("Gagal mengposting stok");
                }
            });
        }
    });
</script>
@endpush
