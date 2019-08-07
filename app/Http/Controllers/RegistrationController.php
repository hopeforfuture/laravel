<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Session;

class RegistrationController extends Controller
{
    public function create()
	{
		return view('users.create');
	}
}
