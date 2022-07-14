<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>두 번째 단계</title>
</head>
<body>
	<p>현재 사용자의 기초대사량은 ${bmr}입니다. 이 돼지새끼야</p>
	
	
	<form action="dietStep2.do" metion="post">
		<h2>활동량</h2>
		<label for="activityAmount1"><input id="activityAmount1" type="radio" name="activityAmount" value="few">거의 없다(거의 좌식생활울 하고 운동 안 함)</label>
		<label for="activityAmount2"><input id="activityAmount2" type="radio" name="activityAmount" value="afew">조금 있다(활동량이 보통이거나 주 1-3회 운동)</label>
		<label for="activityAmount3"><input id="activityAmount3" type="radio" name="activityAmount" value="normal">보통(활동량이 다소 많거나 주 3-5회 운동)</label>
		<label for="activityAmount4"><input id="activityAmount4" type="radio" name="activityAmount" value="quite">꽤 있다(활동량이 많거나, 주 6-7회 운동)</label>
		<label for="activityAmount5"><input id="activityAmount5" type="radio" name="activityAmount" value="alot">아주 많다(활동량이 매우 많거나, 거의 매일 하루 2번 운동)</label>
	
		<input type="hidden" name="bmr" value="${bmr}">
		
		<input type="submit" value="2단계">
	</form>
</body>
</html>