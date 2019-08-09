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
                Add  New Student <a href="{{ route('students.index') }}" class="label label-primary pull-right">Back</a>
				
				
            </div>
            <div class="panel-body">
                <form action="{{ route('students.insert') }}" method="POST" class="form-horizontal">
                    {{ csrf_field() }}
				  <div class="tr_clone" id="addon">  
						<div class="form-group row">
						  <div class="col-xs-2">
							<label for="ex1">col-xs-2</label>
							<input class="form-control" id="ex1" type="text">
						  </div>
						  <div class="col-xs-2">
							<label for="ex2">col-xs-2</label>
							<input class="form-control" id="ex2" type="text">
						  </div>
						  <div class="col-xs-2">
							<label for="ex3">col-xs-2</label>
							<input class="form-control" id="ex3" type="text">
						  </div>
						</div>
						<div class="col-md-2 col-sm-2 col-xs-2" style="float:right">
							
							<a href="Javascript:void(0)" class="plus">
								<img src='{{ asset("img/plus.jpg")}}' width="40" height="30" />
							</a>
							<a href="Javascript:void(0)" class="minus">
								<img  src='{{ asset("img/remove.png")}}' width="40" height="30" />
							</a>
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
<script>
	$("body").on("click", ".plus", function(){
		var $tr = $(this).closest('.tr_clone');
		var $clone = $tr.clone();         
		$clone.find('input').val(''); 
		//$clone.find('select').val('');
		//$clone.find('.tr_clone_remove').removeAttr('disabled');
		$tr.after($clone); 
	});
	$("body").on("click", ".minus", function() {
		var div_count = $('div.tr_clone').length;
		if(div_count > 1)
		{
		  $(this).closest('.tr_clone').remove(); 
		}       
	});
</script>
@endsection
