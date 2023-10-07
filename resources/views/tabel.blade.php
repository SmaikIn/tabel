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
    <h2>{{$user->name}}</h2>
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
        <select style="text-align: center" class="form-select" onchange="goToUrl(this)">
            @foreach($users as $k => $v)
                {{$k}}
                <option @if($v == $user->name) selected @endif value="{{$k}}"> {{$v}} </option>
            @endforeach
        </select>
    </div>
    <div class="row" style="width: 1000px; text-align: center">
        <a href="/{{$user->id}}/{{$year}}/{{$el}}/report" target="_blank" class="btn btn-success">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                 class="bi bi-layout-text-window" viewBox="0 0 16 16">
                <path
                    d="M3 6.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5z"/>
                <path
                    d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm12 1a1 1 0 0 1 1 1v1H1V2a1 1 0 0 1 1-1h12zm1 3v10a1 1 0 0 1-1 1h-2V4h3zm-4 0v11H2a1 1 0 0 1-1-1V4h10z"/>
            </svg>
            Отчёт
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                 class="bi bi-layout-text-window-reverse" viewBox="0 0 16 16">
                <path
                    d="M13 6.5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h5a.5.5 0 0 0 .5-.5zm0 3a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h5a.5.5 0 0 0 .5-.5zm-.5 2.5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1 0-1h5z"/>
                <path
                    d="M14 0a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12zM2 1a1 1 0 0 0-1 1v1h14V2a1 1 0 0 0-1-1H2zM1 4v10a1 1 0 0 0 1 1h2V4H1zm4 0v11h9a1 1 0 0 0 1-1V4H5z"/>
            </svg>
        </a>
    </div>
    <script>
        function goToUrl(selectElement) {
            var selectedValue = selectElement.value;
            window.location.href = selectedValue;
        }
    </script>
    <table class="table table-hover" style="width: 1400px; text-align: center; justify-content: center">
        <thead>
        <td width="100">№</td>
        <td>Начало смены</td>
        <td>Конец смены</td>
        <td>Обед</td>
        <td>Коммент</td>
        <td></td>
        <td></td>
        </thead>
        <tr>
            <td>
                <input id="new_shift_id" class="form-control" name="id" readonly>
            </td>
            <td>
                <input id="new_shift_start" class="form-control" required type="datetime-local" name="start_shift">
            </td>
            <td>
                @if($el < 10)
                    {{$el}}
                    <input id="new_shift_end" class="form-control" min="{{$year}}-0{{$el}}-01T00:00"
                           max="{{$year}}-0{{$el}}-31T23:59" required type="datetime-local" name="end_shift">
                @else
                    <input id="new_shift_end" class="form-control" min="{{$year}}-{{$el}}-01T00:00"
                           max="{{$year}}-{{$el}}-31T23:59" required type="datetime-local" name="end_shift">
                @endif
            </td>
            <td>
                <input id="new_shift_obed" class="form-check-input" checked type="checkbox" name="obed">
            </td>
            <td>
                <input id="new_shift_comment" class="form-control" type="text" name="comment">
            </td>
            <td>
                <input type="hidden" id="new_shift_employee" name="employee_id" value="{{$user->id}}">
                <button onclick="createShift()" class="btn btn-success">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                         class="bi bi-plus-circle-fill" viewBox="0 0 16 16">
                        <path
                            d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
                    </svg>
                </button>
            </td>
            <td>

            </td>
        </tr>
        @foreach($shifts as $k => $shift)
            <tr>
                <td>
                    <input id="shift_id_{{$shift->id}}" style="text-align: center" class="form-control" name="id"
                           value="{{$shift->id}}"
                           disabled>
                </td>
                <td>
                    <input id="shift_start_{{$shift->id}}" class="form-control" type="datetime-local"
                           value="{{$shift->start_shift}}"
                           name="start">
                </td>
                <td>
                    <input id="shift_end_{{$shift->id}}" class="form-control" type="datetime-local"
                           value="{{$shift->end_shift}}"
                           name="end">
                </td>
                <td>
                    <input id="shift_obed_{{$shift->id}}" class="form-check-input" type="checkbox"
                           @if($shift->obed) checked
                           @endif  name="obed">
                </td>
                <td>
                    <input id="shift_comment_{{$shift->id}}" class="form-control" type="text"
                           value="{{$shift->comment}}"
                           name="comment">
                </td>
                <td>
                    <input id="shift_employee_{{$shift->id}}" type="hidden" name="employee_id" value="{{$user->id}}">
                    <button onclick="updateShift({{$shift->id}})" class="btn btn-primary">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                             class="bi bi-pencil-fill" viewBox="0 0 16 16">
                            <path
                                d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
                        </svg>
                    </button>
                </td>
                <td>
                    <a class="btn btn-danger" id="{{$shift->id}}" onclick="deleteShift({{$shift->id}})">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                             class="bi bi-x-circle-fill" viewBox="0 0 16 16">
                            <path
                                d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
                        </svg>
                    </a>
                </td>
            </tr>
        @endforeach
    </table>
</center>

<script>
    function deleteShift(id) {
        // Показать алерт с вопросом
        if (confirm('Вы действительно хотите удалить смену?')) {
            // Создать новый объект XMLHttpRequest
            var xhr = new XMLHttpRequest();

            // Установить метод и URL запроса
            xhr.open('DELETE', '/api/shifts/' + id, true);

            // Установить обработчик события загрузки
            xhr.onload = function () {
                if (xhr.status === 200) {
                    // Обработка успешного удаления
                    console.log(xhr.responseText);
                    alert('Смена успешно удалена');
                    // Дополнительные действия после удаления смены
                } else {
                    // Обработка ошибок при удалении
                    console.log(xhr.responseText);
                    alert('Произошла ошибка при удалении смены');
                }
            };

            // Отправить запрос на удаление смены
            xhr.send();
        }
        setTimeout(function () {
            window.location.reload();
        }, 500);
    }
</script>

<script>
    function createShift() {

        var startShift = document.getElementById('new_shift_start').value;
        var endShift = document.getElementById('new_shift_end').value;
        var comment = document.getElementById('new_shift_comment').value;
        var employeeId = document.getElementById('new_shift_employee').value;
        var isObed = document.getElementById('new_shift_obed').checked;

        // Создать объект newData с новыми данными
        var newData = {
            start_shift: startShift,
            end_shift: endShift,
            obed: isObed,
            comment: comment,
            employee_id: employeeId
        };

        // Создать новый объект XMLHttpRequest
        var xhr = new XMLHttpRequest();

        // Установить метод и URL запроса
        xhr.open('POST', '/api/shifts', true);

        // Установить заголовок Content-Type
        xhr.setRequestHeader('Content-Type', 'application/json');

        // Установить обработчик события загрузки
        xhr.onload = function () {
            if (xhr.status === 200) {
                // Обработка успешного обновления
                console.log(xhr.responseText);
                alert('Смена успешно создана');
                // Дополнительные действия после обновления смены
            } else {
                // Обработка ошибок при обновлении
                console.log(xhr.responseText);
                alert('Произошла ошибка при создании смены');
            }
        };

        // Отправить запрос на обновление смены с новыми данными
        xhr.send(JSON.stringify(newData));

        setTimeout(function () {
            window.location.reload();
        }, 500);
    }
</script>


<script>
    function updateShift(id) {

        var startShift = document.getElementById('shift_start_' + id).value;
        var endShift = document.getElementById('shift_end_' + id).value;
        var comment = document.getElementById('shift_comment_' + id).value;
        var employeeId = document.getElementById('shift_employee_' + id).value;
        var isObed = document.getElementById('shift_obed_' + id).checked;

        // Создать объект newData с новыми данными
        var newData = {
            start_shift: startShift,
            end_shift: endShift,
            obed: isObed,
            comment: comment,
            employee_id: employeeId
        };

        // Создать новый объект XMLHttpRequest
        var xhr = new XMLHttpRequest();

        // Установить метод и URL запроса
        xhr.open('PUT', '/api/shifts/' + id, true);

        // Установить заголовок Content-Type
        xhr.setRequestHeader('Content-Type', 'application/json');

        // Установить обработчик события загрузки
        xhr.onload = function () {
            if (xhr.status === 200) {
                // Обработка успешного обновления
                console.log(xhr.responseText);
                alert('Смена успешно обновлена');
                // Дополнительные действия после обновления смены
            } else {
                // Обработка ошибок при обновлении
                console.log(xhr.responseText);
                alert('Произошла ошибка при обновлении смены');
            }
        };

        // Отправить запрос на обновление смены с новыми данными
        xhr.send(JSON.stringify(newData));

        setTimeout(function () {
            window.location.reload();
        }, 500);
    }
</script>


</body>
</html>
