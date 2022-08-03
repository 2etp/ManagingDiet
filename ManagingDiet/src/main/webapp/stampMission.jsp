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
<link rel="stylesheet" href="./css/stampMission.css">

</head>
<body>

<h1>정수야 일일 미션 도장 찍자~</h1>

 
	<div class="calendar">
	    <div class="header">
	      <div class="year-month"></div>
	      <div class="nav">
	        <button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
	        <button class="nav-btn go-today" onclick="goToday()">Today</button>
	        <button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
	      </div>
	    </div>
	    <form id="form">
	    <div class="main">
	      <div class="days">
	        <div class="day">일</div>
	        <div class="day">월</div>
	        <div class="day">화</div>
	        <div class="day">수</div>
	        <div class="day">목</div>
	        <div class="day">금</div>
	        <div class="day">토</div>
	      </div>
	      <div class="dates"></div>
	    </div>
	    	<input type="button" id="btn" value="도장 찍기">
 		</form>
	</div>
	


<%-- <form action="stampMission.do" method="post">
	<c:forEach var="i" begin="1" end="${lengthOfMon}" >
		<label><input type="checkbox" name="stamp" value="${idKey.id}"><c:out value="${i}"/></label>
	</c:forEach>
	
	<input type="submit" value="도장 찍기">
</form>

<c:forEach items="${stampDate}" var="date">
	<p>${date.stampDate}</p>
</c:forEach> --%>

<script>

// stampDate 컬럼 데이터를 담을 배열 선언
var arr = [];
<c:forEach items="${stampDate}" var="date">
	var str = "${date}";
	var obj = {
			stampDate : "${date.stampDate}"
	};

	arr.push(parseInt(obj.stampDate.substring(8)));
</c:forEach>
console.log("arr : " + arr);

let date = new Date();

const renderCalender = () => {
  const viewYear = date.getFullYear();
  const viewMonth = date.getMonth();

  document.querySelector('.year-month').textContent = viewYear + "년" + ' ' + (viewMonth + 1) + "월";

  // 지난 달 마지막 Date, 이번 달 마지막 Date
  const prevLast = new Date(viewYear, viewMonth, 0);
  const thisLast = new Date(viewYear, viewMonth + 1, 0);

  const PLDate = prevLast.getDate();
  const PLDay = prevLast.getDay();

  const TLDate = thisLast.getDate();
  const TLDay = thisLast.getDay();

  // Dates 기본 배열들
  const prevDates = [];
  const thisDates = [...Array(TLDate + 1).keys()].slice(1);
  const nextDates = [];

  // prevDates 계산
  if (PLDay !== 6) {
    for (let i = 0; i < PLDay + 1; i++) {
      prevDates.unshift(PLDate - i);
    }
  }
  
  // nextDates 계산
  for (let i = 1; i < 7 - TLDay; i++) {
    nextDates.push(i);
  }

  // Dates 정리(이번 달 제외 한 날짜들은 투명도 주기)
  const dates = prevDates.concat(thisDates, nextDates);
  const firstDateIndex = dates.indexOf(1);
  const lastDateIndex = dates.lastIndexOf(TLDate);

  // 삼항 연산자를 통해서 이번 달에 해당하는 부분은 this, 그리고 나머지는 other라는 문자열로 구분해서
  // 날짜 부분을 span 태그로 감싸서 class로 지정
  dates.forEach((date, i) => {
    const condition = i >= firstDateIndex && i < lastDateIndex + 1
                      ? 'this'
                      : 'other';
    dates[i] = "<div class='date'><span class=" + condition + ">" + date + "</span></div>";
  });
  
  // Dates 그리기
  document.querySelector('.dates').innerHTML = dates.join('');
  
  // 오늘 날짜 그리기
  const today = new Date();
  // viewMonth와 viewYear가 today의 데이터와 같은지 비교를 한 다음
  if (viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
	// 만약 true라면 this라는 클래스를 가진 태그들을 모두 찾아내서 반복문을 돌려줌
    for (let date of document.querySelectorAll('.this')) {
    	for(var i = 0; i < arr.length; ++i) {	
		  // 그러고 나서 해당 태그가 가지고 있는 날짜는 문자열이기 때문에 + 단항 연산자를 통해 숫자로 변경한 뒤, 오늘 날짜와 비교하고
	      if (+date.innerText === arr[i]) {
		    // true면 해당 태그에 today라는 클래스를 추가하고 break로 반복문을 종료
	        date.classList.add('today');
	        // break를 하는 이유는 오늘 날짜는 하나밖에 없으므로 찾으면 더 이상 뒤의 반복을 할 필요가 없기 때문임
	        break;
	      }
     	}
    }
  }
};

renderCalender();

const prevMonth = () => {
  date.setDate(1);
  date.setMonth(date.getMonth() - 1);
  renderCalender();
};

const nextMonth = () => {
  date.setDate(1);
  date.setMonth(date.getMonth() + 1);
  renderCalender();
};

const goToday = () => {
  date = new Date();
  renderCalender();
};

// 오늘 날짜를 특정 포맷(yyyy-MM-dd)으로 변경
const parsedDate = new Date(+new Date() + 3240 * 10000).toISOString().split("T")[0];

$('#btn').click(function() {
	
    $.ajax({
				
        type: 'POST',
        url: '/ManagingDiet/stampMission.do',
        data: {"parsedDate" : parsedDate},
        dataType: 'text',
        success: function(data) {
        	alert("성공");
        },
        error: function(jqXHR, textStatus, errorThrown) {
        	alert("ERROR : " + textStatus + " : " + errorThrown);
      
        }
				
   });
});
</script>

<!-- <script defer src="./js/stampMission.js"></script> -->
</body>
</html>