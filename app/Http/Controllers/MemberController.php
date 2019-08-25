<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Member;
use Auth;

class MemberController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:member')->except('create', 'store');
		$this->middleware('guest:member')->except('index');
    }
	
	public function index()
    {
        return view('member.dashboard');
    }
	
	public function create()
	{
		return view('member.create');
	}
	
	public function store(Request $request)
	{
		$this->validate($request,
						[
							'name' => 'required',
							'email' => 'bail|required|email|unique:members',
							'password' => 'required|confirmed|min:6',
							'avatar' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
							'CaptchaCode' => 'required|valid_captcha', 
						]);
						
		$postdata = $request->except('password_confirmation', 'CaptchaCode');
		
		$postdata['password'] = bcrypt($postdata['password']);
		
		$member = new Member($postdata);
						
		if($file = $request->hasFile('avatar'))
		{
			$file = $request->file('avatar');
			$filename =  time().'.'.$file->getClientOriginalExtension();
			$destinationPath = public_path().'/avatar/' ;
            $file->move($destinationPath,$filename);
            $member->avatar = $filename ;
		}
		
		$member->save();
		
		Auth::guard('member')->login($member);
		
		return redirect()->route('member.dashboard');
	}
}
