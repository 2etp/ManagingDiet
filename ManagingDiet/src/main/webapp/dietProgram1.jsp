<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>
<meta charset="UTF-8">
<title>첫 번째 단계</title>
</head>
<body>

<main>
	<form action="insertInfo.do" method="post">
		<label for="sex">성별</label>
		<input id="sex" type="text" name="sex">
		
		<label for="height">신장</label>
		<input id="height" type="number" name="height">
		
		<label for="weight">체중</label>
		<input id="weight" type="number" name="weight">
		
		<label for="age">나이</label>
		<input id="age" type="number" name="age">
		
		<input type="submit" value="확인하기">
	</form>
</main>
</body>
</html>