<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>네 번째 단계</title>
</head>
<body>
	<h1>영양소에 맞는 칼로리 구성</h1>
	<ul>
		<li>탄수화물 : ${nutrients[0]}</li>
		<li>단백질 : ${nutrients[1]}</li>
		<li>지방 : ${nutrients[2]}</li>
	</ul>
		
	<form action="dietStep4.do" method="post">
		<input type="hidden" value="${nutrients[0]}">
		<input type="hidden" value="${nutrients[1]}">
		<input type="hidden" value="${nutrients[2]}">
		<input type="submit" value="4단계">
	</form>
</body>
</html>