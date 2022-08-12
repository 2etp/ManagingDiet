<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html lang="KO" >
<head>
  <meta charset="UTF-8">
  <title>푸드퐁 | 일일 미션</title>
<link href="https://fonts.googleapis.com/css2?family=Shrikhand&display=swap" rel="stylesheet"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="./css/stampMission.css">
<link rel="stylesheet" href="./css/navi.css">
<link rel="stylesheet" href="./css/login.css">
<link rel="sstylesheet" href="./css/common.css">
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<!-- icon -->
<script src="https://kit.fontawesome.com/a3dc88dac3.js" crossorigin="anonymous"></script><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

</head>
<body>
    <div id="menu">
		<div class="hamburger">
			<div class="line"></div>
			<div class="line"></div>
			<div class="line"></div>
		</div>
		<div class="menu-inner">
			
			<ul>
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
    <div class="main-container">
      <h1>일일 미션 체크!</h1>
      <div class="calendar">
          <div class="header">
            <div class="year-month"></div>
            <div class="nav">
              <button class="go-prev learn-more2" onclick="prevMonth()">&lt;</button>
              <button class="go-today learn-more2" onclick="goToday()">Today</button>
              <button class="go-next learn-more2" onclick="nextMonth()">&gt;</button>
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
          <button type="button" id="btn" value="도장 찍기" class="learn-more calendar-btn">도장 찍기</button>
        </form>
      </div>
    </div>        

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
                      ? 'this '+''
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

// 버튼 클릭 시, 오늘 날짜 DB에 저장
$('#btn').click(function() {
	console.log("버튼 클릭");
    $.ajax({
				
        type: 'POST',
        url: '/ManagingDiet/stampMission.do',
        data: {"parsedDate" : parsedDate},
        dataType: 'text',
        success: function(result) {
        	if(result == 0) {
        		alert("오늘의 미션 성공!!!")
            location.reload()
        	} else {
        		alert("이미 달성한 미션입니다.")
        	}
        },
        error: function(jqXHR, textStatus, errorThrown) {
        	alert("ERROR : " + textStatus + " : " + errorThrown);
      
        }		
   });
});
</script>

<script src="./js/navi.js"></script>
<script  src="./js/index.js"></script>
<!-- 로그인 js -->
<script src="./js/login.js"></script>
<!-- stamp -->
<script src="./js/stamp.js" ></script>
</body>
</html>



<!-- <html>
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

// 버튼 클릭 시, 오늘 날짜 DB에 저장
$('#btn').click(function() {
	
    $.ajax({
				
        type: 'POST',
        url: '/ManagingDiet/stampMission.do',
        data: {"parsedDate" : parsedDate},
        dataType: 'text',
        success: function(result) {
        	if(result == 0) {
        		alert("오늘의 미션 성공!!!")
        	} else {
        		alert("이미 달성한 미션입니다.")
        	}
        },
        error: function(jqXHR, textStatus, errorThrown) {
        	alert("ERROR : " + textStatus + " : " + errorThrown);
      
        }		
   });
});
</script>

<script defer src="./js/stampMission.js"></script>
</body>
</html> -->