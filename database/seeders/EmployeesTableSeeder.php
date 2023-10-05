<?php

namespace Database\Seeders;

use App\Employee;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Faker\Factory;

class EmployeesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Factory::create();

        for ($i = 0; $i <= 40; $i++) {
            $employee = new Employee();
            $employee->name = $faker->name;
            $employee->save();
        }

        //
    }
}
