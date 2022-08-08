<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>내 식단 수정하기</title>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<style>
 .pageInfo{
  	list-style : none;
  	display: inline-block;
    margin: 50px 0 0 100px;  	
 }
  
 .pageInfo li{
  	float: left;
    font-size: 20px;
    margin-left: 18px;
    padding: 7px;
    font-weight: 500;
 }
  
 a:link {color:black; text-decoration: none;}
 a:visited {color:black; text-decoration: none;}
 a:hover {color:black; text-decoration: underline;}
 
.active{
 	background-color: #cdd5ec;
</style>
</head>
<body>
	<h1>음식 추천 리스트</h1>
	
	<form action="updateDiet.do" method="post" name="frm" class="chkForm">
		<c:forEach items="${foodList}" var="food" varStatus="status">
			<label>	
			<input type="checkbox" name="food" id="checkbox${status.index}" value="${food.foodName}" onClick="itemSum(this.form); addCookie('foodName', '${food.foodName}')">
				<div id="list-wrap">
					<img src="image/${food.imgPath}" width="300px" height="300px">
					<p>음식명 : ${food.foodName}</p>
					<p>칼로리 : <span id="foodCalorie">${food.foodCalorie}</span>kcal</p>
					<p>탄수화물 : ${food.foodCarbs}g</p>
					<p>단백질 : ${food.foodProtein}g</p>
					<p>지방 : ${food.foodFat}g</p>
				</div>
				<br>
			</label>
	
		</c:forEach>
		
		칼로리 합계 <input type="text" name="sum" id="sum" readonly><br><br>

		<input type="hidden" name="id" value="${idKey.id}">
		<input type="submit" value="식단 수정하기">

	</form>
	
	<div class="pageInfo_wrap" >
		<div class="pageInfo_area">
			<ul id="pageInfo" class="pageInfo">
				<c:if test="${pageMaker.prev}">
					<li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
				</c:if>
			
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
				</c:forEach>
				
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
		<input type="hidden" id="foodArr" name="food" value="">
	</form>
	
	<input type="hidden" class="foodArr" value="${foodArr}">
	<c:forEach items="${foodArr}" var="arr">
		<p>${arr}</p>	
	</c:forEach>
	
<script>

// 유저가 선택한 음식의 칼로리 합 구하기
function itemSum(frm) {
	var kcal = "${idKey.userKcal}";
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

//쿠키 불러오기 함수
function getCookie(Name) {
	
	Name = Name + '=';

	var cookieData = document.cookie;
	var start = cookieData.indexOf(Name);
	var cValue = ';' 
	
	if(start != -1) {
		// 'courseCode='의 길이만큼 추가
		start += Name.length;

		// ';'가 없기 때문에 변수 end는 -1이 나옴
		var end = cookieData.indexOf(';', start);

		if(end == -1)
			// 'courseCode=과목코드'까지의 길이를 변수 end에 할당
			end = cookieData.length;
		// 'courseCode='이후부터 실제 과목코드까지 자름
		// 결국 과목코드만 cValue에 남게 됨
		Value = cookieData.substring(start, end);
		console.log("Value: " + Value);

	}
	
	return unescape(Value);
}

//쿠키 더미 생성 함수
function addCookie(Name, Value) {
	var expire = new Date(); 
	expire.setDate(expire.getDate()); 
	let foodName;
	for(i = 0; i < 10; ++i) {
		var checkbox = document.getElementById('checkbox' + i);
		console.log(checkbox);
		var is_checked = checkbox.checked;
		console.log("체크 유뮤 : " +is_checked);
	
	// 쿠키가 존재하지 않을 때 new 쿠키 생성
	if (document.cookie.indexOf('foodName=') == -1 && is_checked == true) {
		foodName = Name + '=' + escape(Value) + '; path=/ ';
		console.log("new " + foodName);
	} else if (document.cookie.indexOf('foodName=') != -1 && is_checked == true) {
		// 쿠키가 존재하면 getCookie 함수를 통해 과목코드 가져옴
		let foodCookie = getCookie("foodName");
		console.log("foodCookie: " + foodCookie);
		let arr = foodCookie.split(";");
		console.log("arr(" + arr.length + "): " + arr);
		
		console.log("before: " + foodCookie);
		foodCookie += ";" + Value;
		console.log("after: " + foodCookie);
		foodName = 'foodName=' + escape(foodCookie) + '; path=/ ';
		console.log("add: " + foodName);
    } else if (document.cookie.indexOf('foodName=') != -1 && is_checked == false) {
    	let foodCookie = getCookie("foodName");
		console.log("foodCookie: " + foodCookie);

		let arr = foodCookie.split(";");
		console.log("arr(" + arr.length + "): " + arr);
		
		let newValue = foodCookie.replace(Value, "");
		console.log("새 값 : " + newValue);
		
		console.log("before: " + foodCookie);
    	//foodCookie -= ";" + Value;
	    //console.log("체크해제 시 after: " + newValue);
	    foodName = 'foodName=' + escape(newValue) + '; path=/ ';
    }
	
	// 쿠키 생성 코드
	document.cookie = foodName; 
	}
}


// 체크박스 값 가져오기
function getCheckboxValue()  {
	  // 선택된 목록 가져오기
	  const query = 'input[name="food"]:checked';
	  const selectedEls = 
	      document.querySelectorAll(query);
	  
	  // 선택된 목록에서 value 찾기
	  let result = '';
	  selectedEls.forEach((el) => {
	    result += el.value + ',';
	  });
	  
	  // hidden 타입의 input에 value 추가
	  document.getElementById('foodArr').value = result;
}

// 페이징 처리
let moveForm = $(".moveForm");

$(".pageInfo a").on("click", function(e){
	e.preventDefault();
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	moveForm.attr("action", "updateDiet.do");
	moveForm.submit();
});
</script>
</body>
</html>