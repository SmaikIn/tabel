<?php

namespace App\Http\Controllers;

use App\Employee;
use App\Models\User;
use App\Shift;
use Carbon\Carbon;
use Illuminate\Http\Request;
use function PHPUnit\Framework\exactly;

class TabelController extends Controller
{
//исполльзовать Carbon
    public function index($employeeId = null, $year = null, $month = null)
    {
        if ($employeeId != null) {
            if ($year == null) {
                $year = Carbon::now()->year;
            }

            $buttons['years'] = [
                Carbon::now()->year - 1 => '/' . $employeeId . '/' . Carbon::now()->year - 1,
                Carbon::now()->year => '/' . $employeeId . '/' . Carbon::now()->year,
                Carbon::now()->year + 1 => '/' . $employeeId . '/' . Carbon::now()->year + 1,
            ];

            $buttons['months'] = [
                'Январь' => '/' . $employeeId . '/' . $year . '/' . 1,
                'Февраль' => '/' . $employeeId . '/' . $year . '/' . 2,
                'Март' => '/' . $employeeId . '/' . $year . '/' . 3,
                'Апрель' => '/' . $employeeId . '/' . $year . '/' . 4,
                'Май' => '/' . $employeeId . '/' . $year . '/' . 5,
                'Июнь' => '/' . $employeeId . '/' . $year . '/' . 6,
                'Июль' => '/' . $employeeId . '/' . $year . '/' . 7,
                'Август' => '/' . $employeeId . '/' . $year . '/' . 8,
                'Сентябрь' => '/' . $employeeId . '/' . $year . '/' . 9,
                'Октябрь' => '/' . $employeeId . '/' . $year . '/' . 10,
                'Ноябрь' => '/' . $employeeId . '/' . $year . '/' . 11,
                'Декабрь' => '/' . $employeeId . '/' . $year . '/' . 12,
            ];

            if ($month == null) {
                $month = Carbon::now()->month;
                $monthQ = Carbon::now()->month;
            } else {
                $monthQ = $month;
            }
            $i = 1;
            foreach ($buttons['months'] as $k => $v) {
                if ($i == $month) {
                    $month = $k;
                    break;
                } else {
                    $i++;
                }
            }
            $employees = Employee::orderBy('name')->get();
            foreach ($employees as $v) {
                $users['/' . $v->id . '/' . $year . '/' . $monthQ] = $v->name;
            }

        } else {
            echo "надо выбрать сотрудника обязательно, иначе работать не будет";
            exit();
        }


        $employee = Employee::findOrFail($employeeId);
        /*
         $shifts = $employee->shifts()->where('employee_id', $employeeId)
             ->whereBetween('start', [$startDate, $endDate])
             ->get();;
        $employeeId, $year, $month
 */

        $result = 1;
        $shifts = $employee->shifts;

        return view('tabel')->with([
            'users' => $users,
            'user' => $employee,
            'months' => $buttons['months'],
            'years' => $buttons['years'],
            'year' => $year,
            'month' => $month,
            'shifts' => $shifts,
            'result' => $result,
        ]);
    }
    //
}
