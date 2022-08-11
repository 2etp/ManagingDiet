<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html lang="KO" >
<head>
  <meta charset="UTF-8">
  <title>내 식단 확인하기</title>
<link href="https://fonts.googleapis.com/css2?family=Shrikhand&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/typing.css">
<link rel="stylesheet" href="./css/step4.css">
<link rel="stylesheet" href="./css/navi.css">
<link rel="stylesheet" href="./css/login.css">
<link rel="stylesheet" href="./css/common.css">
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<!-- icon -->
<script src="https://kit.fontawesome.com/a3dc88dac3.js" crossorigin="anonymous"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.0/gsap.min.js'></script>
<script src='https://assets.codepen.io/16327/Flip.min.js'></script>
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
            <p>${idKey.name}님 환영합니다!</p>
            <a class="signin" href="./myPage.jsp" >My page</a><br><br>
            <a id="rainbow-btn" class="signin" href="logout.do" >Logout</a>
          </c:if>
        </li>
				
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

  <!-- title -->
  <div class="wrap ten">
    <span class="letter">내</span>
    <span class="letter">가</span>
    <span class="space"></span>
    <span class="letter">선</span>
    <span class="letter">택</span>
	<span class="letter">한</span>
    <span class="space"></span>
    <span class="letter">음</span>
    <span class="letter">식</span>
	<span class="space"></span>
    <span class="letter">리</span>
    <span class="letter">스</span>
    <span class="letter">트</span>
    <span><hr></span>
  </div>

    <!-- card img -->
    <div class="main-container">
    <div class="main">
		<form action="insertFood.do" method="post" name="frm" class="form1">
			<c:forEach items="${dietList}" varStatus="status" var="food">
				<div class='cards'>
					<!-- line 1 -->
						<div class="card-line">
						<div class='card' data-card>
							<div class='card__inner'>
							<div class='card__image'>
								<img id="img-btn" src='image/${food.imgPath}' alt='The Fountain' />
							</div>
							</div>
						<div class="food-name">${food.foodName}</div>
						</div>              
					</div>
				</div>

            
          
          <!-- plus-img inner content -->
			<div class='content'>
				<div class='content__group'>
					<p class='content__heading'>${food.foodName}</p>
					<p class='content__category'>칼로리 : <span id="foodCalorie">${food.foodCalorie}</span>kcal</p>
					<p class='content__description'>
						탄수화물 : ${food.foodCarbs}g <br>
						단백질 : ${food.foodProtein}g <br>
						지방 : ${food.foodFat}g
					</p>
				</div>
			</div>     
		</c:forEach>

		</form>
  </div>
</div>
<a class="update-btn" href="updateDiet.do">
	<button class="learn-more">수정하기</button>
</a>


		<!-- paging Number -->
		<div class="pageInfo_wrap" >
			<div class="pageInfo_area">
				<ul id="pageInfo" class="pageInfo">
				
					<!-- 이전페이지 버튼 -->
					<c:if test="${pageMaker.prev}">
						<li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
					</c:if>
					
					<!-- 각 번호 페이지 버튼 -->
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
					</c:forEach>
					
					<!-- 다음페이지 버튼 -->
					<c:if test="${pageMaker.next}">
						<li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
					</c:if>	
					
				</ul>
			</div>
		</div>
    
	<form class="moveForm" method="get">	
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="userCarbs" value="${idKey.userCarbs}">
		<input type="hidden" name="userProtein" value="${idKey.userProtein}">
		<input type="hidden" name="userFat" value="${idKey.userFat}">
	</form>


    

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
	// 유저가 선택한 음식의 칼로리 합 구하기
	function itemSum(frm) {
	var kcal = "${kcal}";
	var sum = 0;
	var count = frm.food.length;
	for(var i = 0; i < count; ++i) {
		if(frm.food[i].checked == true) {
			sum += parseInt(document.getElementsByTagName('span')[i].innerText);
			
			if(sum > kcal) {
				alert("일일칼로리를 초과하였습니다! 다시 선택해 주세요.");
				frm.food[i].checked == false;
			}
		}
	}
		frm.sum.value = sum;

	}

	// 페이징 처리
	let moveForm = $(".moveForm");

	$(".pageInfo a").on("click", function(e){
	e.preventDefault();
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	moveForm.attr("action", "dietStep4.do");
	moveForm.submit();	
	});
</script>

<script src="./js/navi.js"></script>
<script src="./js/index.js"></script>

<!-- 로그인 js -->
<script src="./js/login.js"></script>
<!-- egg Toggle -->
<script src="./js/eggToggle.js" ></script>
<!-- Submit Button -->
<script src="./js/plusImg.js"></script>
<!-- number paging -->
<script src="./js/numberPaging.js"></script>
<!-- background Animation -->
<script src="./js/backgroundAnimation.js"></script>


</body>
</html>


<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>내 식단 확인하기</title>
</head>
<body>
<h1>내가 선택한 음식 리스트</h1>

<c:forEach items="${dietList}" var="food">
	<div>
		<img src="image/${food.imgPath}" width="300px" height="300px">
		<p>음식명 : ${food.foodName}</p>
		<p>칼로리 : ${food.foodCalorie}kcal</p>
		<p>탄수화물 : ${food.foodCarbs}g</p>
		<p>단백질 : ${food.foodProtein}g</p>
		<p>지방 : ${food.foodFat}g</p>
	</div>
	<br>
</c:forEach>

<a href="updateDiet.do">수정하기</a>
</body>
</html> -->