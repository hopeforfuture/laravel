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
        <div class="panel panel-default">
            <div class="panel-heading">
                <a href="{{ route('member.login') }}" class="label label-primary pull-right">Sign In</a>
            </div>
            <div class="panel-body">
                <form action="{{ route('member.insert') }}" method="POST" class="form-horizontal" enctype="multipart/form-data">
                    {{ csrf_field() }}
                    <div class="form-group">
                        <label class="control-label col-sm-2" >Name</label>
                        <div class="col-sm-3">
                            <input type="text" required name="name" id="name" class="form-control" value="{{ old('name') }}">
                        </div>
                    </div>
                    
					<div class="form-group">
                        <label class="control-label col-sm-2" >Email Address</label>
                        <div class="col-sm-3">
                            <input type="email" required name="email" id="email" class="form-control" value="{{ old('email') }}">
                        </div>
                    </div>
					
					<div class="form-group">
                        <label class="control-label col-sm-2" >Password</label>
                        <div class="col-sm-3">
                            <input type="password" required name="password" id="password" class="form-control" >
                        </div>
                    </div>
					
					<div class="form-group">
                        <label class="control-label col-sm-2" >Confirm Password</label>
                        <div class="col-sm-3">
                            <input type="password" required name="password_confirmation" id="password_confirmation" class="form-control" >
                        </div>
                    </div>
					
					<div class="form-group">
                        <label class="control-label col-sm-2" >Upload Image</label>
                        <div class="col-sm-3">
                            <input type="file" name="avatar" id="avatar" class="form-control" onchange="loadFile(event)">
							<img id="output"/>
                        </div>
                    </div>
					
					<div class="form-group"> 
					  <label class="col-sm-2 control-label"></label> 

					  <div class="col-sm-3"> 
						{!! captcha_image_html('RegisterCaptcha') !!} 
						<input type="text" class="form-control" name="CaptchaCode" id="CaptchaCode" required> 
					  </div> 
					</div> 
					
					
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <input type="submit" class="btn btn-default" value="Save" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection

<script>
  var loadFile = function(event) {
    var output = document.getElementById('output');
	output.width = 120;
	output.height = 80;
    output.src = URL.createObjectURL(event.target.files[0]);
  };
</script>