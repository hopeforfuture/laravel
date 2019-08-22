<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Member extends Model
{
    protected $table = 'members';
    protected $fillable = ['name', 'email', 'password', 'job_role'];
	
	const CREATED_AT = 'created_at';
	const UPDATED_AT = 'updated_at';
}
