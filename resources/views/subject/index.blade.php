@extends('layouts.app')

@section('content')
<div class="row">
    <div class="col-lg-12">
        @if(Session::has('success_msg'))
        <div class="alert alert-success">{{ Session::get('success_msg') }}</div>
        @endif
    <!-- Posts list -->
    @if(!empty($subjects))
        <div class="row">
            <div class="col-lg-12 margin-tb">
                <div class="pull-left">
                    <h2>Subjects List </h2>
                </div>
                <div class="pull-right">
                    <a class="btn btn-success" href="{{ route('subjects.add') }}"> Add New</a>
					<a class="btn btn-primary" href="{{ route('students.index') }}"> Students List</a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <table class="table table-striped task-table">
                    <!-- Table Headings -->
                    <thead>
						<th>Serial No</th>
                        <th>Subject Name</th>
                        <th>Subject Code</th>
                        <th>Created</th>
                        <th>Action</th>
                    </thead>
    
                    <!-- Table Body -->
                    <tbody>
                    @foreach($subjects as $subject)
                        <tr>
							<td class="table-text">
								<div>{{++$i}}</div>
							</td>
                            <td class="table-text">
                                <div>{{$subject->name}}</div>
                            </td>
                            <td class="table-text">
                                <div>{{$subject->code}}</div>
                            </td>
                            <td class="table-text">
                                <div>
									@php
										echo date('F j,Y H:i:s', strtotime($subject->created));
									@endphp 
								</div>
                            </td>
                            <td>
                               <a href="{{ route('subjects.edit', $subject->id) }}" class="label label-warning">Edit</a>
                                <a href="{{ route('subjects.delete', $subject->id) }}" class="label label-danger" onclick="return confirm('Are you sure to delete?')">Delete</a>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>
		 <nav>
			<ul class="pagination justify-content-end">
				 {{$subjects->links('vendor.pagination.bootstrap-4')}}
			 </ul>
		</nav>
    @endif
    </div>
</div>
@endsection