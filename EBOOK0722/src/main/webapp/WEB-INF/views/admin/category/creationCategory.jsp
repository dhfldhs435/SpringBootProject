<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.5.1.min.js"></script>



<!-- ***카테고리 등록*** -->
<div class="container">



	<!-- ***카테고리 목록*** -->

	<h2>
		<spring:message code="category.header.list" />
		<!-- 카테고리 목록 메세지 -->
	</h2>



	<!-- 처리 성공 시 메세지 창 구현 -->
	<script>
		var result = "${msg}";
		if (result === "SUCCESS") {
			alert("<spring:message code='common.processSuccess' />");
		}
	</script>

	<!-- 카테고리 목록 내용 구현 -->
	<table class="table table-hover"
		style="text-align: center; border: 1px solid #dddddd">
		<tr>
			<th align="center" width="160"><spring:message
					code="category.categoryCode" /></th>
			<th align="center" width="160"><spring:message
					code="category.categoryName" /></th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="3"><spring:message code="common.listEmpty" /></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="category">
					<tr>
						<td align="center">${category.category_code}</td>
						<td align="center">${category.category_name}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>

	<!-- 카테고리 수정 select박스 클릭시 호출되는 select 이벤트 -->

	<!-- select박스를 클릭시 수정창으로 이동 / url창 링크 정보 -->
	<tr align="center" width="160">
		<spring:message code="category.revise" />
		<!-- 카테고리 수정 메세지 -->
		<c:if test="${!empty list}">
			<select onchange="if(this.value) location.href=(this.value);">
				<option value="">선택해주세요.</option>
				<c:forEach items="${list}" var="category">
					<option
						value="/admin/category/modify?category_code=${category.category_code}">
						${category.category_name}
				</c:forEach>
			</select>
		</c:if>
		<!-- codeGroup의 groupName 리스트를 아이템으로 가져온다.-->
	</tr>

	<br> <br> <br>


	<form:form modelAttribute="adminCategory" action="creationCategory">
		<div id="divToggle">
			<table>
				<tr>
					<td><spring:message code="category.categoryCode" /></td>
					<td><form:input path="category_code" /></td>
					<td><font color="red"><form:errors path="category_code" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="category.categoryName" /></td>
					<td><form:input path="category_name" /></td>
					<td><font color="red"><form:errors path="category_name" /></font></td>
				</tr>
			</table>
		</div>

	</form:form>

	<!-- (<div id=divToggle>)값 내용 보이게 하는 이벤트 버튼(속성1) -->
	<button type="submit" id="btnRegister" value="0">
		<spring:message code="category.header.register" />
	</button>
	<!-- (<div id=divToggle>)값 내용 전달하는 이벤트 버튼(속성2) -->
	<button type="submit" id="btnRegister2" value="0">
		<spring:message code="action.register" />
	</button>
</div>

<script>
	$(document).ready(function() {
		if ($("#btnRegister").val() == 0) {
			$("#btnRegister").val(1);
			$("#btnRegister2").css("display", "none");
		} else {
			$("#btnRegister").val(0);
		}

		var show = $("#divToggle").val();
		if (show == 1) {
			// Button 숨기기
			$("#divToggle").hide();
		} else {
			// Button 보이기
			$("#divToggle").show();
			$("#btnRegister2").css("display", "none");
		}
		$("#divToggle").toggle();
		$("#btnRegister").on("click", function() {
			$("#btnRegister").val(0);
			$("#divToggle").show();
			$("#btnRegister").hide();
			$("#btnRegister2").css("display", "block");
		});
	});
</script>

<!-- 등록 버튼(속성2) 클릭시 db값 전송 버튼 -->
<script>
	$(document).ready(function() {
		$("#btnRegister2").on("click", function() {
			var formObj = $("#adminCategory");
			formObj.submit(); // 내용 전송
		});
	});
</script>

<style type="text/css">
button {
	color: black;
	/*padding: 10px 10px;*/
	text-decoration: none;
	display: block;
}

button :hover {
	background-color: #ddd;
}
</style>
