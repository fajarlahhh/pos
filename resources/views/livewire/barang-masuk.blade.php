<div>

    </div>

    @push('scripts')
    <script>
        Livewire.on('reinitialize', id => {
            $('.selectpicker').selectpicker('destroy');
            $('.selectpicker').selectpicker();
            $('.date').datepicker({
                todayHighlight: true,
                format: 'dd MM yyyy',
                autoclose: true
            });
        });
    </script>
    @endpush
</div>
