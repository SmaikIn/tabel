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
    <title>Рабочий табель</title>
</head>

<center>
    <h1>Рабочий табель</h1>
    <br>
    <h2>{{$user->name}}</h2>
    <br>
    <strong>Год</strong>
    <br>
    <div class="btn-group">
        @foreach($years as $k=>$v)
            <a href="{{$v}}" class="btn @if($k == $year) btn-warning @else btn-primary  @endif"
               aria-current="page">{{$k}}</a>
        @endforeach
    </div>
    <br>
    <strong>Месяц</strong>
    <br>
    <div class="btn-group">
        @foreach($months as $k=>$v)
            <a href="{{$v}}" class="btn  @if($k == $month) btn-warning @else btn-primary @endif"
               aria-current="page">{{$k}}</a>

        @endforeach
    </div>
    <br>
    <strong>Сотрудник</strong>
    <br>
    <div class="row" style="width: 1000px; text-align: center">
        <select class="form-control" onchange="goToUrl(this)">
            @foreach($users as $k => $v)
                {{$k}}
                <option @if($v == $user->name) selected @endif value="{{$k}}"> {{$v}} </option>
            @endforeach
        </select>
    </div>
    <script>
        function goToUrl(selectElement) {
            var selectedValue = selectElement.value;
            window.location.href = selectedValue;
        }
    </script>

    <table class="table table-hover" style="width: 1400px; text-align: center">
        <thead>
        <td>№</td>
        <td>Начало смены</td>
        <td>Конец смены</td>
        <td></td>
        <td></td>
        </thead>
        <tr>
            <form>
                <td>
                    <input name="id" disabled>
                </td>
                <td>
                    <input type="datetime-local" name="start">
                </td>
                <td>
                    <input type="datetime-local" name="end">
                </td>
                <td>
                    <input type="hidden" value="{{$user->id}}">
                    <a class="btn btn-success">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                             class="bi bi-plus-circle-fill" viewBox="0 0 16 16">
                            <path
                                d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
                        </svg>
                    </a>
                </td>
                <td>

                </td>
            </form>
        </tr>

        @foreach($shifts as $shift)
            <tr>
                <form>
                    <td>
                        <input name="id" value="{{$shift->id}}" disabled>
                    </td>
                    <td>
                        <input type="datetime-local" value="{{$shift->start_shift}}" name="start">
                    </td>
                    <td>
                        <input type="datetime-local" value="{{$shift->end_shift}}" name="end">
                    </td>
                    <td>
                        <a class="btn btn-primary">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-pencil-fill" viewBox="0 0 16 16">
                                <path
                                    d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
                            </svg>
                        </a>
                    </td>
                    <td>
                        <a class="btn btn-danger">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-x-circle-fill" viewBox="0 0 16 16">
                                <path
                                    d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
                            </svg>
                        </a>
                    </td>
                </form>
            </tr>
        @endforeach
        <tr>
            <td>2</td>
            <td>1</td>
            <td>3</td>
        </tr>
    </table>
</center>

<script>

</script>
</body>
</html>
