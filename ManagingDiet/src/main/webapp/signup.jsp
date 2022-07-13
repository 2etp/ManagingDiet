<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

<main>
	<form action="signup.do" method="post">
		<label for="id">아이디</label>
		<input id="id" type="text" name="id">
		
		<label for="pw">비밀번호</label>
		<input id="pw" type="password" name="password">
		
		<label for="name">이름</label>
		<input id="name" type="text" name="name">
		
		<label for="job">휴대폰번호</label>
		<input id="job" type="text" name="mobile">
		
		<input type="submit" value="가입하기">
		<input type="reset" value="취소">
	</form>
	

</main>
</body>
</html>