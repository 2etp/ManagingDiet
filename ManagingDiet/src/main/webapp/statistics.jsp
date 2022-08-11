<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html lang="KO" >
<head>
  <meta charset="UTF-8">
  <title></title>
<link rel="stylesheet" href="./css/statistics.css">
<link rel="stylesheet" href="./css/navi.css">
<link rel="stylesheet" href="./css/login.css">
<link rel="stylesheet" href="./css/common.css">
<!-- icon -->
<script src="https://kit.fontawesome.com/a3dc88dac3.js" crossorigin="anonymous"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.0/gsap.min.js'></script>
<script src='https://assets.codepen.io/16327/Flip.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

</head>
<body>	
    <div id="menu">
		<div class="hamburger">
			<div class="line"></div>
			<div class="line"></div>
			<div class="line"></div>
		</div>
		<div class="menu-inner">
			
			<ul class="index-control">
        <!-- 로그인 -->
        <li class=" main-nav">
          <c:if test="${empty idKey}">
            <a id="rainbow-btn" class="signin" href="#0" >Login / Signup</a>
          </c:if>
          </li>
          <li>
          <c:if test="${!empty idKey}">
            <p class="login-after">${idKey.name}님 환영합니다!</p>
            <br><br>
            <a id="rainbow-btn" class="signin" href="logout.do" >Logout</a>
          </c:if>
        </li>
        
        <!-- 메뉴 -->
        <li><a class="hover-1" href="./index.jsp">MAIN</a></li>
        <li><a class="hover-1" href="./introduce.jsp">INTRODUCE</a></li>
        <li><a class="hover-1" href="./dietCategory.jsp">DIET PROGRAM</a></li>
        <c:if test="${!empty idKey}">
          <li><a class="hover-1 signin" href="./myPage.jsp">My page</a></li>
        </c:if>
      </ul>
    		 <!-- sns 버튼 -->
			<section class="btn-section">
				<button class="btn-cp"><i class="fab fa-lg first-logo fa-codepen"></i><i class="fab fa-lg second-logo fa-codepen"></i></button>
				<button class="btn-tw"><i class="fab fa-lg first-logo fa-twitter"></i><i class="fab fa-lg second-logo fa-twitter"></i></button>
				<button class="btn-fb"><i class="fab fa-lg first-logo fa-facebook-f"></i><i class="fab fa-lg second-logo fa-facebook-f"></i></button>
				<button class="btn-ig"><i class="fab fa-lg first-logo fa-instagram"></i><i class="fab fa-lg second-logo fa-instagram"></i></button>
			</section>
		</div>
		
		<svg version="1.1" id="blob"xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
			<path id="blob-path" d="M60,500H0V0h60c0,0,20,172,20,250S60,900,60,500z"/>
		</svg>
	</div>

 <main>
  <h1 class="main-title">나의 목표 달성도</h1>

  <div class="main-container">

    <div>
      <canvas id="doughnut-chart"></canvas>
      <div class="doughnut-inner">
        <h1 id="statistics"></h1>
      </div>
    </div>

    <canvas id="bar-chart"></canvas>
  </div>
 </main>

<!-- 모달 로그인 -->
<div class="user-modal">
  <div class="user-modal-container">
    <ul class="switcher">
      <li><a href="#0">로그인</a></li>
      <li><a href="#0">회원가입</a></li>
    </ul>

    <div id="login">
      <form class="form" id="signin-form" action="login.do" method="post">
        <p class="fieldset">
          <label class="image-replace email" for="signin-email">E-mail</label>
          <input class="full-width has-padding has-border width" id="signin-email" type="email" name="id" value="${user.id }" placeholder="이메일">
          <span class="error-message" id="login-email">이메일을 입력하세요.</span>
          <span class="error-message" id="login-email2">이메일 형태로 입력하세요.</span>
        </p>

        <p class="fieldset">
          <label class="image-replace password" for="signin-password">Password</label>
          <input class="full-width has-padding has-border width" id="signin-password" type="password" name="password" value="${user.password }"  placeholder="비밀번호">
          <a href="#0" class="hide-password">Show</a>
          <span class="error-message" id="login-pw">비밀번호를 확인해주세요.</span>
          <span class="error-message" id="login-pw2">숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.</span>
        </p>

        <p class="fieldset">
          <input type="checkbox" id="remember-me">
          <label for="remember-me">Remember me</label>
        </p>

        <p class="fieldset">
          <input class="full-width" type="button" onclick="loginchk()" value="로그인">
        </p>
      </form>
      
      <p class="form-bottom-message"><a href="#0">Forgot your password?</a></p>
      <!-- <a href="#0" class="close-form">Close</a> -->
    </div>

    <!-- 회원가입 -->
    <div id="signup">
      <form action="signup.do" method="post" class="form" id="signup-form">
        <p class="fieldset">
          <label class="image-replace username" for="signup-username">Username</label>
          <input class="full-width has-padding has-border width" id="signup-username" type="text" name="name" placeholder="이름">
          <span class="error-message" id="user-danger">이름을 입력하세요</span>
          <span class="error-message" id="user-danger2">이름이 잘못 되었습니다.</span>
        </p>

        <p class="fieldset">
          <label class="image-replace email" for="signup-email">E-mail</label>
          <input type="email" class="full-width has-padding has-border width" id="signup-email" name="id"  placeholder="이메일">
          <span class="error-message" id="email-danger">이메일을 입력하세요.</span>
          <span class="error-message" id="email-danger2">이메일 형태로 입력하세요.</span>
        </p>

        <p class="fieldset">
          <i class="fa-solid fa-mobile-screen"></i>
          <label class="image-replace phone" for="signup-phone">Phone-number</label>
          <input class="full-width has-padding has-border width" id="signup-phone" type="tel" name="mobile" placeholder="휴대폰 번호 ex)01012345678">
          <span class="error-message" id="phone-danger">휴대폰 번호를 입력하세요.</span>
          <span class="error-message" id="phone-danger2">휴대폰 번호를 양식에 맞게 입력해주세요.</span>
        </p>

        <p class="fieldset">
          <label class="image-replace password" for="signup-password">Password</label>
          <input class="full-width has-padding has-border width pw" id="password_1" type="password" name="password" placeholder="비밀번호">
          <a href="#0" class="hide-password">Show</a>
          <span class="error-message" id="password-danger">숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.</span>
        </p>          

        <p class="fieldset">
          <label class="image-replace password" for="signup-password">Password</label>
          <input class="full-width has-padding has-border width pw" id="password_2" type="password" placeholder="비밀번호 확인">
          <a href="#0" class="hide-password">Show</a>
          <span class="error-message" id="alert-success">비밀번호가 일치합니다.</span>
          <span class="error-message" id="alert-danger">비밀번호가 일치하지 않습니다.</span>
        </p>

        <p class="fieldset">
          <input type="checkbox" id="accept-terms" name="agree">
          <span class="error-message" id="accept-danger" style="left: -23px; top: 23px;">약관 동의를 체크 해주세요.</span>
          <label for="accept-terms">I agree to the <a class="accept-terms" href="#0">Terms</a></label>
        </p>

        <!-- 회원가입 제출 버튼 -->
        <p class="fieldset">
          <input class="full-width has-padding agreeResult" name="checkButton" type="button" value="회원가입" onclick="checkPassword();">
        </p>
      </form>

      <!-- <a href="#0" class="cd-close-form">Close</a> -->
    </div>

    <div id="reset-password">
      <p class="form-message">Lost your password? Please enter your email address.</br> You will receive a link to create a new password.</p>

      <form class="form">
        <p class="fieldset">
          <label class="image-replace email" for="reset-email">E-mail</label>
          <input class="full-width has-padding has-border has-width" id="reset-email" type="email" placeholder="이메일">
          <span class="error-message">An account with this email does not exist!</span>
        </p>

        <p class="fieldset">
          <input class="full-width has-padding" type="submit" value="Reset password">
        </p>
      </form>

      <p class="form-bottom-message"><a href="#0">Back to log-in</a></p>
    </div>
    <a href="#0" class="close-form">Close</a>
  </div>
</div>
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
           fontSize: 30
        }
      }
  });
</script>

<script src="./js/navi.js"></script>
<script src="./js/index.js"></script>

<!-- 로그인 js -->
<script src="./js/login.js"></script>


</body>
</html>




<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
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
</html> -->