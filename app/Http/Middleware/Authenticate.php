<?php

namespace App\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Auth;

class Authenticate extends Middleware
{
    /**
     * Get the path the user should be redirected to when they are not authenticated.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return string
     */
    protected function redirectTo($request)
    {
		$guardsarr = explode("/",substr($_SERVER['REQUEST_URI'], 1));
		
		$guard = $guardsarr[0];
		
		switch ($guard) 
		{
          case 'admin':
            $login = 'admin.login';
            break;
			
		 case 'member':
            $login = 'member.login';
            break;
 

          default:
            $login = 'user.login';
            break;
        }
		
        if (! $request->expectsJson()) 
		{
            return route($login);
        }
    }
}
