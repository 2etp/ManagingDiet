<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html lang="KO" >
<head>
  <meta charset="UTF-8">
  <title></title>
<link href="https://fonts.googleapis.com/css2?family=Shrikhand&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/typing.css">
<link rel="stylesheet" href="./css/step3.css">
<link rel="stylesheet" href="./css/navi.css">
<link rel="stylesheet" href="./css/login.css">
<link rel="stylesheet" href="./css/common.css">
<!-- icon -->
<script src="https://kit.fontawesome.com/a3dc88dac3.js" crossorigin="anonymous"></script>    
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/3.3.4/gsap.min.js'></script>

</head>
<body>
	<!-- float Img -->
	<div class="image-grid">				
		<div class="image-grid__item pos-2">
			<img src="./image/íìíë¬¼.png" alt="">
		</div>
		<div class="image-grid__item pos-4">
			<img src="./image/ë¨ë°±ì§.png" alt="">
		</div>
		<div class="image-grid__item pos-5">
			<img src="./image/íë¨ì§.png" alt="">
		</div>
		<div class="image-grid__item pos-9">
			<img src="./image/ì§ë°©.png" alt="">
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
				<!-- ë¡ê·¸ì¸ -->
        <li class=" main-nav">
          <c:if test="${empty idKey}">
            <a id="rainbow-btn" class="signin" href="#0" >Login / Signup</a>
          </c:if>
        </li>
        <li>
          <c:if test="${!empty idKey}">
            <p>${idKey.name}ë íìí©ëë¤!</p>
            <a class="signin" href="./myPage.jsp" >My page</a><br><br>
            <a id="rainbow-btn" class="signin" href="logout.do" >Logout</a>
          </c:if>
        </li>
				
				<!-- ë©ë´ -->
				<li><a class="hover-1" href="./index.jsp">MAIN</a></li>
				<li><a class="hover-1" href="./main.html">INTRODUCE</a></li>
				<li><a class="hover-1" href="./dietCategory.jsp">DIET PROGRAM</a></li>
				<li><a class="hover-1" href="#">RECORD</a></li>
							
			</ul>
    		 <!-- sns ë²í¼ -->
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

	<form id="frm" action="dietStep4.do" method="post">
		<div class="typewriter">
			<h1 id="text">
				<span style="font-size: 40px;">
					ìììì ë§ë ì¹¼ë¡ë¦¬ êµ¬ì±<br>
				</span><br>
				<span class="contents" style="font-size: 30px;" >
					íìíë¬¼: ${nutrients[0]} g<br><br>
					ë¨ë°±ì§: ${nutrients[1]} g<br><br>
					ì§ë°©: ${nutrients[2]} g
				</span>				
			</h1>
		</div>
    <input type="hidden" name="carbs" value="${nutrients[0]}">
    <input type="hidden" name="protein" value="${nutrients[1]}">
    <input type="hidden" name="fat" value="${nutrients[2]}">
	</form>
	<div style="position: fixed; top: 73%;">
		<div class="btn-submit" id="btn">
			<span>NEXT</span>
			<div class="rotate"></div>
		</div>
	</div>
	

<!-- ëª¨ë¬ ë¡ê·¸ì¸ -->
<div class="user-modal">
  <div class="user-modal-container">
    <ul class="switcher">
      <li><a href="#0">ë¡ê·¸ì¸</a></li>
      <li><a href="#0">íìê°ì</a></li>
    </ul>

    <div id="login">
      <form class="form" id="signin-form" action="login.do" method="post">
        <p class="fieldset">
          <label class="image-replace email" for="signin-email">E-mail</label>
          <input class="full-width has-padding has-border width" id="signin-email" type="email" name="id" value="${user.id }" placeholder="ì´ë©ì¼">
          <span class="error-message" id="login-email">ì´ë©ì¼ì ìë ¥íì¸ì.</span>
          <span class="error-message" id="login-email2">ì´ë©ì¼ ííë¡ ìë ¥íì¸ì.</span>
        </p>

        <p class="fieldset">
          <label class="image-replace password" for="signin-password">Password</label>
          <input class="full-width has-padding has-border width" id="signin-password" type="password" name="password" value="${user.password }"  placeholder="ë¹ë°ë²í¸">
          <a href="#0" class="hide-password">Show</a>
          <span class="error-message" id="login-pw">ë¹ë°ë²í¸ë¥¼ íì¸í´ì£¼ì¸ì.</span>
          <span class="error-message" id="login-pw2">ì«ì+ìë¬¸ì+í¹ìë¬¸ì ì¡°í©ì¼ë¡ 8ìë¦¬ ì´ì ì¬ì©í´ì¼ í©ëë¤.</span>
        </p>

        <p class="fieldset">
          <input type="checkbox" id="remember-me">
          <label for="remember-me">Remember me</label>
        </p>

        <p class="fieldset">
          <input class="full-width" type="button" onclick="loginchk()" value="ë¡ê·¸ì¸">
        </p>
      </form>
      
      <p class="form-bottom-message"><a href="#0">Forgot your password?</a></p>
      <!-- <a href="#0" class="close-form">Close</a> -->
    </div>

    <!-- íìê°ì -->
    <div id="signup">
      <form action="signup.do" method="post" class="form" id="signup-form">
        <p class="fieldset">
          <label class="image-replace username" for="signup-username">Username</label>
          <input class="full-width has-padding has-border width" id="signup-username" type="text" name="name" placeholder="ì´ë¦">
          <span class="error-message" id="user-danger">ì´ë¦ì ìë ¥íì¸ì</span>
          <span class="error-message" id="user-danger2">ì´ë¦ì´ ìëª» ëììµëë¤.</span>
        </p>

        <p class="fieldset">
          <label class="image-replace email" for="signup-email">E-mail</label>
          <input type="email" class="full-width has-padding has-border width" id="signup-email" name="id"  placeholder="ì´ë©ì¼">
          <span class="error-message" id="email-danger">ì´ë©ì¼ì ìë ¥íì¸ì.</span>
          <span class="error-message" id="email-danger2">ì´ë©ì¼ ííë¡ ìë ¥íì¸ì.</span>
        </p>

        <p class="fieldset">
          <i class="fa-solid fa-mobile-screen"></i>
          <label class="image-replace phone" for="signup-phone">Phone-number</label>
          <input class="full-width has-padding has-border width" id="signup-phone" type="tel" name="mobile" placeholder="í´ëí° ë²í¸ ex)01012345678">
          <span class="error-message" id="phone-danger">í´ëí° ë²í¸ë¥¼ ìë ¥íì¸ì.</span>
          <span class="error-message" id="phone-danger2">í´ëí° ë²í¸ë¥¼ ììì ë§ê² ìë ¥í´ì£¼ì¸ì.</span>
        </p>

        <p class="fieldset">
          <label class="image-replace password" for="signup-password">Password</label>
          <input class="full-width has-padding has-border width pw" id="password_1" type="password" name="password" placeholder="ë¹ë°ë²í¸">
          <a href="#0" class="hide-password">Show</a>
          <span class="error-message" id="password-danger">ì«ì+ìë¬¸ì+í¹ìë¬¸ì ì¡°í©ì¼ë¡ 8ìë¦¬ ì´ì ì¬ì©í´ì¼ í©ëë¤.</span>
        </p>          

        <p class="fieldset">
          <label class="image-replace password" for="signup-password">Password</label>
          <input class="full-width has-padding has-border width pw" id="password_2" type="password" placeholder="ë¹ë°ë²í¸ íì¸">
          <a href="#0" class="hide-password">Show</a>
          <span class="error-message" id="alert-success">ë¹ë°ë²í¸ê° ì¼ì¹í©ëë¤.</span>
          <span class="error-message" id="alert-danger">ë¹ë°ë²í¸ê° ì¼ì¹íì§ ììµëë¤.</span>
        </p>

        <p class="fieldset">
          <input type="checkbox" id="accept-terms" name="agree">
          <span class="error-message" id="accept-danger" style="left: -23px; top: 23px;">ì½ê´ ëìë¥¼ ì²´í¬ í´ì£¼ì¸ì.</span>
          <label for="accept-terms">I agree to the <a class="accept-terms" href="#0">Terms</a></label>
        </p>

        <!-- íìê°ì ì ì¶ ë²í¼ -->
        <p class="fieldset">
          <input class="full-width has-padding agreeResult" name="checkButton" type="button" value="íìê°ì" onclick="checkPassword();">
        </p>
      </form>

      <!-- <a href="#0" class="cd-close-form">Close</a> -->
    </div>

    <div id="reset-password">
      <p class="form-message">Lost your password? Please enter your email address.</br> You will receive a link to create a new password.</p>

      <form class="form">
        <p class="fieldset">
          <label class="image-replace email" for="reset-email">E-mail</label>
          <input class="full-width has-padding has-border has-width" id="reset-email" type="email" placeholder="ì´ë©ì¼">
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
	 

<script src="./js/navi.js"></script>
<script src="./js/index.js"></script>
<!-- ë¡ê·¸ì¸ js -->
<script src="./js/login.js"></script>
<!-- egg Toggle -->
<scripts src="./js/eggToggle.js" ></script>
<!-- Submit Button -->
<script src="./js/submit3.js"></script>
<script src="./js/Typing.js"></script>
<!-- float Img -->
<script src="./js/floatImg.js"></script>

</body>
</html>


<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>ë¤ ë²ì§¸ ë¨ê³</title>

</head>
<body>

<div class="main">
   <div id="table">
      <div id="centeralign">
        <h1>ìììì ë§ë ì¹¼ë¡ë¦¬ êµ¬ì±</h1>
        <p>íìíë¬¼: ${nutrients[0]}</p>
        <p>ë¨ë°±ì§: ${nutrients[1]}</p>
        <p>ì§ë°©: ${nutrients[2]}</p>
      </div>
   </div>
</div>

	
<form action="dietStep4.do" method="post">
	<input type="hidden" name="carbs" value="${nutrients[0]}">
	<input type="hidden" name="protein" value="${nutrients[1]}">
	<input type="hidden" name="fat" value="${nutrients[2]}">
	<input type="submit" value="4ë¨ê³">
</form>



</script>
</body>
</html> -->