<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main Page</title>
<link href="https://fonts.googleapis.com/css2?family=Shrikhand&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/navi.css">
<link rel="stylesheet" href="../css/login.css">
<link rel="stylesheet" href="../css/common.css">
<!-- icon -->
<script src="https://kit.fontawesome.com/a3dc88dac3.js" crossorigin="anonymous"></script>

<script>
    var msg = "${msg}";
    if (msg === "insertFood") {
        alert("성공적으로 저장되었습니다.");
    } else if (msg == "updateFood") {
        alert("성공적으로 수정되었습니다.");
    } else if (msg == "failure") {
    	alert("다시 선택해 주세요.");
    }
</script>

</head>

<body>
	<center>
		<h1>식단 프로그램</h1>
		<hr>
		<c:if test="${empty idKey}">
			<a href="login.do">로그인</a><br>
			<a href="signup.do">회원가입</a>
		</c:if>
		<c:if test="${!empty idKey}">
			<p>${idKey.name}님 환영합니다!</p><br><br>
			<a href="logout.do">로그아웃</a>
		</c:if>
		<br>
		<br><a href="getBoardList.do">글 목록 바로가기</a>
		<hr><br>
		<a href="dietCategory.jsp">식단 프로그램</a>
		<br><br>
		<a href="myPage.jsp">마이페이지</a>
	</center>
	
	 <!-- 로딩화면 -->
  <div class="loading" id="loading">
    <div class="pan-loader">
      <div class="loader"></div>
      <div class="pan-container">
        <div class="pan"></div>
        <div class="handle"></div>
      </div>
      <div class="shadow"></div>
    </div>
  </div>
 

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
				<li><a class="hover-1" href="./index.html">MAIN</a></li>
				<li><a class="hover-1" href="./main.html">INTRODUCE</a></li>
				<li><a class="hover-1" href="./dietProgram.html">DIET PROGRAM</a></li>
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

  <!-- 계란후라이 토글 -->
  <label class="egg-switch">
    <input type="checkbox" id="darkModeToggle" class="dark-mode-toggle" value="off"   checked>
    <div>
        <div class="flipper">
            <svg>
                <use xlink:href="#flipper">
            </svg>
        </div>
        <div class="egg">
            <div class="front"></div>
            <div class="back"></div>
        </div>
    </div>
  </label>
  
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 39 18" id="flipper" fill="currentColor">
      <path d="M0.0244740693,1.75473835 C0.00818305726,1.86197078 0,1.97036486 0,2.07892575 L0,15.921377 C0,17.0693688 0.8954305,18 2,18 C2.10445462,18 2.20874874,17.9914953 2.31192515,17.9745638 L17.3119251,15.5130366 C18.2840292,15.3535125 19,14.4826852 19,13.4598497 L19,12.6377416 C19.6666667,11.5984301 20.3333333,11.0787744 21,11.0787744 L39,11.0787744 L39,6.92152835 L21,6.92152835 C20.3333333,6.92152835 19.6666667,6.4018726 19,5.36256109 L19,4.540453 C19,3.51761755 18.2840292,2.64679022 17.3119251,2.48726617 L2.31192515,0.0257389154 C1.2208723,-0.153304839 0.196745571,0.620794577 0.0244740693,1.75473835 Z M12.2049236,12.279252 C12.6185695,12.2575737 12.9714694,12.5753263 12.9931477,12.9889722 C13.0130194,13.3681476 12.747675,13.6962795 12.3847003,13.7650328 L12.2834275,13.7771963 L3.79507644,14.2220519 C3.38143055,14.2437302 3.02853059,13.9259776 3.00685233,13.5123317 C2.98698059,13.1331563 3.25232501,12.8050244 3.61529975,12.7362711 L3.71657251,12.7241076 L12.2049236,12.279252 Z M16.75,5 C16.8683467,5 16.9674868,5.08223341 16.9933973,5.19267729 L17,5.25 L17,12.75 C17,12.8880712 16.8880712,13 16.75,13 C16.6316533,13 16.5325132,12.9177666 16.5066027,12.8073227 L16.5,12.75 L16.5,5.25 C16.5,5.11192881 16.6119288,5 16.75,5 Z M13.7339356,9.6630893 C14.1480861,9.65586028 14.4896817,9.9857353 14.4971398,10.3998858 C14.5035373,10.7795237 14.2269029,11.0981954 13.8617498,11.1542391 L13.7601142,11.1628608 L3.26171343,11.3461111 C2.84756295,11.3533401 2.50596738,11.0234651 2.49850922,10.6093146 C2.49211175,10.2296767 2.76874618,9.91100505 3.13389925,9.85496129 L3.23553482,9.84633957 L13.7339356,9.6630893 Z M3.26171343,6.6630893 L13.7601142,6.84633957 C14.1742647,6.8535686 14.5041397,7.19516417 14.4971402,7.60931465 C14.4902841,7.98895258 14.2026967,8.29777572 13.8358102,8.34104168 L13.7339356,8.34611112 L3.23553482,8.16286085 C2.82138434,8.15563182 2.49150933,7.81403625 2.49850889,7.39988577 C2.50536496,7.02024784 2.79295235,6.7114247 3.15983888,6.66815874 L3.26171343,6.6630893 Z M3.79507644,3.77925197 L12.2834275,4.2241076 C12.6970734,4.24578586 13.0148259,4.59868582 12.9931477,5.01233171 C12.9732759,5.39150712 12.675086,5.69010548 12.306913,5.72054092 L12.2049236,5.7220519 L3.71657251,5.27719627 C3.30292661,5.25551801 2.98517406,4.90261805 3.00685233,4.48897215 C3.02672407,4.10979675 3.32491404,3.81119839 3.69308704,3.78076294 L3.79507644,3.77925197 Z"></path>
  </symbol>
</svg>
<!-- 배경 -->
<div id='wrap'>
  <div id='panels'>
    <section class='panel'>
      <h1 data-splitting='words'>AraZZi</h1>
      <div class='image'>
        <div class='inner'></div>
      </div>
      <div class='image right'>
        <div class='inner'></div>
      </div>
      <div class='image'>
        <div class='inner'></div>
      </div>
    </section>
    <section class='panel'>
      <h1 data-splitting='words'>Welcome to Flavortown</h1>
      <div class='image'>
        <div class='inner'></div>
      </div>
      <div class='image right'>
        <div class='inner'></div>
      </div>
      <div class='image'>
        <div class='inner'></div>
      </div>
    </section>
    <section class='panel'>
      <h1 data-splitting='words'>I’ve Been Stricken by Chicken</h1>
      <div class='image'>
        <div class='inner'></div>
      </div>
      <div class='image right'>
        <div class='inner'></div>
      </div>
      <div class='image'>
        <div class='inner'></div>
      </div>
    </section>
    <section class='panel'>
      <h1 data-splitting='words'>Peace, Love and Taco Grease</h1>
      <div class='image'>
        <div class='inner'></div>
      </div>
      <div class='image right'>
        <div class='inner'></div>
      </div>
      <div class='image'>
        <div class='inner'></div>
      </div>
    </section>
    <section class='panel'>
      <h1 data-splitting='words'>That’ll Do, Donkey That’ll Do</h1>
      <div class='image'>
        <div class='inner'></div>
      </div>
      <div class='image right'>
        <div class='inner'></div>
      </div>
      <div class='image'>
        <div class='inner'></div>
      </div>
    </section>
    <section class='panel'>
      <h1 data-splitting='words'>Tastes Really Funky, It’s Funkalicious</h1>
      <div class='image'>
        <div class='inner'></div>
      </div>
      <div class='image right'>
        <div class='inner'></div>
      </div>
      <div class='image'>
        <div class='inner'></div>
      </div>
    </section>
    <section class='panel'>
      <h1 data-splitting='words'>It's a Festival of Funk</h1>
      <div class='image'>
        <div class='inner'></div>
      </div>
      <div class='image right'>
        <div class='inner'></div>
      </div>
      <div class='image'>
        <div class='inner'></div>
      </div>
    </section>
    <section class='panel'>
      <h1 data-splitting='words'>Serve It on a Trashcan Lid</h1>
      <div class='image'>
        <div class='inner'></div>
      </div>
      <div class='image right'>
        <div class='inner'></div>
      </div>
      <div class='image'>
        <div class='inner'></div>
      </div>
    </section>
    <section class='panel'>
      <h1 data-splitting='words'>Shut the Front Door</h1>
      <div class='image'>
        <div class='inner'></div>
      </div>
      <div class='image right'>
        <div class='inner'></div>
      </div>
      <div class='image'>
        <div class='inner'></div>
      </div>
    </section>
    <section class='panel'>
      <h1 data-splitting='words'>Bomb Dot Com Tasty</h1>
      <div class='image'>
        <div class='inner'></div>
      </div>
      <div class='image right'>
        <div class='inner'></div>
      </div>
      <div class='image'>
        <div class='inner'></div>
      </div>
    </section>
    <div id='backgrounds'>
      <div class='bg'></div>
      <div class='bg'></div>
      <div class='bg'></div>
      <div class='bg'></div>
      <div class='bg'></div>
      <div class='bg'></div>
      <div class='bg'></div>
      <div class='bg'></div>
      <div class='bg'></div>
      <div class='bg'></div>
    </div>
  </div>
</div>
<!-- partial -->
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/gsap-latest-beta.min.js?r=5426'></script>
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/ScrollTrigger.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://unpkg.com/splitting@1.0.5/dist/splitting.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bodymovin/4.10.1/bodymovin.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.2/TweenMax.min.js"></script>
<script src="../Javascript/navi.js"></script>

<script  src="../Javascript/index.js"></script>
<!-- 로그인 js -->
<script src="../Javascript/login.js"></script>
<!-- egg Toggle -->
<scripts src="../Javascript/eggToggle.js"></script>
</body>
</html>