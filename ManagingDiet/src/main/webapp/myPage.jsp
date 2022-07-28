<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
<p>아이디 : ${idKey.id }</p>
<p>이름 : ${idKey.name }</p>
<p>휴대폰 번호 : ${idKey.mobile }</p>

<a href="myDiet.do">내 식단 확인하기</a>
<br><hr><br>
<a href="stampMission.do">일일 미션 체크</a>
<br><hr><br>
<a href="statistics.do">나의 목표 달성도</a>
</body>
</html>