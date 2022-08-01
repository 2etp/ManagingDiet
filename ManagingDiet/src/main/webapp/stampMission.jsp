<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>일일 미션 체크</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />  
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->  
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>

</head>
<body>

<h1>일일 미션 도장 찍자~</h1>

<div id='calendar-container'>
	<div id='calendar' style="width:1000px;"></div>
</div>   
 
<form action="stampMission.do" method="post">
	<c:forEach var="i" begin="1" end="${lengthOfMon}" >
		<label><input type="checkbox" name="stamp" value="${idKey.id}"><c:out value="${i}"/></label>
	</c:forEach>
	
	<input type="submit" value="도장 찍기">
</form>

<c:forEach items="${stampDate}" var="date">
	<p>${date.stampDate}</p>
</c:forEach>

<script>
/* const calendarEl = document.getElementById("calendar");

let calendar;

calendar_rendering();

function calendar_rendering() {
  calendar = new FullCalendar.Calendar(calendarEl, {
	height: '900px',
    initialView: "dayGridMonth",
    events: [
        { // this object will be "parsed" into an Event Object
          title: 'The Title', // 제목
          start: '2022-08-01', // 시작일자
          end: '2022-08-03' // 종료일자
        }
      ]
  });
  calendar.render();
} */


	
/* 	var request = $.ajax({
	  url: "/ManagingDiet/stampMission.do",
	  method: "GET",
	  dataType: "json"
	}); */
	 
    document.addEventListener('DOMContentLoaded', function () {
        $(function () {
            var request = $.ajax({
                url: "/ManagingDiet/stampMission.do", // 변경하기
                method: "GET",
                dataType: "json"
            });

            request.done(function (data) {
                console.log(data); // log 로 데이터 찍어주기.

                var calendarEl = document.getElementById('calendar');

                var calendar = new FullCalendar.Calendar(calendarEl, {
                    initialView: 'dayGridMonth',
                    headerToolbar: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                    },
                    editable: true,
                    droppable: true, // this allows things to be dropped onto the calendar
                    drop: function (arg) {
                        // is the "remove after drop" checkbox checked?
                        if (document.getElementById('drop-remove').checked) {
                            // if so, remove the element from the "Draggable Events" list
                            arg.draggedEl.parentNode.removeChild(arg.draggedEl);
                        }
                    },
                    /**
                     * data 로 값이 넘어온다. log 값 전달.
                     */
                    events: data
                });

                calendar.render();
            });

            request.fail(function( jqXHR, textStatus ) {
                alert( "Request failed: " + textStatus );
            });
        });

    });

</script>
</body>
</html>