<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::get('categories','CategoriesController@index');
Route::post('users','UserController@store');
Route::resource('stores','StoreController')->only(['store']);
Route::get('products/{product}','ProductController@show');
Route::get('products-slug/{slug}','ProductController@getBySlug');

Route::group(['middleware' => 'auth:api'], function(){
  Route::get('user', 'UserController@get');
  Route::resource('stores','StoreController')->only(['update']);

  Route::resource('products','ProductController')->only(['index','store','update']);

  Route::group(['middleware' => 'admin'], function(){
    Route::resource('users', 'UserController')->only(['index','update']);
    Route::resource('stores', 'StoreController')->only(['index']);
    Route::resource('categories', 'CategoriesController')->only(['store', 'update']);
  });

});
