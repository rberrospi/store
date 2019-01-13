<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\User;
use App\Store;

class UserController extends Controller{


  public function index(Request $request) {
    return ['users' => User::all()];
  }

  public function get(Request $request) {

    $user = $request->user();

    if ($user && $user->status == 0){
      $user = FALSE;
    }

    return ['user' => $user];
  }

  public function store(Request $request) {
    $user = $request->user();

    $data = $request->all();
    $data['password'] = bcrypt($data['password']);
    $error = FALSE;

    if (!$user || $user->role != 'admin') {
      $data['role'] = 'user';
    }

    if (User::where('email', $data['email'])->first() ) {
      $error = 'Ya existe un usuario con ese correo.';
    } else {
      User::create($data);
    }

    return ['error' => $error];
  }

  public function update(User $user, Request $request) {
    
    $data = $request->all();
    $error = FALSE;
    if (isset($data['password']) && !empty($data['password'])) {
      $data['password'] = bcrypt($data['password']);
    } else {
      unset($data['password']);
    }

    unset($data['role']);


    if (User::where('email', $data['email'])->where('id','<>',$data['id'])->first() ) {
      $error = 'Ya existe un usuario con ese correo.';
    } else {
      $user->update($data);
    }


    if ($user->role == 'owner') {
      if (!empty($data['store'])) {
        Store::find($data['store'])->first()->update(['user_id' => $user->id]);
      } 
    }

    return ['error' => $error];
  }

  public function destroy(User $user) { 
    $user->delete();
  }

}