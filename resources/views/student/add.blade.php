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
            <div class="panel-body" style="overflow:scroll;">
                <form id="frmstudent" onsubmit="formvalidate();return false" action="{{ route('students.insert') }}" method="POST" class="form-horizontal">
                    {{ csrf_field() }}
				  <div class="tr_clone" id="addon">  
						<div class="form-group row" >
						
						  <div class="col-xs-2">
							<label for="ex1">Name</label>
							<input required class="form-control"  type="text" name="name[]">
						  </div>
						  
						  <div class="col-xs-2">
							<label for="ex2">Email Adress</label>
							<input required class="form-control" type="email" name="email[]">
						  </div>
						  
						  <div class="col-xs-2">
							<label for="ex3">Contact No</label>
							<input required class="form-control" type="text" name="contact[]">
						  </div>
						  
						  <div class="col-xs-2">
							<label for="ex3">Gender</label>
							<select required class="form-control" name="gender[]">
								<option value="">---Select Gender---</option>
								<option value="M">Male</option>
								<option value="F">Female</option>
							</select>
						  </div>
						  
						  <div class="col-xs-2">
							<label for="ex3">Roll No</label>
							<input required class="form-control roll_no" type="number" name="roll_no[]">
						  </div>
						  
						  <div class="col-xs-2">
							<label for="ex3">Class</label>
							<select required class="form-control" name="student_class[]">
								<option value="">---Select Class---</option>
								@foreach ($classes as $key=>$val)
								<option value="{{$key}}">{{$val}}</option>
								@endforeach
							</select>
						  </div>
						  
						  <div class="col-xs-2">
							<label for="ex3">Section</label>
							<select required class="form-control" name="section[]">
								<option value="">---Select Section---</option>
								<option value="A">A</option>
								<option value="B">B</option>
								<option value="B">C</option>
								<option value="B">D</option>
								<option value="B">E</option>
							</select>
						  </div>
						  
						  <div class="col-xs-2">
							<label for="ex3">Favourite Subjects</label>
							<select required multiple class="form-control fs" name="fav_subjects[]">
								<option value="0">---Select Favourite Subject---</option>
								@foreach($subjects as $subject)
								<option value="{{$subject->id}}">{{$subject->code}}</option>
								@endforeach
							</select>
						  </div>
						 
						</div>
						<div class="col-md-2 col-sm-2 col-xs-2" style="float:right;margin-top:-42px;">
							
							<a href="Javascript:void(0)" class="plus">
								<img src='{{ asset("img/plus.jpg")}}' width="40" height="30" />
							</a>
							<a href="Javascript:void(0)" class="minus" >
								<img  src='{{ asset("img/remove.png")}}' width="40" height="30" />
							</a>
						</div>
						  
				 </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
							<input type="hidden" name="fav_sub_num" id="fav_sub_num" />
                            <input type="submit" class="btn btn-default" value="Save" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
 $.ajaxSetup({

	headers: {

		'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
	}

});
$(document).ready(function(){
	var len = $(".panel-body").find('.fs').length;
	var rand = Math.floor(Math.random()*1000);
	var fav_sub_id = "fav_"+rand;
	$(".panel-body").find('.fs').attr('id', fav_sub_id);
	var fav_sub = new Array();
	
	$("body").on("click", ".plus", function(){
		var $tr = $(this).closest('.tr_clone');
		var $clone = $tr.clone();         
		$clone.find('input').val(''); 
		$clone.find('select').val('');
		$tr.after($clone);
		rand = Math.floor(Math.random()*1000);
		fav_sub_id = "fav_"+rand;
		$clone.find('.fs').attr('id', fav_sub_id);
	});
	
	$("body").on("click", ".minus", function() {
		var div_count = $('div.tr_clone').length;
		if(div_count > 1)
		{
			var fav_sub_id_remove = "#"+$(this).closest('.tr_clone').find('.fs').attr('id');
			var selected_len = $(fav_sub_id_remove + ' option:selected').length;
			for( var i = 0; i < fav_sub.length; i++)
			{ 
			   if ( fav_sub[i] == selected_len) 
			   {
				 fav_sub.splice(i, 1);
				 break;
			   }
			}
			$("#fav_sub_num").val(fav_sub.join(','));
			$(this).closest('.tr_clone').remove(); 
		}       
	});
	
	$("body").on("change", ".fs", function(){
		fav_sub = [];
		$(".fs").each(function(){
			var ddn_id = "#"+$(this).attr('id');
			var selected_len = $(ddn_id + ' option:selected').length;
			if(selected_len > 0)
			{
				fav_sub.push(selected_len);
			}
			
		});
		$("#fav_sub_num").val(fav_sub.join(','));
	});
});
function formvalidate()
{
	var flag = true;
	var fav_roll_arr = Array();
	var fav_roll_str = '';
	var roll_no_val = '';
	var alreadySeen = [];
	var err_roll_duplicate = '';
	var err_roll_use = '';
	var err_msg = '';
	var separator = '<br/>';
	
	$(".roll_no").each(function(){
		roll_no_val = $(this).val();
		fav_roll_arr.push(roll_no_val);
	});
	
	for(var j = 0; j < fav_roll_arr.length; j++)
	{
		var roll = fav_roll_arr[j];
		if(alreadySeen[roll])
		{
			flag = false;
			err_roll_duplicate = 'Duplicate roll no entered.' + separator;
			break;
		}
		else
		{
			alreadySeen[roll] = true;
		}
	}
	
	fav_roll_str = fav_roll_arr.join(',');
	
	$.ajax({
		type: "post",
		async:false,
		url: '/students/roll/check',
		data:{roll_str: fav_roll_str},
		success:function(len)
		{
			if(len > 0)
			{
				flag = false;
				err_roll_use = 'One or more roll no is in use.';
			}
		}
	});
	
	err_msg = err_roll_duplicate + err_roll_use;
	
	if(err_msg == '')
	{
		$("#frmstudent").submit();
	}
	else
	{
		
		$(".modal-body").html(err_msg);
		$("#myModal").modal();
	}
}
</script>
@endsection
