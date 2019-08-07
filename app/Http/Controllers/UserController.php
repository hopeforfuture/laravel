<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Session;
use Auth;
use Redirect;


class UserController extends Controller
{
    public function create()
	{
		if (Auth::check())
		{
			return redirect()->route('user.home');
		}
		return view('users.create');
	}
	
	public function store(Request $request)
	{
		$this->validate($request, [
            'name' => 'required|max:255',
            'email' => 'required|email|max:255|unique:users',
            'password' => 'required|confirmed|min:6',
        ]);

		$data = $request->all();

		$user = User::create([
					'name' => trim($data['name']),
					'email' => trim($data['email']),
					'password' => bcrypt($data['password']),
				]);

		Auth::login($user);
		
		return redirect()->route('user.home');
	}
	
	public function home()
	{
		if (Auth::guest()) {
			//is a guest so redirect
			return redirect()->route('user.login');
		}
		
		$userinfo = Auth::user();
		$data = array();
		$data['username'] = $userinfo->name;
		$data['useremail'] = $userinfo->email;
		
		return view('users.index', ['info'=>$data]);
	}
	
	public function showlogin()
	{
		if (Auth::check())
		{
			return redirect()->route('user.home');
		}
		return view('users.login');
		
		//return redirect()->route('user.home');
	}
	
	public function dologin(Request $request)
	{
		if (Auth::check())
		{
			return redirect()->route('user.home');
		}
		$this->validate($request, [
            'email' => 'required|email',
            'password' => 'required',
        ]);
		
		$data = $request->all();
		
		
		if (Auth::attempt(['email' => trim($data['email']), 'password' => $data['password'], 'u_status'=>'1'])) {
			return redirect()->route('user.home');
		}
		
		else {
			//Redirect::back()->withErrors(['msg', 'The Message']);
			return redirect()->back()->with('status', 'Login Failed')->withInput();
		}
	}
	
	public function logout()
	{
		if (Auth::guest()) {
			//is a guest so redirect
			return redirect()->route('user.login');
		}
		
		Auth::logout();
		
		return redirect()->route('user.login');
	}
}
