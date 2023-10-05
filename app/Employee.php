<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Employee extends Model
{
    public function shifts(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->HasMany(Shift::class);
    }
}
