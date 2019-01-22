<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Store extends Model
{


  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
    'slug','name','commercial_name','ruc','contact','phone','mobile','email','person','dni','bank','cci','status','user_id',
  ];

  /**
   * The attributes that should be hidden for arrays.
   *
   * @var array
   */
  protected $hidden = [
      'created_at', 'updated_at'
  ];

  public $appends = [
    'userdata'
  ];


  public function user(){
    return $this->belongsTo(User::class);
  }

  public function getUserdataAttribute(){

    $user = $this->user()->first();

    if ($user) {
      
      $data = [
        'name' => $user->name.' '.$user->lastname,
        'role' => $user->role
      ];

      return $data;
    }

    return FALSE;
  }

}


