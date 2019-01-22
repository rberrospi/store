<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Category;
use Storage;

class CategoriesController extends Controller{


  public function index(Request $request) {
    return ['categories' => Category::all()];
  }

  public function store(Request $request) {
    $error = FALSE;
    $data = $request->only(['name','subcategories']);
    $slug = str_slug($data['name']);
    $inc = -1;

    while(true) {
      $rslug = $slug.(($inc > -1)? "-$inc": "");
      if (!Category::where('slug',$rslug)->exists()){
        break;
      }
      $inc++;
    }

    $data['slug'] = $rslug;
  
    if ($request->hasFile('image')) {
      $filename = $rslug.'.'.$request->file('image')->extension();
      $path  = $request->file('image')->storeAs('public/categories',$filename);
      $data['image'] = 'categories/'.$filename;
    }

    $category = Category::create($data);

    return ['error' => $error];
  }

  public function getBySlug($slug, Request $request) {
    $category = Category::whereSlug($slug)->first();
    return ['category' => $category];
  }


  public function update(Category $category, Request $request) {

    $error = FALSE;
    $data = $request->only(['name','subcategories']);
    $slug = str_slug($data['name']);
    $inc = -1;

    while(true) {
      $rslug = $slug.(($inc > -1)? "-$inc": "");
      if (!Category::where('slug',$rslug)->where('id','<>',$category->id)->exists()){
        break;
      }
      $inc++;
    }

    $data['slug'] = $rslug;


    if ($request->hasFile('image')) {

      if ($category->image) {
        Storage::delete('public/'.$category->image);
      }

      $filename = $rslug.'.'.$request->file('image')->extension();
      $path  = $request->file('image')->storeAs('public/categories',$filename);
      $data['image'] = 'categories/'.$filename;
    }


    $category->update($data);

    return ['error' => $error];
  }

}








