@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Member Dashboard</div>

                <div class="panel-body">
                    You are logged in as <strong>{{auth()->user()->name}}</strong>
					<a class="btn btn-info" href="{{ route('member.logout') }}">Logout</a>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
