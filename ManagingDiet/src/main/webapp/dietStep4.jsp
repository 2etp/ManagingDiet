<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>네 번째 단계</title>

<style>
body, html {
  display: flex;
  justify-content: center;
  margin: 0;
  height: 100%;
  text-align: center;
  font-family: 'Oxygen Mono', monospace;
  color: black;
}

h1 {
  text-transform: uppercase;
  letter-spacing: 1pt;
  font-size: 30pt;
  margin-bottom: 15px;
}

p {
  text-align: left;
  margin: 0;
  text-transform: lowercase;
  font-size: 10pt;
  font-weight: 900;
  width: 50%;
  display: none;
}

#table {
  display: table;
  width: 100%;
  height: 100%;
}

#centeralign {
  display: table-cell;
  vertical-align: middle;
}

</style>

</head>
<body>

<div class="main">
   <div id="table">
      <div id="centeralign">
        <h1>영양소에 맞는 칼로리 구성</h1>
        <p>탄수화물: ${nutrients[0]}</p>
        <p>단백질: ${nutrients[1]}</p>
        <p>지방: ${nutrients[2]}</p>
      </div>
   </div>
</div>

	
<form action="dietStep4.do" method="post">
	<input type="hidden" name="carbs" value="${nutrients[0]}">
	<input type="hidden" name="protein" value="${nutrients[1]}">
	<input type="hidden" name="fat" value="${nutrients[2]}">
	<input type="submit" value="4단계">
</form>


<script>
function typeEffect(element, speed) {
    var text = element.innerHTML;
    element.innerHTML = "";

    var i = 0;
    var timer = setInterval(function () {
        if (i < text.length) {
            element.append(text.charAt(i));
            i++;
        } else {
            clearInterval(timer);
        }
    }, speed);
}


// application
var speed = 75;
var h1 = document.querySelector('h1');
var p = document.querySelectorAll('p');
var delay = h1.innerHTML.length * speed + speed;

// type affect to header
typeEffect(h1, speed);


// type affect to body
setTimeout(function () {
    for (let i = 0; i < p.length; i++) { // aTag 만큼 반복
        setTimeout(function () {
            p[i].style.display = "inline-block";
            typeEffect(p[i], speed);
        }, 1000);

    }


}, delay);

</script>
</body>
</html>