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
                Add a New Product <a href="{{ route('products.index') }}" class="label label-primary pull-right">Back</a>
            </div>
            <div class="panel-body">
                <form action="{{ route('products.insert') }}" method="POST" class="form-horizontal" enctype="multipart/form-data">
                    {{ csrf_field() }}
                    <div class="form-group">
                        <label class="control-label col-sm-2" >Product Name</label>
                        <div class="col-sm-10">
                            <input type="text" name="name" id="name" class="form-control" value="{{ old('name') }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" >Product Details</label>
                        <div class="col-sm-10">
                            <textarea name="details" id="details" class="form-control">{{ old('details') }}</textarea>
                        </div>
                    </div>
					<div class="form-group">
                        <label class="control-label col-sm-2" >Product Price</label>
                        <div class="col-sm-10">
                            <input type="text" name="price" id="price" class="form-control" value="{{ old('price') }}">
                        </div>
                    </div>
					<div class="form-group">
                        <label class="control-label col-sm-2" >Product Image</label>
                        <div class="col-sm-10">
                            <input type="file" name="product_image" id="product_image" class="form-control" onchange="loadFile(event)">
							<img id="output"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <input type="submit" class="btn btn-default" value="Add Product" />
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
    output.src = URL.createObjectURL(event.target.files[0]);
  };
</script>