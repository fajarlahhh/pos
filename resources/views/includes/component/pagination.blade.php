<div class="panel-footer form-inline">
    <div class="col-md-6 col-lg-10 col-xl-10 col-xs-12">
        {{ $pagination->links() }}
    </div>
    <div class="col-md-6 col-lg-2 col-xl-2 col-xs-12">
        <label class="pull-right">Jumlah Data : {{ $pagination->total() }}</label>
    </div>
    This page took {{ (microtime(true) - LARAVEL_START) }} seconds to render
</div>
