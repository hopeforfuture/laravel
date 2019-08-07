@extends('layouts.app')

@section('content')
<div class="row">
    <div class="col-lg-12">
        @if($errors->any())
            <div class="alert alert-danger">
            @foreach($errors->all() as $error)
                <p>{{ $error }}</p>
            @endforeach()
            </div>
        @endif
		
			@if(Session::has('status'))
				<div class="alert alert-success">{{ Session::get('status') }}</div>
			@endif
       
        <div class="panel panel-default">
            <div class="panel-heading">
                User Login <a href="{{ route('user.create') }}" class="label label-primary pull-right">Register</a>
            </div>
            <div class="panel-body">
                <form action="{{ route('user.loginprocess') }}" method="POST" class="form-horizontal" enctype="multipart/form-data">
                    {{ csrf_field() }}
                    
                    <div class="form-group">
                        <label class="control-label col-sm-2" >Email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" id="email" class="form-control" value="{{ old('email') }}">
                        </div>
                    </div>
					<div class="form-group">
                        <label class="control-label col-sm-2" >Password</label>
                        <div class="col-sm-10">
                            <input type="password" name="password" id="password" class="form-control">
                        </div>
                    </div>
					
					
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <input type="submit" class="btn btn-default" value="Login" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
