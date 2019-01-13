<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{


  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
    'name','category_id','price','desc','summary','body','stock','condition','address','province','free','over18','returns','warranty', 'status','approved', 'slug', 'image', 'variations','store_id'
  ];

  /**
   * The attributes that should be hidden for arrays.
   *
   * @var array
   */
  protected $hidden = [
      'created_at', 'updated_at'
  ];

  protected $casts = [
    'variations' => 'array',
  ];
}
