<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
	"http://www.w3.org/TR/html4/loose.dtd">
<html lang="KO" >
<head>
  <meta charset="UTF-8">
  <title>두 번째 단계</title>
<link href="https://fonts.googleapis.com/css2?family=Shrikhand&display=swap" rel="stylesheet"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="./css/typing.css">
<link rel="stylesheet" href="./css/step2.css">
<link rel="stylesheet" href="./css/navi.css">
<link rel="stylesheet" href="./css/login.css">
<link rel="stylesheet" href="./css/common.css">
<!-- icon -->
<script src="https://kit.fontawesome.com/a3dc88dac3.js" crossorigin="anonymous"></script>

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
				<li class=" main-nav"><a id="rainbow-btn" class="signin" href="#0" >Login / Signup</a></li>
				
				<!-- 메뉴 -->
				<li><a class="hover-1" href="./index.jsp">MAIN</a></li>
				<li><a class="hover-1" href="./main.html">INTRODUCE</a></li>
				<li><a class="hover-1" href="./dietCategory.jsp">DIET PROGRAM</a></li>
				<li><a class="hover-1" href="#">RECORD</a></li>
							
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
    
		<div class="typewriter">
			<h1 id="text">
				<span style="font-size: 40px;">현재 사용자의 기초대사량은 ${dietStep1.bmr}입니다. 이 돼지새끼야</span><br><br>
				<span style="font-size: 40px; color: black;">활동량</span><br>          
			</h1>           
		</div>
        <div class="main">
     
        
            
        <form action="" id="frm" class="frm" action="dietStep2.do" metion="post">
            <input id="choice_1" class="choice" type="radio" name="activityAmount" value="few">거의 없다(거의 좌식생활을 하고 운동 안함)<br><br>
            <input id="choice_2" class="choice" type="radio" name="activityAmount" value="aFew">조금 있다(활동량이 보통이거나 주 1~3회 운동)<br><br>
            <input id="choice_3" class="choice" type="radio" name="activityAmount" value="normal">보통(활동량이 다소 많거나 주 3~5회 운동)<br><br>
            <input id="choice_4" class="choice" type="radio" name="activityAmount" value="quite">꽤 있다(활동량이 많거나, 주 6~7회 운동)<br><br>
            <input id="choice_5" class="choice" type="radio" name="activityAmount" value="aLot">아주 많다(활동량이 매우 많거나, 거의 매일 하루 2번 운동)<br><br>
            
			<input type="hidden" name="bmr" value="${dietStep1.bmr}">
			<input type="hidden" name="type" value="${dietStep1.type}">

            <div class="btn-submit" id="btn">
                <span>NEXT</span>
                <div class="rotate"></div>
            </div>
        </form>   

        

    </div>

<!-- 모달 로그인 -->
<div class="user-modal">
    <div class="user-modal-container">
      <ul class="switcher">
        <li><a href="#0">로그인</a></li>
        <li><a href="#0">회원가입</a></li>
      </ul>

      <div id="login">
        <form class="form" id="signin-form">
          <p class="fieldset">
            <label class="image-replace email" for="signin-email">E-mail</label>
            <input class="full-width has-padding has-border width" id="signin-email" type="email" placeholder="이메일">
            <span class="error-message" id="login-email">이메일을 입력하세요.</span>
            <span class="error-message" id="login-email2">이메일 형태로 입력하세요.</span>
          </p>

          <p class="fieldset">
            <label class="image-replace password" for="signin-password">Password</label>
            <input class="full-width has-padding has-border width" id="signin-password" type="password"  placeholder="비밀번호">
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
        <form action="" class="form" id="signup-form">
          <p class="fieldset">
            <label class="image-replace username" for="signup-username">Username</label>
            <input class="full-width has-padding has-border width" id="signup-username" type="text" placeholder="이름">
            <span class="error-message" id="user-danger">이름을 입력하세요</span>
            <span class="error-message" id="user-danger2">이름이 잘못 되었습니다.</span>
          </p>

          <p class="fieldset">
            <label class="image-replace email" for="signup-email">E-mail</label>
            <input type="email" class="full-width has-padding has-border width" id="signup-email"  placeholder="이메일">
            <span class="error-message" id="email-danger">이메일을 입력하세요.</span>
            <span class="error-message" id="email-danger2">이메일 형태로 입력하세요.</span>
          </p>

          <p class="fieldset">
            <i class="fa-solid fa-mobile-screen"></i>
            <label class="image-replace phone" for="signup-phone">Phone-number</label>
            <input class="full-width has-padding has-border width" id="signup-phone" type="tel" placeholder="휴대폰 번호 ex)01012345678">
            <span class="error-message" id="phone-danger">휴대폰 번호를 입력하세요.</span>
            <span class="error-message" id="phone-danger2">휴대폰 번호를 양식에 맞게 입력해주세요.</span>
          </p>

          <p class="fieldset">
            <label class="image-replace password" for="signup-password">Password</label>
            <input class="full-width has-padding has-border width pw" id="password_1" type="password"  placeholder="비밀번호">
            <a href="#0" class="hide-password">Show</a>
            <span class="error-message" id="password-danger">숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.</span>
          </p>          

          <p class="fieldset">
            <label class="image-replace password" for="signup-password">Password</label>
            <input class="full-width has-padding has-border width pw" id="password_2" type="password"  placeholder="비밀번호 확인">
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
    
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="./js/navi.js"></script>
<script  src="./js/index.js"></script>
<!-- 로그인 js -->
<script src="./js/login.js"></script>
<!-- egg Toggle -->
<scripts src="./js/eggToggle.js" ></script>
<!-- Submit Button -->
<script src="./js/submit2.js"></script>
<script src="./js/Typing.js"></script>

</body>
</html>

    

<!-- <html>
<head>
<meta charset="UTF-8">
<title>두 번째 단계</title>
</head>
<body>
	<p>현재 사용자의 기초대사량은 ${dietStep1.bmr}입니다. 이 돼지새끼야</p>
	
	
	<form action="dietStep2.do" metion="post">
		<h2>활동량</h2>
		<label for="activityAmount1"><input id="activityAmount1" type="radio" name="activityAmount" value="few">거의 없다(거의 좌식생활울 하고 운동 안 함)</label>
		<label for="activityAmount2"><input id="activityAmount2" type="radio" name="activityAmount" value="aFew">조금 있다(활동량이 보통이거나 주 1-3회 운동)</label>
		<label for="activityAmount3"><input id="activityAmount3" type="radio" name="activityAmount" value="normal">보통(활동량이 다소 많거나 주 3-5회 운동)</label>
		<label for="activityAmount4"><input id="activityAmount4" type="radio" name="activityAmount" value="quite">꽤 있다(활동량이 많거나, 주 6-7회 운동)</label>
		<label for="activityAmount5"><input id="activityAmount5" type="radio" name="activityAmount" value="aLot">아주 많다(활동량이 매우 많거나, 거의 매일 하루 2번 운동)</label>
	
		<input type="hidden" name="bmr" value="${dietStep1.bmr}">
		<input type="hidden" name="type" value= "${dietStep1.type}">
		
		<input type="submit" value="2단계">
	</form>
</body>
</html> -->