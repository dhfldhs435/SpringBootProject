<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 구매 페이지</title>
</head>
<body>
	<table>
		<tr>
		<!-- 구매 페이지 -->
			<td><spring:message code="buy.buypage" /></td>
		</tr>
		<tr>
		<!-- 표지 이미지 -->
			<td><img src="cover?e_num=${ebook.e_num}"></td>
		<!-- 제목 -->
			<td><spring:message code="buy.title"/>${ebook.e_title}</td>
		<!-- 저자 -->
			<td><spring:message code="buy.writer"/>${ebook.e_writer}</td>
		</tr>
		<tr>
		<!-- 가격 -->
			<td><spring:message code="buy.price"/>${ebook.e_price}원</td>
		</tr>
		
		</table>
		<form:form modelAttribute="ebook" action="buy">
		<fieldset>
		<!-- 이용약관 동의 -->
			<legend><spring:message code="buy.termsandconditions"/></legend>
			
			<!-- 서비스 이용약관 -->
			<h2><spring:message code="buy.serviceagree"/>
			<input type="button" id="btnServiceAgree"><spring:message code="action.view"/>
			<input type="radio" /><spring:message code="action.agree"/></h2>
			
			<!-- 만14세이상 이용약관 -->	
			<h2><spring:message code="buy.fourteenagree"/>
			<input type="button" id="btnFourteenAgree"><spring:message code="action.view"/>
			<input type="radio" /><spring:message code="action.agree"/></h2>
			
			<!-- 개인정보 보호약관 -->
			<h2><spring:message code="buy.privatyagree"/>
			<input type="button" id="btnPrivatyAgree"><spring:message code="action.view"/>
			<input type="radio" /><spring:message code="action.agree"/></h2>
			
			<!-- 기타 등등 -->
			<h2><spring:message code="buy.agree"/>
			<input type="button" id="btnAgree"><spring:message code="action.view"/>
			<input type="radio" /><spring:message code="action.agree"/></h2>
			
		</fieldset>
		</form:form>
		
		<div>
		<spring:message code="buy.totalprice" />${ebook.e_price}원
		</div>
		
		<%-- <table>
		<tr>
		<!-- 구매하기 버튼 -->
		<td><a href="buySuccess?e_num=${ebook.e_num}" >구매</a></td>
		</tr>
		</table> --%>
		
		
		<table>
	<tr>
	<td><a href="buyForm?e_num=${ebook.e_num}" >구매</a></td>
	</tr>
		</table>
		<div>
		<!-- 구매하기 버튼 -->
		<%-- <button type="submit" id="btnBuy"><spring:message code="buy.buy" /></button>
		 --%>
		<!-- 돌아가기 버튼 -->
		<button type="submit" id="btnReset"><spring:message code="buy.reset" /></button>
	</div>
	
	<!-- 구매 스크립트 -->
	<script>
	$(document).ready(function(){
		
		var formObj=$("#ebook");
		
		//게시물 구매하기
		$("#btnBuy").on("click", function(){
			/* self.location="/ebook/buySuccess?e_num=${ebook.e_num}"; */
			formObj.submit();	
		});
		
		$("#btnReset").on("click", function(){
			location.href = "/";	
		});
	});
	</script>
	
	<!-- 이용약관 view 스크립트  -->
	<script>	
	
	$(document).ready(function(){
	
		//서비스 이용 약관 보기
		$("#btnServiceAgree").on("click", function(){
			window.open("serviceAgree", "서비스 이용 약관");
			button();
		});
		
		//만14세이상 이용 약관 보기
		$("#btnFourteenAgree").on("click", function(){
			window.open("fourteenAgree", "만14세이상 이용 약관");
			button();
		});
		
		//개인정보 보호 약관 보기
		$("#btnPrivatyAgree").on("click", function(){
			window.open("privatyAgree", "개인정보 보호 약관");
			button();
		});
		
		//기타 등등 약관 보기
		$("#btnAgree").on("click", function(){
			window.open("agree", "기타 등등 약관");
			button();
		});
	});
	</script>
</body>
</html>