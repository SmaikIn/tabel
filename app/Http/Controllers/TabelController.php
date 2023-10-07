<?php

namespace App\Http\Controllers;

use App\Employee;
use App\Models\User;
use App\Shift;
use Carbon\Carbon;
use DateInterval;
use DateTime;
use Illuminate\Http\Request;
use function PHPUnit\Framework\exactly;

class TabelController extends Controller
{
//исполльзовать Carbon
    public function index($employeeId = null, $year = null, $month = null, $action = 'read')
    {
        $employee = Employee::find($employeeId);
        if ($employee != null) {
            $employeeId = $employee->id;
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
            $calendarS = Carbon::create($year, $month)->startOfMonth();
            $calendarE = Carbon::create($year, $month)->endOfMonth()->addDay();
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
            $employee = Employee::first();
            return $this->index($employee->id);
        }
        $employee = Employee::findOrFail($employeeId);
        $array = array_keys($buttons['months']);
        $el = array_search($month, $array) + 1;
        $date_start = Carbon::create($year, $el)->startOfMonth();
        $date_end = Carbon::create($year, $el)->endOfMonth();
        $shifts = $employee->shifts()->whereBetween('start_shift', [$date_start, $date_end])->get();
        if ($action == 'read') {
            return view('tabel')->with([
                'users' => $users,
                'user' => $employee,
                'months' => $buttons['months'],
                'years' => $buttons['years'],
                'year' => $year,
                'month' => $month,
                'el' => $el,
                'shifts' => $shifts,
                'calendarS' => $calendarS,
                'calendarE' => $calendarE,
            ]);
        } else {
            if (count($shifts) == 0) {
                exit();
            }
            $total_time = 0;
            $timeListAll = [
                '8 to 20' => 0,
                '20 to 23' => 0,
                '23 to 8' => 0,
            ];
            foreach ($shifts as $shift) {

                $start_shift = Carbon::create($shift->start_shift); // Задаем время начала смены
                $end_shift = Carbon::create($shift->end_shift); // Задаем время окончания смены
                $q1 = $start_shift->copy();
                $q2 = $q1->copy();
                //$q2->;

// Задаем промежутки рабочего дня
                $shiftsList = [
                    [
                        'start' => $q1->copy()->setTime(8, 00),
                        'end' => $q1->copy()->setTime(20, 00),
                        'part' => 1,
                    ],
                    [
                        'start' => $q1->copy()->setTime(20, 00),
                        'end' => $q1->copy()->setTime(23, 00),
                        'part' => 2,
                    ],
                    [
                        'start' => $q1->copy()->setTime(23, 00),
                        'end' => $q2->add(1, 'day')->setTime(8, 00),
                        'part' => 3,
                    ],
                ];

                $timeList[$shift->id] = [
                    '8 to 20' => 0,
                    '20 to 23' => 0,
                    '23 to 8' => 0,
                    'shift' => $shift,
                ];


                foreach ($shiftsList as $item) {
                    $start = max($item['start'], $start_shift); // Начало промежутка рабочего дня
                    $end = min($item['end'], $end_shift); // Конец промежутка рабочего дня
                    if ($end > $start) {
                        if ($shift->obed && $item['part'] == 1) {
                            $delta = $end->timestamp - $start->timestamp - (60 * 60);
                        } else {
                            $delta = $end->timestamp - $start->timestamp;
                        }
                        $total_time += $delta;

                        $total_hours = floor(($delta) / 3600); // Получаем целое число часов
                        $total_minutes = floor(fmod(($delta), 3600) / 60); // Получаем целое число минут

                        switch ($item['part']) {
                            case "1":
                                $timeList[$shift->id]['8 to 20'] = $total_hours . ' часов ' . $total_minutes . ' минут';
                                $timeListAll['8 to 20'] += $end->timestamp - $start->timestamp;
                                break;
                            case "2":
                                $timeList[$shift->id]['20 to 23'] = $total_hours . ' часов ' . $total_minutes . ' минут';
                                $timeListAll['20 to 23'] += $end->timestamp - $start->timestamp;
                                break;
                            case "3":
                                $timeList[$shift->id]['23 to 8'] = $total_hours . ' часов ' . $total_minutes . ' минут';
                                $timeListAll['23 to 8'] += $end->timestamp - $start->timestamp;
                                break;
                        }


                    }


                }

            }
            $total_hours = floor($total_time / 3600); // Получаем целое число часов
            $total_minutes = floor(fmod($total_time, 3600) / 60); // Получаем целое число минут
            $total_time = 'Общее количество отработанных часов: ' . $total_hours . ' часов ' . $total_minutes . ' минут';
            foreach ($timeListAll as $k => $item) {
                $total_hours = floor($item / 3600); // Получаем целое число часов
                $total_minutes = floor(fmod($item, 3600) / 60); // Получаем целое число минут
                $result[$k] = $total_hours . ' часов ' . $total_minutes . ' минут';
            }

            return view('report')->with(
                [
                    'user' => $employee,
                    'year' => $year,
                    'month' => $month,
                    'result' => $result,
                    'total_time' => $total_time,
                    'timeList' => $timeList,
                    'i' => 1
                ]
            );


        }
    }

    public function createShift(Request $request)
    {
        $shift = new Shift;
        $shift->employee_id = $request->employee_id;
        $shift->start_shift = $request->start_shift;
        $shift->end_shift = $request->end_shift;
        $shift->obed = $request->obed;
        $shift->comment = $request->comment;
        $shift->save();
        return response($request, 200);
    }

    public function updateShift(int $id, Request $request)
    {
        $shift = Shift::find($id);
        $shift->employee_id = $request->employee_id;
        $shift->start_shift = $request->start_shift;
        $shift->end_shift = $request->end_shift;
        $shift->obed = $request->obed;
        $shift->comment = $request->comment;
        $shift->save();
        return response($shift, 200);
    }

    public function deleteShift(int $id)
    {
        Shift::destroy($id);
        return response('ok', 200);
    }

}
