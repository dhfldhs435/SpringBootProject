<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

.accordion {
background-color: #eee;
color: #444;
cursor: pointer;
width: 100%;
height:60px;
text-align:center;
border: none;
outline:  none;
transition: 0.4s;
}
.active, .accordion:hover {
background-color: #ccc;
}

.panel {
padding:  0 18px;
background-color: white;
display: none;
overflow: hidden;
}
</style>
</head>
<body>

<h2>판매자 가이드</h2>

<button class="accordion">Section 1</button>
<div class="panel">
<spring:message code="sfaq.mes1"/>
</div>

<button class="accordion">Section 2</button>
<div class="panel">
<p>ssssss</p>
<spring:message code="sfaq.mes2"/>
</div>

<button class="accordion">Section 3</button>
<div class="panel">
<spring:message code="sfaq.mes3"/>
</div>

<button class="accordion">Section 4</button>
<div class="panel">
<p>ssssss</p>
<spring:message code="sfaq.mes4"/>
</div>

<button class="accordion">Section 5</button>
<div class="panel">
<p>ssssss</p>
<spring:message code="sfaq.mes2"/>
</div>

<button class="accordion">Section 6</button>
<div class="panel">
<p>ssssss</p>
<spring:message code="sfaq.mes2"/>
</div>

<button class="accordion">Section 7</button>
<div class="panel">
<p>ssssss</p>
<spring:message code="sfaq.mes2"/>
</div>

<button class="accordion">Section 8</button>
<div class="panel">
<p>ssssss</p>
<spring:message code="sfaq.mes2"/>
</div>

<button class="accordion">Section 9</button>
<div class="panel">
<p>ssssss</p>
<spring:message code="sfaq.mes2"/>
</div>

</body>
<script>
var acc = document.getElementsByClassName("accordion");//아코디언클래스리스트를가져온다.
var i;

for (i = 0; i < acc.length; i++){
	acc[i].addEventListener("click",function(){
		this.classList.toggle("active");
		
		var panel = this.nextElementSibling;
		
		if (panel.style.display === "block") {
			panel.style.display = "none";
		}else {
			panel.style.display = "block";
		}
	});
}

</script>
</html>