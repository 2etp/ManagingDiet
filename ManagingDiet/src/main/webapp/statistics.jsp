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

canvas {
	float: left;
}

#bar-chart {
	margin-left: 100px;
}
</style>
</head>
<body>

<canvas id="doughnut-chart" width="400" height="400"></canvas>
<div class="doughnut-inner">
	<h1 id="statistics"></h1>
</div>

<canvas id="bar-chart" width="400" height="400"></canvas>


<script>

var lengthOfMon = "${lengthOfMon}";
var thisMonthCnt = "${thisMonthCnt}";
var statistics = Math.ceil((thisMonthCnt/lengthOfMon)*100);

// 목표 달성도 화면에 출력
document.getElementById('statistics').innerText = statistics + '%';

// 도넛 차트 구현
new Chart(document.getElementById("doughnut-chart"), {
    type: 'doughnut',
    data: {
      labels: ["달성일 수", "미달성일 수"],
      datasets: [
        {
          label: "Goal Achievement",
          backgroundColor: ["#F56276", "#EBEBEB"],
          data: [thisMonthCnt, lengthOfMon-thisMonthCnt]
        }
      ]
    },
    options: {
    	responsive: false,
      title: {
        display: true,
        text: '이번 달 목표 달성도',
       	fontSize: 40

      }
    }
});

// 바 차트 구현
new Chart(document.getElementById("bar-chart"), {
    type: 'bar',
    data: {
      labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
      datasets: [
        {
          label: "Monthly Goal Achievement",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850", "#AB56F0", 
        	  				"#F0BD16", "#2FE050", "#EB464F", "#E8DE72", "#E66B0E", "#0B1EE6"],
          data: ["${stampCnt[0]}", "${stampCnt[1]}", "${stampCnt[2]}", "${stampCnt[3]}", "${stampCnt[4]}", "${stampCnt[5]}",
        	     "${stampCnt[6]}", "${stampCnt[7]}", "${stampCnt[8]}", "${stampCnt[9]}", "${stampCnt[10]}", "${stampCnt[11]}"]
        }
      ]
    },
    options: {
    	responsive: false,
      legend: { display: false },
      title: {
        display: true,
        text: '월별 달성도',
       	fontSize: 40
      }
    }
});
</script>
</body>
</html>