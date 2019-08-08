<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Student;
use App\Subject;
use Session;
use Illuminate\Validation\Rule;
use Validator;

class StudentController extends Controller
{
	public function index(Request $request)
	{
		$subjects = $this->getAllSubjects();
		$subjectarr = array();
		$studentsarr = array();
		if(!empty($subjects))
		{
			foreach($subjects as $subject)
			{
				$sub_id = $subject->id;
				$sub_code = $subject->code;
				
				$subjectarr[$sub_id] = $sub_code;
			}
		}
		$students = Student::where('status', '=', '1')->orderBy('id', 'DESC')->paginate(10);
		return view('student.index',['students'=>$students, 'subjects'=>$subjectarr])
            ->with('i', ($request->input('page', 1) - 1) * 10);
	}
	
	public function getAllSubjects()
	{
		$subjects = Subject::orderBy('created', 'desc')->get();
		return $subjects;
	}
}
