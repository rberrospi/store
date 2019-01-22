<?php

namespace App;

use Laravel\Passport\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'username', 'name', 'lastname', 'email', 'password', 'address', 'role', 'phone', 'mobile', 'status'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token','email_verified_at', 'created_at','updated_at'
    ];

    protected $casts = [
      'address' => 'object'
    ];

    protected $appends = [
      'wishlist', 'store'
    ];


    public function store(){
      return $this->hasOne(Store::class);
    }

    public function getStoreAttribute(){
      return $this->store()->first();
    }


    public function wishlist(){
      return $this->belongsToMany(Product::class,'wishlist');
    }

    public function getWishlistAttribute(){
      return $this->wishlist()->get();
    }

}
