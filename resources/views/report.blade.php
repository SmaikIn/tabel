<!doctype html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
            crossorigin="anonymous"></script>
    <title>Отчёт</title>
</head>
<body>

<h1>Рабочий табель</h1>
<h2>{{$user->name}}</h2>
<strong>Год {{$year}}</strong>
<br>
<strong>Месяц {{$month}}</strong>
<br>
<strong>Сотрудник {{$user->name}}</strong>
<br>


<table class="table table-hover" style="text-align: center">
    <thead>
    <td></td>
    <td>с 8 до 20</td>
    <td>с 20 до 23</td>
    <td>с 23 до 8</td>
    </thead>
    <tr>
        <td>{{$total_time}}</td>
        <td>{{$result['8 to 20']}}</td>
        <td>{{$result['20 to 23']}}</td>
        <td>{{$result['23 to 8']}}</td>
    </tr>
</table>
<br>
<table class="table table-hover" style="text-align: center">
    <thead>
    <td>№</td>
    <td>№ смены</td>
    <td>Начало смены</td>
    <td>Конец смены</td>
    <td>обед</td>
    <td>Комментарий</td>
    <td>с 8 до 20</td>
    <td>с 20 до 23</td>
    <td>с 23 до 8</td>
    </thead>
    @foreach($timeList as $key => $item)
        <tr>
            <td>{{$i++}}</td>
            <td>{{$key}}</td>
            <td>
                <input class="form-control" disabled type="datetime-local" value="{{$item['shift']->start_shift}}" name="start">
            </td>
            <td>
                <input class="form-control" disabled type="datetime-local" value="{{$item['shift']->end_shift}}" name="end">
            </td>
            <td>
                <input class="form-check-input" disabled type="checkbox" @if($item['shift']->obed) checked
                       @endif  name="obed">
            </td>
            <td>
                <input class="form-control" disabled type="text" value="{{$item['shift']->comment}}" name="comment">
            </td>

            <td>{{$item['8 to 20']}}</td>
            <td>{{$item['20 to 23']}}</td>
            <td>{{$item['23 to 8']}}</td>
        </tr>
    @endforeach
</table>

</body>
</html>
