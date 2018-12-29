<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Product;
use Auth;

class ProductController extends Controller{


  public function index(Request $request) {
    $user = Auth::guard('api')->user();
    $products = Product::all();
    return ['products' => $products];
  }

  public function show(Product $product, Request $request) {
    return ['product' => $product];
  }

  public function getBySlug($slug, Request $request) {
    $product = Product::whereSlug($slug)->first();
    return ['product' => $product];
  }

  

  public function store(Request $request) {
    $user = $request->user();

    $data = $request->all();
    $error = FALSE;

    $slug = str_slug($data['name']);
    $inc = -1;

    while(true) {
      $rslug = $slug.(($inc > -1)? "-$inc": "");
      if (!Product::where('slug',$rslug)->exists()){
        break;
      }
      $inc++;
    }

    $data['slug'] = $rslug;


    if (!$user || $user->role != 'admin') {
      unset($data['free']);
      unset($data['approved']);
    }


    if (!$user || $user->role != 'user') {
      Product::create($data);
    } else {
      $error = 'You are not allowed to do this.';
    }

    return ['error' => $error];
  }

  public function update(Product $product, Request $request) {
    
    $data = $request->all();
    $user = $request->user();
    $error = FALSE;

    if (isset($data['name'])) {
      $slug = str_slug($data['name']);
      $inc = -1;

      while(true) {
        $rslug = $slug.(($inc > -1)? "-$inc": "");
        if (!Product::where('slug',$rslug)->where('id','<>',$product->id)->exists()){
          break;
        }
        $inc++;
      }

      $data['slug'] = $rslug;
    }


    if (!$user || $user->role != 'admin') {
      unset($data['free']);
      unset($data['approved']);
    }

    if (!$user || $user->role != 'user') {
      $product->update($data);
    } else {
      $error = 'You are not allowed to do this.';
    }

    return ['error' => $error];
  }

}