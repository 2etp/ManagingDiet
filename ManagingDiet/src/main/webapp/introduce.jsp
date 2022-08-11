<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="KO" >
	<head>
	  <meta charset="UTF-8">
	  <title>introduce</title>
	<link href="https://fonts.googleapis.com/css2?family=Shrikhand&display=swap" rel="stylesheet"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
	<link rel="stylesheet" href="./css/navi.css">
	<link rel="stylesheet" href="./css/login.css">
	<link rel="stylesheet" href="./css/common.css">
	<link rel="stylesheet" href="./css/introduce.css">
	<!-- icon -->
	<script src="https://kit.fontawesome.com/a3dc88dac3.js" crossorigin="anonymous"></script>
	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	
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
				<h1>푸드퐁</h1>
				<img src="./image/치맥.PNG" width="660px;">
				<p class="main-p">s오늘 하루 고생한 나에게 수고했다며 오늘도 그렇게<br>
					야식으로 <span class="point">1200kcal</span>를 흡입!<br>다음날에는 죄책감에 꼬박 하루를 굶어버리죠.</p>
				<img src="./image/생활.PNG">
				<p class="main-p">하지만</p>
				<p class="main-p">회식에, 야근에, 개인공부까지...<br>운동을 생각하는 것 자체가<br>
					말이 안 되는 하루를 살고 계시더라구요.</p>
				<p class="main-p">저희는 이런 상황에 놓이신 분들에게<br><span class="point">적절한 식단관리</span>를 제공하여 보다 많은 분들이<br>건강하고 행복한 삶을 영위할 수 있기를 바랍니다.</p>
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
	
		 
	
	</body>
	<script src="./js/navi.js"></script>
	<script  src="./js/index.js"></script>
	<!-- 로그인 js -->
	<script src="./js/login.js"></script>
	</body>
</html>
	 
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>세 번째 단계</title>
</head>
<body>
	<p>당신의 일일 칼로리는 ${kcal}입니다. 돼지야</p>
	
	<form action="dietStep3.do" method="post">
		<input type="hidden" name="kcal" value="${kcal}">
		<input type="submit" value="3단계">
	</form>
</body>
</html> -->

<!-- 
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8" />
</head>
<body>
<h1>푸드퐁</h1>
 <img src="./image/치맥.PNG" width="660px;">
 <p>오늘 하루 고생한 나에게 수고했다며 오늘도 그렇게<br>
 	야식으로 1200kcal를 흡입!<br>다음날에는 죄책감에 꼬박 하루를 굶어버리죠.</p>
 <img src="./image/생활.PNG">
 <p>회근에, 야근에, 개인공부까지...<br>운동을 생각하는 것 자체가<br>
 	말이 안 되는 하루를 살고 계시더라구요.</p>
 <p>저희는 이런 상황에 놓이신 분들에게<br>적절한 식단관리를 제공하여 보다 많은 분들이<br>건강하고 행복한 삶을 영위할 수 있기를 바랍니다.</p>
</body>
</html> -->