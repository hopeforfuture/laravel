<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMembersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    /*public function up()
    {
        Schema::create('members', function (Blueprint $table) {
            $table->increments('id');
			$table->string('name');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
			$table->string('job_role');
            $table->rememberToken();
            $table->timestamps();
        });
    }*/

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    /*public function down()
    {
        Schema::dropIfExists('members');
    }*/
}
