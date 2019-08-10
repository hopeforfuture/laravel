<?php
use App\Post;
use Illuminate\Http\Request;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::get('/posts', 'PostsController@index')->name('posts.index');
Route::get('/posts/details/{id}', 'PostsController@details')->name('posts.details');
Route::get('/posts/add', 'PostsController@add')->name('posts.add');
Route::post('/posts/insert', 'PostsController@insert')->name('posts.insert');
Route::get('/posts/edit/{id}', 'PostsController@edit')->name('posts.edit');
Route::post('/posts/update/{id}', 'PostsController@update')->name('posts.update');
Route::get('/posts/delete/{id}', 'PostsController@delete')->name('posts.delete');

Route::get('/products', 'ProductsController@index')->name('products.index');
Route::get('/products/add', 'ProductsController@create')->name('products.add');
Route::post('/products/insert', 'ProductsController@store')->name('products.insert');
Route::get('/products/edit/{id}', 'ProductsController@edit')->name('products.edit');
Route::post('/products/update/{id}', 'ProductsController@update')->name('products.update');
Route::get('/products/delete/{id}', 'ProductsController@remove')->name('products.delete');

Route::get('/subjects', 'SubjectController@index')->name('subjects.index');
Route::get('/subjects/add', 'SubjectController@create')->name('subjects.add');
Route::post('/subjects/insert', 'SubjectController@insert')->name('subjects.insert');
Route::get('/subjects/edit/{id}', 'SubjectController@edit')->name('subjects.edit');
Route::post('/subjects/update/{id}', 'SubjectController@update')->name('subjects.update');
Route::get('/subjects/delete/{id}', 'SubjectController@remove')->name('subjects.delete');

Route::get('/students', 'StudentController@index')->name('students.index');
Route::get('/students/add', 'StudentController@create')->name('students.add');
Route::post('/students/insert', 'StudentController@insert')->name('students.insert');
Route::get('/students/edit/{id}', 'StudentController@edit')->name('students.edit');
Route::post('/students/update/{id}', 'StudentController@update')->name('students.update');
Route::get('/students/delete/{id}', 'StudentController@remove')->name('students.delete');
Route::get('/students/view/{id}', 'StudentController@view')->name('students.view');

Route::post('/students/roll/check', 'AjaxController@studentrollduplicate')->name('students.roll.duplicate');

Route::get('/register', 'UserController@create')->name('user.create');

Route::post('/register/insert', 'UserController@store')->name('user.store');

Route::get('/login', 'UserController@showlogin')->name('user.login');

Route::post('/login', 'UserController@dologin')->name('user.loginprocess');

Route::get('/logout', 'UserController@logout')->name('user.logout');

Route::get('/home', 'UserController@home')->name('user.home');


Route::get('session/get','SessionController@accessSessionData');
Route::get('session/set','SessionController@storeSessionData');
Route::get('session/remove','SessionController@deleteSessionData');

