<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>목표 달성도</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

<style>
.doughnut-inner {
	position: absolute;
    top: 22%;
 	left: 10%;
}

</style>
</head>
<body>

<canvas id="doughnut-chart" width="400" height="400"></canvas>
<div class="doughnut-inner">
	<h1 id="statistics"></h1>
</div>


<script>

var lengthOfMon = parseInt("${lengthOfMon}");
var stampCnt = parseInt("${stampCnt}");
var statistics = Math.ceil((stampCnt/lengthOfMon)*100);

// 목표 달성도 화면에 출력
document.getElementById('statistics').innerText = statistics + '%';

// 도넛 차트 구현
new Chart(document.getElementById("doughnut-chart"), {
    type: 'doughnut',
    data: {
      labels: ["달성일 수", "미달성일 수"],
      datasets: [
        {
          label: "Goal achievement",
          backgroundColor: ["#F56276", "#EBEBEB"],
          data: [stampCnt, lengthOfMon-stampCnt]
        }
      ]
    },
    options: {
    	responsive: false,
      title: {
        display: true,
        text: '나의 목표 달성도',
       	fontSize: 50

      }
    }
});
</script>
</body>
</html>