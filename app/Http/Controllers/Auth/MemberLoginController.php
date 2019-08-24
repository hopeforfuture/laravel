<?php

namespace App\Http\Controllers\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;

class MemberLoginController extends Controller
{
    public function __construct()
    {
      $this->middleware('guest:member')->except('logout');
    }

    public function showLoginForm()
    {
      return view('auth.member-login');
    }

    public function login(Request $request)
    {
      // Validate the form data
      $this->validate($request, [
        'email'   => 'required|email',
        'password' => 'required|min:6'
      ]);
	  
	  $remember_me = $request->has('remember') ? true : false; 

      // Attempt to log the user in
      if (Auth::guard('member')->attempt(['email' => $request->email, 'password' => $request->password], $remember_me)) {
        // if successful, then redirect to their intended location
        return redirect()->intended(route('member.dashboard'));
      }

      // if unsuccessful, then redirect back to the login with the form data
      return redirect()->back()->with('status', 'Login Failed.')->withInput($request->only('email', 'remember'));
    }
	
	public function logout()
	{
		Auth::guard('member')->logout();
		
		return redirect()->route('member.login');
	}
}
