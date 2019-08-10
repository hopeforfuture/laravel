<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\Student;

class AjaxController extends Controller
{
    public function studentrollduplicate(Request $request)
	{
		if(!($request->ajax()))
		{
			die('Not a http ajax request.');
		}
		$postdata = $request->all();
		$rollarr = explode(",", $postdata['roll_str']);
		$count = Student::whereIn('roll_no', $rollarr)->count();
		echo $count;
		die;
	}
}
