<script src="/assets/js/app.min.js"></script>
<script src="/assets/js/theme/default.min.js"></script>

@if(Session::get('gritter_judul'))
<script src="/assets/plugins/gritter/js/jquery.gritter.min.js"></script>
<script>
    setTimeout(function() {
        $.gritter.add({
            title: '{{ Session::get('gritter_judul').'!' }}',
            text: '{{ Session::get('gritter_teks') }}',
            image: '{{ Session::get('gritter_gambar') }}',
            sticky: true,
            time: '',
            class_name: 'my-sticky-class'
        });
    }, 1000);
</script>
@endif

<script>
    $('[data-toggle="tooltip"]').tooltip({ trigger: "hover" });

    $('[data-toggle="tooltip"]').click(function () {
        $('[data-toggle="tooltip"]').tooltip("hide");
    });
</script>

@stack('scripts')
