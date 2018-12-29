<?php

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

Route::get('/', ['uses' => function () {
  return view('app');
}, 'as' => 'home']);

Route::get('{a}', function () {
  return view('app');
});

Route::get('{a}/{b}', function () {
  return view('app');
});

Route::get('{a}/{b}/{c}', function () {
  return view('app');
});
