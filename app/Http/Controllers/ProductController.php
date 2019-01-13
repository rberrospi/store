<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Product;
use Auth;

class ProductController extends Controller{


  public function index(Request $request) {
    $user = Auth::guard('api')->user();

    $filter = $request->all();

    $query = Product::where('id','>',0);

    if (isset($filter['edit'])) {

      if ($user->role != 'admin') {
      
        if ($user->store) {
          $query->where('store_id',$user->store->id); 
        }  else {
          $query->where('store_id','XX'); 
        }
      } 
    } else {
      $query->where('approved',1);
      $query->where('status',1);
    }


    if (isset($filter['search'])) {
      $query->where('name','LIKE','%'.$filter['search'].'%');
    }


    $products = $query->get();

    return ['products' => $products];
  }

  public function show(Product $product, Request $request) {
    return ['product' => $product];
  }

  public function getBySlug($slug, Request $request) {
    $product = Product::whereSlug($slug)->first();
    return ['product' => $product];
  }

  public function variations(Product $product, Request $request){

    $data = $request->all();
    $variations = $product->variations;

    if (isset($data['index'])) {
      if (isset($data['delete'])) {
        unset($variations[$data['index']]);
      } else {
        if ($request->hasFile('image')) {
          $slug = $product->slug.'-'.($data['index']+1);
          $filename = $slug.'.'.$request->file('image')->extension();
          $path  = $request->file('image')->storeAs('public/variations',$filename);
          $data['image'] = 'variations/'.$filename;
        } else {
          $data['image'] = $variations[$data['index']]['image'];
        }

        $variations[$data['index']] = $data;
      }
    } else {
      if ($request->hasFile('image')) {
        $slug = $product->slug.'-'.count($product->variations);
        $filename = $slug.'.'.$request->file('image')->extension();
        $path  = $request->file('image')->storeAs('public/variations',$filename);
        $data['image'] = 'variations/'.$filename;
      }

      $variations[] = $data;
    }


    $product->update(['variations' => $variations]);


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
      $data['store_id'] = $user->store->id;
    }


    if (!$user || $user->role != 'user') {
      $product = Product::create($data);
    } else {
      $error = 'You are not allowed to do this.';
    }

    return ['error' => $error, 'product' => $product];
  }

  public function update(Product $product, Request $request) {
    
    $data = $request->all();
    $user = $request->user();
    $error = FALSE;

    unset($data['ìmage']);

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

    if(!isset($rslug)) {
      $rslug = $product->slug;
    }

    if ($request->hasFile('image')) {
      $filename = $rslug.'.'.$request->file('image')->extension();
      $path  = $request->file('image')->storeAs('public/products',$filename);
      $data['image'] = 'products/'.$filename;
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


    return ['error' => $error, 'product' => $product, 'data'=> $data];
  }

}



