<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Product;
use Session;
use Illuminate\Validation\Rule;
use Validator;

class ProductsController extends Controller
{
    
	public function index(Request $request)
	{
		//$products = Product::orderBy('id', 'DESC')->paginate(5);
		$products = Product::where('status', '=', '1')->orderBy('id', 'DESC')->paginate(5);
		return view('products.index',compact('products'))
            ->with('i', ($request->input('page', 1) - 1) * 5);
	}
	
	public function create()
	{
		return view('products.create');
	}
	
	public function store(Request $request)
	{
		$this->validate($request, [
		
			'name'=> 'required',
			'details'=>'required',
			'price'=>'required|integer',
			'product_image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
		
		]);
		
		$postdata = $request->input();
		
		$product = new Product($postdata);
		
		if($file = $request->hasFile('product_image'))
		{
			$file = $request->file('product_image');
			$filename =  time().'.'.$file->getClientOriginalExtension();
			$destinationPath = public_path().'/uploads/' ;
            $file->move($destinationPath,$filename);
            $product->product_image = $filename ;
		}
		
		$product->save();
		
		Session::flash('success_msg', 'Product Added successfully.');
		
		return redirect()->route('products.index');
	}
	
	public function edit($id)
	{
		$product = Product::find($id);
		return view('products.edit', ['product'=>$product]);
	}
	
	public function update($id, Request $request)
	{
		$product = Product::find($id);
		
		$v = Validator::make($request->input(), [
			'name' => [
				'required',
				 Rule::unique('products')->ignore($product->id),
			],
			
			'details' => [
				'required'
			],
			
			'price' => [
				'required',
				'integer'
			],
			
			'product_image' => [
				'image|mimes:jpeg,png,jpg,gif,svg'
			]
			
		]);
		
		if($v->fails())
        {
            return redirect()->back()->withErrors($v)->withInput();
        }
		
		$this->validate($request, [
		
			'product_image' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
		]);
		
		$product->name = trim($request->name);
		$product->details = trim($request->details);
		$product->price = trim($request->price);
		
		if($file = $request->hasFile('product_image'))
		{
			$file = $request->file('product_image');
			$filename =  time().'.'.$file->getClientOriginalExtension();
			$destinationPath = public_path().'/uploads/' ;
            $file->move($destinationPath,$filename);
            $product->product_image = $filename ;
			
			$old_image = $request->old_img;
			$old_image_path = public_path().'/uploads/'.$old_image;
			@unlink($old_image_path);
		}
		
		$product->save();
		
		Session::flash('success_msg', 'Product Updated successfully.');
		
		return redirect()->route('products.index');
	}
	
	public function remove($id)
	{
		$product = Product::find($id);
		
		$product->status = '0';
		
		$product->save();
		
		Session::flash('success_msg', 'Product Deleted successfully.');
		
		return redirect()->route('products.index');
	}
}
