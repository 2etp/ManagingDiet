<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>일일 미션 체크</title>
</head>
<body>

<h1>일일 미션 도장 찍자~</h1>
<form action="stampMission.do" method="post">
	<c:forEach var="i" begin="1" end="${lengthOfMon}" >
		<label><input type="checkbox" name="stamp" value="${idKey.id}"><c:out value="${i}"/></label>
	</c:forEach>
	
	<input type="submit" value="도장 찍기">
</form>
</body>
</html>