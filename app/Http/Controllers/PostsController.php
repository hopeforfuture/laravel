<?php

namespace App\Http\Controllers;
use App\Post;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Session;

class PostsController extends Controller
{
    public function index()
	{
		$posts = Post::orderBy('created', 'desc')->get();
		
		return view('posts.index', ['posts'=>$posts]);
	}
	
	public function details($id)
	{
		$post = Post::find($id);
		
		return view('posts.details', ['post'=>$post]);
	}
	
	public function add()
	{
		return view('posts.add');
	}
	
	public function insert(Request $request)
	{
		$this->validate($request,
						[
							'title' => 'required',
							'content' => 'required'
						]);
						
		$postData = $request->all();
		
		Post::create($postData);
		
		Session::flash('success_msg', 'Post Added successfully.');
		
		return redirect()->route('posts.index');
	}
	
	public function edit($id)
	{
		$post = Post::find($id);
		return view('posts.edit', ['post'=>$post]);
	}
	
	public function update($id, Request $request)
	{
		$this->validate($request,
						[
							'title' => 'required',
							'content' => 'required'
						]);
						
		
		//get post data
        $postData = $request->all();
		
		/*echo "<pre>";
		print_r($postData);
		echo "</pre>";
		die;*/
        
        //update post data
        Post::find($id)->update($postData);
        
        //store status message
        Session::flash('success_msg', 'Post updated successfully!');

        return redirect()->route('posts.index');
	}
	
	public function delete($id){
        //update post data
        Post::find($id)->delete();
        
        //store status message
        Session::flash('success_msg', 'Post deleted successfully!');

        return redirect()->route('posts.index');
    }
	
}
