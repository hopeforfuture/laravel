<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Subject;
use Session;
use Illuminate\Validation\Rule;
use Validator;

class SubjectController extends Controller
{
    public function index(Request $request)
	{
		//$products = Product::orderBy('id', 'DESC')->paginate(5);
		$subjects = Subject::where('status', '=', '1')->orderBy('id', 'DESC')->paginate(10);
		return view('subject.index',compact('subjects'))
            ->with('i', ($request->input('page', 1) - 1) * 10);
	}
	
	public function create()
	{
		return view('subject.add');
	}
	
	public function insert(Request $request)
	{
		$this->validate($request,
						[
							'name' => 'required',
							'code' => 'bail|required|unique:tblsubjects'
						]);
						
		$postData = $request->all();
		
		
		Subject::create($postData);
		
		Session::flash('success_msg', 'Subject Added successfully.');
		
		return redirect()->route('subjects.index');
	}
	
	public function edit($id)
	{
		$subject = Subject::find($id);
		return view('subject.edit', ['subject'=>$subject]);
	}
	
	public function update($id, Request $request)
	{
		
		$v = Validator::make($request->input(), [
			'name' => [
				'required', 
			],
			
			'code' => [
				'required',
				 Rule::unique('tblsubjects')->ignore($id),
			]
			
		]);
		
		if($v->fails())
        {
            return redirect()->back()->withErrors($v)->withInput();
        }
		
		//get post data
        $postData = $request->all();
        
        //update post data
        Subject::find($id)->update($postData);
        
        //store status message
        Session::flash('success_msg', 'Subject updated successfully!');

        return redirect()->route('subjects.index');
	}
	
	public function remove($id)
	{
		$subject = Subject::find($id);
		
		$subject->status = '0';
		
		$subject->save();
		
		Session::flash('success_msg', 'Subject Deleted successfully.');
		
		return redirect()->route('subjects.index');
	}
}
