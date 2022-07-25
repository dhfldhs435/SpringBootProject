<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<h2>문의 등록</h2>
<form:form modelAttribute="sellerBoard" action="sellerBoardRegister"
	enctype="multipart/form-data">

	<form:hidden path="s_num" />

	<table>
		<tr>



		</tr>

		<tr>

			<td>작성자 아이디</td>

			<td><sec:authentication property="principal.username" /></td>
		</tr>

		<tr>

			<td>제목</td>

			<td><form:input path="sb_title" size="38" /></td>
			<td><font color="red"><form:errors path="sb_title" /></font></td>
		</tr>



		<tr>

			<td>내용</td>
			<td><form:textarea path="sb_content" cols="40" rows="20"
					resize="none" /></td>
			<td><font color="red"><form:errors path="sb_content" /></font></td>
		</tr>


		<tr>

			<td>첨부파일</td>
			<td><form:input path="sb_attachmentFile" type="file" /></td>
		</tr>



	</table>
	<br>
	<div>
		<sec:authorize access="isAuthenticated()">
			<button type="submit" id="btnRegister">등록하기</button>
		</sec:authorize>
		<button type="submit" id="btnList">리스트</button>
	</div>




</form:form>



<script>
	$(document).ready(function() {
		var formObj = $("#sellerBoard");

		$("#btnRegister").on("click", function() {
			formObj.submit();
		});

		$("#btnList").on("click", function() {
			self.location = "sellerBoardList";
		});
	});
</script>