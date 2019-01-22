<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Store;
use Auth;

class StoreController extends Controller{


  public function index(Request $request) {

    $filters = $request->all();

    $query = Store::where('id', '>', 0);

    if (isset($filters['nousers'])) {
      $query->where('user_id',0);
    }

    $stores = $query->get();

    return ['stores' => $stores];
  }

  public function store(Request $request) {

    $error = FALSE;
    $user = Auth::guard('api')->user();
    $data = $request->all();
    $slug = str_slug($data['name']);
    $inc = -1;

    while(true) {
      $rslug = $slug.(($inc > -1)? "-$inc": "");
      if (!Store::where('slug',$rslug)->exists()){
        break;
      }
      $inc++;
    }

    if (!$user || $user->role != 'admin') {
      $data['status'] = 0;
      $data['user_id'] = isset($user)? $user->id : 0;
    }

    $data['slug'] = $rslug;

    if (isset($data['user_id']) && $data['user_id'] > 0) {

      if (Store::where('user_id',$data['user_id'])->exists()) {
        $error = 'El usuario ya esta asignado a otro proveedor.';
      }
    }

    if (!$error) {
      $store = Store::create($data);
    }

    return ['error' => $error];
  }

  public function update(Store $store, Request $request) {
    
    $error = FALSE;
    $user = $request->user();
    $data = $request->all();

    if (isset($data['name'])) {
      $slug = str_slug($data['name']);
      $inc = -1;

      while(true) {
        $rslug = $slug.(($inc > -1)? "-$inc": "");
        if (!Store::where('slug',$rslug)->where('id','<>',$store->id)->exists()){
          break;
        }
        $inc++;
      }

      $data['slug'] = $rslug;
    }


    if (!$user || $user->role != 'admin') {
      unset($data['status']);
      unset($data['user_id']);
    }

    if (isset($data['user_id']) && $data['user_id'] > 0) {

      if (Store::where('user_id',$data['user_id'])->where('id','<>',$store->id)->exists()) {
        $error = 'El usuario ya esta asignado a otro proveedor.';
      }
    }

    if (!$error) {
      $store->update($data);
    }
    return ['error' => $error];
  }



}