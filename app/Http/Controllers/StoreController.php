<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Store;

class StoreController extends Controller{


  public function index(Request $request) {
    return ['stores' => Store::all()];
  }

  public function store(Request $request) {

    $error = FALSE;
    $user = $request->user();
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
      $data['user_id'] = 0;
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