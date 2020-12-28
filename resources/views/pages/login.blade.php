@extends('layouts.empty', ['paceTop' => true])

@section('title', ' | Login')

@push('css')
	<link href="/assets/plugins/parsleyjs/src/parsley.css" rel="stylesheet" />
@endpush

@section('content')
	<!-- begin login -->
	<div class="login login-v1" data-pageload-addclass="animated fadeIn">
		<!-- begin login-container -->
		<div class="login-container">
            <!-- begin brand -->
			<div class="login-header">
				<div class="brand">
                    <span class="logo"></span> POS App
                    <small>© 2020 | V1.0</small>
				</div>
				<div class="icon">
					<i class="fa fa-lock"></i>
				</div>
			</div>
            <!-- end brand -->
			<!-- begin login-body -->
			<div class="login-body">
                <!-- begin login-content -->
                <div class="login-content">
                    <form action="{{ route('login') }}" method="POST" class="margin-bottom-0" data-parsley-validate="true" data-parsley-errors-messages-disabled="">
                        <div class="form-group m-b-20">
                            <input type="text" class="form-control form-control-lg" autocomplete="off" name="uid" placeholder="ID Pengguna" value="{{ old('uid') }}" required />
                        </div>
                        <div class="form-group m-b-20">
                            <input type="password" class="form-control form-control-lg" name="password" placeholder="Kata Sandi" value="{{ old('password') }}" required />
                        </div>
                        <div class="checkbox checkbox-css m-b-20">
                            <input type="checkbox" id="remember" name="remember" />
                            <label for="remember">
                                Ingat Saya
                            </label>
                        </div>
                        <div class="login-buttons">
                            <button type="submit" class="btn btn-success btn-block btn-lg">
                                <i class="fa fa-sign-in-alt"></i> Login
                            </button>
                        </div>
                    </form>
                </div>
                <!-- end login-content -->
			</div>
			<!-- end login-body -->
		</div>
		<!-- end login-container -->
	</div>
	<!-- end login -->
@endsection


@push('scripts')
	<script src="/assets/plugins/parsleyjs/dist/parsley.js"></script>
@endpush
