@extends('pages.setup.main')

@section('title', ' | Pengguna')

@push('css')
	<link href="/assets/plugins/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet" />
	<link href="/assets/plugins/parsleyjs/src/parsley.css" rel="stylesheet" />
	<link href="/assets/plugins/switchery/switchery.min.css" rel="stylesheet" />
@endpush

@section('page')
	<li class="breadcrumb-item active">Pengguna</li>
@endsection

@section('header')
	<h1 class="page-header">Pengguna</h1>
@endsection

@section('subcontent')
<div class="panel panel-inverse" data-sortable-id="form-stuff-1">
    <!-- begin panel-heading -->
    <div class="panel-heading">
        <div class="row width-full">
            <div class="col-xl-3 col-sm-6">
                @role('super-admin|user')
                <div class="form-inline">
                    <a href="{{ route('pengguna.tambah') }}" class="btn btn-primary"><i class="fa fa-plus"></i> Tambah</a>
                </div>
                @endrole
            </div>
            <div class="col-xl-9 col-sm-6">
                <form id="frm-cari" action="{{ route('pengguna') }}" method="GET">
                    <div class="form-inline pull-right">
                        <div class="form-group">
                            <select class="form-control selectpicker cari" name="tipe" data-live-search="true" data-style="btn-warning" data-width="100%">
                                <option value="0" {{ $tipe == '0'? 'selected': '' }}>Exist</option>
                                <option value="1" {{ $tipe == '1'? 'selected': '' }}>Deleted</option>
                                <option value="2" {{ $tipe == '2'? 'selected': '' }}>All</option>
                            </select>
                        </div>&nbsp;
                        <div class="input-group">
                            <input type="text" class="form-control cari" name="cari" placeholder="Cari" aria-label="Sizing example input" autocomplete="off" aria-describedby="basic-addon2" value="{{ $cari }}">
                            <div class="input-group-append">
                                <span class="input-group-text" id="basic-addon2"><i class="fa fa-search"></i></span>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>ID</th>
                        <th>Nama</th>
                        <th>Level</th>
                        <th class="width-90"></th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($data as $index => $row)
                    <tr>
                        <td>{{ ++$i }}</td>
                        <td>{{ $row->pengguna_id }}</td>
                        <td class="text-nowrap">{{ $row->pengguna_nama }}</td>
                        <td>{{ ucFirst($row->getRoleNames()[0]) }}</td>
                        @role('super-admin|user')
                        <td class="with-btn-group align-middle" nowrap>
                            @if ($row->pengguna_id != 'administrator')
                            <div class="btn-group">
                                @if ($row->trashed())
                                <a href="javascript:;" data-id="{{ $row->pengguna_id }}" data-no="{{ $i }}" class="btn btn-danger btn-sm btn-restore"> Restore</a>
                                @else
                                <a href="{{ route('pengguna.edit', array('id' => $row->pengguna_id)) }}" class="btn btn-aqua btn-sm"> Edit</a>
                                <a href="#" class="btn btn-white btn-sm dropdown-toggle width-30 no-caret" data-toggle="dropdown">
                                <span class="caret"></span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a href="javascript:;" data-id="{{ $row->pengguna_id }}" data-no="{{ $i }}" class="btn-hapus dropdown-item" > Hapus</a>
                                </div>
                                @endif
                            </div>
                            @endif
                        </td>
                        @endrole
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
    <div class="panel-footer form-inline">
        <div class="col-md-6 col-lg-8 col-xl-8 col-xs-12">
            {{ $data->links() }}
        </div>
        <div class="col-md-6 col-lg-4 col-xl-4 col-xs-12">
            <label class="pull-right">Jumlah Data : {{ $data->total() }}</label>
        </div>
        This page took {{ (microtime(true) - LARAVEL_START) }} seconds to render
    </div>
</div>
@endsection

@push('scripts')
<script src="/assets/plugins/switchery/switchery.min.js"></script>
<script src="/assets/plugins/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script>
    $(".cari").change(function() {
         $("#frm-cari").submit();
    });

	$(document).on('change', '[data-change="check-switchery-state-text"]', function() {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        var id = $(this).data("id");
        $.ajax({
            url: "/pengguna/status",
            type: "POST",
            data: {
                "status": ($(this).prop('checked') == true? 1: 0),
                "id" : id
            },
            success: function(data){
                if(data == 1 || data == 0)
                    Toast.fire({ icon: 'success', title: 'Berhasil ' + (data == 1? 'mengaktifkan': 'menonaktifkan') + ' pengguna'});
                else
                    Swal.fire({ icon: 'error', title: (data == 1? 'Mengaktifkan': 'Menonaktifkan') + ' Data', text: data });
            },
            error: function (xhr, ajaxOptions, thrownError) {
                Swal.fire({ icon: 'error', title: (data == 1? 'Mengaktifkan': 'Menonaktifkan') + ' Data', text: xhr.responseJSON.message });
            }
        });
	});

    if ($('[data-render=switchery]').length !== 0) {
		$('[data-render=switchery]').each(function() {
			var themeColor = COLOR_GREEN;
			if ($(this).attr('data-theme')) {
				switch ($(this).attr('data-theme')) {
					case 'red':
						themeColor = COLOR_RED;
						break;
					case 'blue':
						themeColor = COLOR_BLUE;
						break;
					case 'purple':
						themeColor = COLOR_PURPLE;
						break;
					case 'orange':
						themeColor = COLOR_ORANGE;
						break;
					case 'black':
						themeColor = COLOR_BLACK;
						break;
				}
			}
			var option = {};
			option.color = themeColor;
			option.secondaryColor = ($(this).attr('data-secondary-color')) ? $(this).attr('data-secondary-color') : '#dfdfdf';
			option.className = ($(this).attr('data-classname')) ? $(this).attr('data-classname') : 'switchery';
			option.disabled = ($(this).attr('data-disabled')) ? true : false;
			option.disabledOpacity = ($(this).attr('data-disabled-opacity')) ? parseFloat($(this).attr('data-disabled-opacity')) : 0.5;
			option.speed = ($(this).attr('data-speed')) ? $(this).attr('data-speed') : '0.5s';
			var switchery = new Switchery(this, option);
		});
	}


    $(".btn-restore").on('click', function () {
        var no = $(this).data('no');
        var id = $(this).data('id');
        Swal.fire({
            title: 'Restore Data',
            text: 'Anda akan mengembalikan data no ' + no,
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Ya',
            cancelButtonText: 'Tidak'
        }).then((result) => {
            if (result.value == true) {
                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
                $.ajax({
                    url: "/pengguna/restore",
                    type: "POST",
                    data: {
                        "_method": 'PATCH',
                        "id" : id
                    },
                    success: function(data){
                        location.reload(true);
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Restore data',
                            text: xhr.responseJSON.message
                        })
                    }
                });
            }
        });
    });

    $(".btn-hapus").on('click', function () {
        var no = $(this).data('no');
        var id = $(this).data('id');
        Swal.fire({
            title: 'Hapus Data',
            text: 'Anda akan menghapus data no ' + no,
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Ya',
            cancelButtonText: 'Tidak'
        }).then((result) => {
            if (result.value == true) {
                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
                $.ajax({
                    url: "/pengguna/hapus",
                    type: "POST",
                    data: {
                        "_method": 'DELETE',
                        "id" : id
                    },
                    success: function(data){
                        location.reload(true);
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Hapus data',
                            text: xhr.responseJSON.message
                        })
                    }
                });
            }
        });
    });
</script>
@endpush
