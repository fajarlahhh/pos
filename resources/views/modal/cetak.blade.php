<div>
    <div wire:ignore.self class="modal fade" id="modal-cetak">
        <div class="modal-dialog {{ $size }}">
            <div class="modal-content">
                <div class="modal-body overflow-auto height-500">
                    {!! Session::get('cetak') !!}
                </div>
                <div class="modal-footer">
                    <a href="javascript:;" onclick="cetak()" class="btn btn-success">Cetak</a>
                </div>
            </div>
        </div>
    </div>
    @push('scripts')
        <script>
            function cetak() {
                var divToPrint = document.getElementById('modal-body-cetak');
                var newWin = window.open('', 'Print-Window');
                newWin.document.open();
                newWin.document.write(
                    '<body onload="window.print()">' +
                    divToPrint.innerHTML +
                    '</body>'
                );
                setTimeout(function() {
                    newWin.document.close();
                }, 1000);
            }
        </script>
    @endpush
</div>
