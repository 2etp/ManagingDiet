<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main Page</title>

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
		<h1>게시판 프로그램</h1>
		<hr>
		<a href="login.do">로그인</a><br>
		<br>
		<br> <a href="getBoardList.do">글 목록 바로가기</a>
		<hr><br>
		<a href="signup.do">회원가입</a>
		<br><br>
		<a href="dietCategory.jsp">식단 프로그램</a>
		<br><br>
		<a href="myPage.jsp">마이페이지</a>
	</center>
</body>
</html>