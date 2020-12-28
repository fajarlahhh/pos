const mix = require('laravel-mix');
require('laravel-mix-dload');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel applications. By default, we are compiling the CSS
 | file for the application as well as bundling up all the JS files.
 |
 */
// autonumeric
mix.copy('node_modules/autonumeric/dist/', 'public/assets/plugins/autonumeric/');

// jquery-migrate
mix.copy('node_modules/jquery-migrate/dist/', 'public/assets/plugins/jquery-migrate/dist/');

// gritter
mix.copy('node_modules/gritter/', 'public/assets/plugins/gritter/');

// bootstrap-datepicker
mix.copy('node_modules/bootstrap-datepicker/dist/', 'public/assets/plugins/bootstrap-datepicker/dist/');

// jquery-sparkline
mix.copy('node_modules/jquery-sparkline/jquery.sparkline.min.js', 'public/assets/plugins/jquery-sparkline/jquery.sparkline.min.js');

// bootstrap3-wysihtml5-bower
mix.copy('node_modules/bootstrap3-wysihtml5-bower/dist/', 'public/assets/plugins/bootstrap3-wysihtml5-bower/dist/');

// moment
mix.copy('node_modules/moment/', 'public/assets/plugins/moment/');

// lity
mix.copy('node_modules/lity/dist/', 'public/assets/plugins/lity/dist/');

// lightbox2
mix.copy('node_modules/lightbox2/dist/', 'public/assets/plugins/lightbox2/dist/');

// ckeditor
mix.copy('node_modules/ckeditor/', 'public/assets/plugins/ckeditor/');

// parsleyjs
mix.copy('node_modules/parsleyjs/', 'public/assets/plugins/parsleyjs/');

// select2
mix.copy('node_modules/select2/dist/', 'public/assets/plugins/select2/dist/');

// jquery.maskedinput
mix.copy('node_modules/jquery.maskedinput/', 'public/assets/plugins/jquery.maskedinput/');

// bootstrap-select
mix.copy('node_modules/bootstrap-select/', 'public/assets/plugins/bootstrap-select/');

// bootstrap-daterangepicker
mix.copy('node_modules/bootstrap-daterangepicker/', 'public/assets/plugins/bootstrap-daterangepicker/');

// eonasdan-bootstrap-datetimepicker
mix.copy('node_modules/eonasdan-bootstrap-datetimepicker/', 'public/assets/plugins/eonasdan-bootstrap-datetimepicker/');

// clipboard
mix.copy('node_modules/clipboard/', 'public/assets/plugins/clipboard/');

// switchery
mix.copy('node_modules/switchery/', 'public/assets/plugins/switchery/');

// bootstrap-show-password
mix.copy('node_modules/bootstrap-show-password/', 'public/assets/plugins/bootstrap-show-password/');

// plugins download from url
mix.download({
    enabled: true,
    urls: [{
        'url': 'https://raw.githubusercontent.com/highlightjs/cdn-release/master/build/highlight.min.js',
        'dest': 'public/assets/plugins/highlight.js/'
    }, {
        'url': 'https://raw.githubusercontent.com/kbwood/countdown/master/dist/js/jquery.plugin.min.js',
        'dest': 'public/assets/plugins/countdown/'
    }, {
        'url': 'https://raw.githubusercontent.com/kbwood/countdown/master/dist/js/jquery.countdown.min.js',
        'dest': 'public/assets/plugins/countdown/'
    }, {
        'url': 'https://raw.githubusercontent.com/kbwood/countdown/master/dist/css/jquery.countdown.css',
        'dest': 'public/assets/plugins/countdown/'
    }, {
        'url': 'https://raw.githubusercontent.com/seyDoggy/superbox/master/js/jquery.superbox.min.js',
        'dest': 'public/assets/plugins/superbox/'
    }, {
        'url': 'https://raw.githubusercontent.com/seyDoggy/superbox/master/css/superbox.min.css',
        'dest': 'public/assets/plugins/superbox/'
    }, {
        'url': 'https://raw.githubusercontent.com/seyDoggy/superbox/master/css/font/superboxicons.eot',
        'dest': 'public/assets/plugins/superbox/font/'
    }, {
        'url': 'https://raw.githubusercontent.com/seyDoggy/superbox/master/css/font/superboxicons.svg',
        'dest': 'public/assets/plugins/superbox/font/'
    }, {
        'url': 'https://raw.githubusercontent.com/seyDoggy/superbox/master/css/font/superboxicons.ttf',
        'dest': 'public/assets/plugins/superbox/font/'
    }, {
        'url': 'https://raw.githubusercontent.com/seyDoggy/superbox/master/css/font/superboxicons.woff',
        'dest': 'public/assets/plugins/superbox/font/'
    }, {
        'url': 'http://jvectormap.com/js/jquery-jvectormap-world-mill.js',
        'dest': 'public/assets/plugins/jvectormap-next/'
    }, {
        'url': 'https://unpkg.com/ionicons@4.2.6/dist/css/ionicons.min.css',
        'dest': 'public/assets/plugins/ionicons/css/'
    }, {
        'url': 'https://unpkg.com/ionicons@4.2.6/dist/fonts/ionicons.eot',
        'dest': 'public/assets/plugins/ionicons/fonts/'
    }, {
        'url': 'https://unpkg.com/ionicons@4.2.6/dist/fonts/ionicons.woff2',
        'dest': 'public/assets/plugins/ionicons/fonts/'
    }, {
        'url': 'https://unpkg.com/ionicons@4.2.6/dist/fonts/ionicons.woff',
        'dest': 'public/assets/plugins/ionicons/fonts/'
    }, {
        'url': 'https://unpkg.com/ionicons@4.2.6/dist/fonts/ionicons.ttf',
        'dest': 'public/assets/plugins/ionicons/fonts/'
    }, {
        'url': 'https://unpkg.com/ionicons@4.2.6/dist/fonts/ionicons.svg',
        'dest': 'public/assets/plugins/ionicons/fonts/'
    }, {
        'url': 'http://lab.xero.nu/bootstrap_calendar/lib/css/bootstrap_calendar.css',
        'dest': 'public/assets/plugins/bootstrap-calendar/css/'
    }, {
        'url': 'http://lab.xero.nu/bootstrap_calendar/lib/js/bootstrap_calendar.min.js',
        'dest': 'public/assets/plugins/bootstrap-calendar/js/'
    }, {
        'url': 'https://raw.githubusercontent.com/extremeFE/bootstrap-colorpalette/master/css/bootstrap-colorpalette.css',
        'dest': 'public/assets/plugins/bootstrap-colorpalette/css/'
    }, {
        'url': 'https://raw.githubusercontent.com/extremeFE/bootstrap-colorpalette/master/js/bootstrap-colorpalette.js',
        'dest': 'public/assets/plugins/bootstrap-colorpalette/js/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/css/bootstrap-datetimepicker.min.css',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/css/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/bootstrap-datetimepicker.min.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.ar.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.az.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.bg.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.bn.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.ca.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.cs.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.da.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.de.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.ee.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.el.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.es.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.fi.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.fr.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.he.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.hr.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.hu.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.hy.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.id.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.is.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.it.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.ja.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.ka.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.ko.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.lt.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.lv.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.ms.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.nb.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.nl.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.no.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.pl.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.pt-BR.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.pt.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.ro.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.rs-latin.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.rs.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.ru.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.sk.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.sl.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.sv.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.sw.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.th.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.tr.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.ua.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.uk.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.zh-CN.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }, {
        'url': 'https://raw.githubusercontent.com/smalot/bootstrap-datetimepicker/master/js/locales/bootstrap-datetimepicker.zh-TW.js',
        'dest': 'public/assets/plugins/bootstrap-datetimepicker/js/locales/'
    }]
});