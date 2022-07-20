<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8" />
</head>
<body>
	<h1>음식 추천 리스트</h1>
	
	<c:forEach items="${foodList}" var="food">
		<p>${food.foodName}</p>
	</c:forEach>
</body>
</html>