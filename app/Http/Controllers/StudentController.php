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
	
	public function view($id)
	{
		$student = Student::find($id);
		$subjects = $this->getAllSubjects();
		$subjectarr = array();
		if(!empty($subjects))
		{
			foreach($subjects as $subject)
			{
				$sub_id = $subject->id;
				$sub_code = $subject->code;
				
				$subjectarr[$sub_id] = $sub_code;
			}
		}
		return view('student.view', ['student'=>$student, 'subjects'=>$subjectarr]);
	}
	
	public function getAllSubjects()
	{
		$subjects = Subject::where('status', '=', '1')->orderBy('created', 'desc')->get();
		return $subjects;
	}
	
	public function getAllClasses()
	{
		$classes = array(1=>'I', 2=>'II', 3=>'III', 4=>'IV', 5=>'V', 6=>'VI', 7=>'VII', 8=>'VIII', 9=>'IX', 10=>'X', 11=>'XI', 12=>'XII');
		return $classes;
	}
	
	public function create()
	{
		$subjects = $this->getAllSubjects();
		$classes = $this->getAllClasses();
		return view('student.add',['subjects'=>$subjects, 'classes'=>$classes]);
	}
	
	public function insert(Request $request)
	{
		$postdata = $request->all();
		
		dd($postdata);
	}
}
