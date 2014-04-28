<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

Route::get('/', function()
{
	$images = Image::all();

	return View::make('hello')->with('images', $images);
});

Route::get('image/{id}', ['as' => 'single-image', function($id)
{
	$image = Image::find($id);

	return View::make('gallery.image')->with('image', $image);
}]);
