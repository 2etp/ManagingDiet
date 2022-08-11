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
		<c:forEach items="${foodList}" var="food"  varStatus="status">
			<label>	
			<input type="checkbox" name="foodList" id="checkbox${status.index}" value="${food.foodName}" onClick="itemSum(this.form); getCheckboxValue()">
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
		<input type="hidden" id="foodArr" name="food" value="">
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
	</form>
	
<script>

// 유저가 선택한 음식의 칼로리 합 구하기
	function itemSum(frm) {
		var kcal = "${idKey.userKcal}";
		var sum = 0;
		var count = frm.foodList.length;
		for(var i = 0; i < count; ++i) {
			if(frm.foodList[i].checked == true) {
				sum += parseInt(document.getElementsByTagName('span')[i].innerText);
				
				if(sum > kcal) {
					alert("일일칼로리를 초과하였습니다! 다시 선택해 주세요.");
					frm.foodList[i].checked == false;
				}
			}
		}
		 frm.sum.value = sum;
	
	}

	var sessionLength = sessionStorage.length;
		console.log("길이 :" + sessionLength);
	var foodArr = "";
	
	for(var i = 1; i <= sessionLength; ++i) {
		foodArr += sessionStorage.getItem("foodSession" + i);
		console.log("foodSession :" + sessionStorage.getItem("foodSession" + i));
	}
	
	var substringArr = foodArr.substring(0, foodArr.length - 1);
	console.log("substringArr: " + substringArr);
	var splitArr = substringArr.split(",");
	document.getElementById('foodArr').value = substringArr;
	
	// 세션에 저장돼 있는 체크박스 값들 페이징 후에도 유지
	$('input:checkbox[name="foodList"]').each(function() {
		if( splitArr.indexOf(this.value) > -1){  
			$(this).prop('checked', true); 
		}
	});

// 체크박스 값 가져오기
function getCheckboxValue()  {
	  // 선택된 목록 가져오기
	  const query = 'input[name="foodList"]:checked';
	  const selectedEls = 
	      document.querySelectorAll(query); 
	  
	  var num = "${pageMaker.cri.pageNum}";
	  var result = ""; 
		  selectedEls.forEach((el, i) => {
		 	 result += el.value + ',';
		  });
		  
	  // 체크박스 값 누적하여 세션에 저장
	  sessionStorage.setItem("foodSession" + num, result);
	  console.log("result :" + result);
	  
	  var sessionLength = sessionStorage.length;
		console.log("길이 :" + sessionLength);
	  var foodArr = "";

	  for(var i = 1; i <= sessionLength; ++i) {
		  foodArr += sessionStorage.getItem("foodSession" + i);
		  console.log("foodSession :" + sessionStorage.getItem("foodSession" + i));
	  }

	  var substringArr = foodArr.substring(0, foodArr.length - 1);
	  console.log("substringArr: " + substringArr);
	  document.getElementById('foodArr').value = substringArr;
	  var inputHidden = document.getElementById('foodArr').value;
	  console.log("inputHidden :" + inputHidden);
}

	// 페이징 처리
	let moveForm = $(".moveForm");
	let chkForm = $(".chkForm");
	
	$(".pageInfo a").on("click", function(e){
		e.preventDefault();
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "updateDiet.do");
		moveForm.submit();
	});
</script>
</body>
</html>