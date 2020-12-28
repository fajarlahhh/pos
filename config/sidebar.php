<?php

return [

    /*
    |--------------------------------------------------------------------------
    | View Storage Paths
    |--------------------------------------------------------------------------
    |
    | Most templating systems load templates from disk. Here you may specify
    | an array of paths that should be checked for your views. Of course
    | the usual Laravel view path has already been registered for you.
    |
    */

    'menu' => [[
		'icon' => 'fa fa-th-large',
		'title' => 'Dashboard',
		'url' => '/dashboard',
		'id' => 'dashboard'
	],[
		'icon' => 'fa fa-inbox',
		'title' => 'Barang Masuk',
		'url' => '/barangmasuk',
		'id' => 'barangmasuk'
	],[
		'icon' => 'fa fa-database',
		'title' => 'Data Master',
		'url' => 'javascript:;',
		'caret' => true,
		'id' => 'datamaster',
		'sub_menu' => [[
			'url' => '/barang',
			'id' => 'barang',
			'title' => 'Barang'
        ],[
			'url' => '/jenisbarang',
			'id' => 'jenisbarang',
			'title' => 'Jenis Barang'
        ],[
            'url' => '/pelanggan',
            'id' => 'pelanggan',
            'title' => 'Pelanggan'
        ],[
            'url' => '/supplier',
            'id' => 'supplier',
            'title' => 'Supplier'
        ]]
	],[
		'icon' => 'fa fa-file',
		'title' => 'Laporan',
		'url' => 'javascript:;',
		'caret' => true,
		'id' => 'laporan',
		'sub_menu' => [[
            'url' => '/laporanpenjualan',
            'id' => 'laporanpenjualan',
            'title' => 'Penjualan'
        ],[
            'url' => '/laporanstokbarang',
            'id' => 'laporanstokbarang',
            'title' => 'Stok Barang'
        ]]
	],[
		'icon' => 'fa fa-calculator',
		'title' => 'Penjualan',
		'url' => '/penjualan',
		'id' => 'penjualan'
	],[
		'icon' => 'fa fa-gavel',
		'title' => 'Posting Stok Akhir',
		'url' => '/postingstok',
		'id' => 'postingstok'
	]]
];
