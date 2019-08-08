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
		/*if(!empty($students))
		{
			$fav_sub_str = '';
			foreach($students as $student)
			{
				$id = $student->id;
				$name = $student->name;
				$email = $student->email;
				$contact = $student->contact;
				$roll_no = $student->roll_no;
				$fav_subjects = explode(",", $student->fav_subjects);
				foreach($fav_subjects as $fs)
				{
					$fav_sub_str.=$subjectarr[$fs].",";
				}
				$fav_sub_str = ltrim($fav_sub_str, ",");
				
				$studentsarr[] = array(
					'id'=>$id,
					'name'=>$name,
					'email'=>$email,
					'contact'=>$contact,
					'roll_no'=>$roll_no,
					'fav_sub'=>$fav_sub_str,
					'created'=>date('F j, Y H:i:s', strtotime($student->created))
					
				);
				$fav_sub_str = '';
			}
		}*/
		return view('student.index',['students'=>$students, 'subjects'=>$subjectarr])
            ->with('i', ($request->input('page', 1) - 1) * 10);
	}
	
	public function getAllSubjects()
	{
		$subjects = Subject::orderBy('created', 'desc')->get();
		return $subjects;
	}
}
