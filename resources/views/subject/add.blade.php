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
                Add  New Subject <a href="{{ route('subjects.index') }}" class="label label-primary pull-right">Back</a>
            </div>
            <div class="panel-body">
                <form action="{{ route('subjects.insert') }}" method="POST" class="form-horizontal">
                    {{ csrf_field() }}
				  
						<div class="form-group">
							<label class="control-label col-sm-2" >Subject Name</label>
							<div class="col-sm-10">
								<input type="text" required name="name" id="name" class="form-control" value="{{ old('name') }}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" >Subject Code</label>
							<div class="col-sm-10">
								<!--<textarea name="content" id="content" class="form-control">{{ old('content') }}</textarea>-->
								<input type="text" required name="code" id="code" class="form-control" value="{{ old('code') }}">
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