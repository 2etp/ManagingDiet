<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
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
</body>
</html>