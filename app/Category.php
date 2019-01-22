<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{


    protected $table = 'categories';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'subcategories','parent', 'image', 'slug'
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
      'subs'
    ];

    public function getSubsAttribute(){

      $subcategories = [];

      if (!empty($this->subcategories)) {
        $subcategories = explode(',', $this->subcategories);
        $subcategories = array_map('trim', $subcategories);
      }

      return $subcategories;
    }

}
