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
	<div id='calendar'></div>
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
//캘린더를 넣어줄 html div
const calendarEl = document.getElementById("calendar");

let calendar;

calendar_rendering();

function calendar_rendering() {
  calendar = new FullCalendar.Calendar(calendarEl, {
    initialView: "dayGridMonth",
    locale: 'ko' // 한국어 설정
  });
  calendar.render();
}
</script>
</body>
</html>