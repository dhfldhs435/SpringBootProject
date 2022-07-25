<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<form:form modelAttribute="memberBoard" action="memberBoardRegister"
	enctype="multipart/form-data">
	<form:hidden path="m_num"/>
	<table>
		<tr>

			<td><spring:message code="mb.register" /></td>

		</tr>
		
		<tr>

			<td>작성자 아이디</td>

			<td><sec:authentication property="principal.username" /></td>
		</tr>

		<tr>

			<td><spring:message code="mb.title" /></td>

			<td><form:input path="mb_title" size="58" /></td>
			<td><font color="red"><form:errors path="mb_title" /></font></td>
		</tr>



		<tr>

			<td><spring:message code="mb.content" /></td>
			<td><form:textarea path="mb_content" cols="60" rows="40"
					resize="none" /></td>
			<td><font color="red"><form:errors path="mb_content" /></font></td>
		</tr>


		<tr>

			<td><spring:message code="mb.AttachmentFile" /></td>
			<td><form:input path="mb_attachmentFile" type="file" /></td>
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
		var formObj = $("#memberBoard");

		$("#btnRegister").on("click", function() {
			formObj.submit();
		});

		$("#btnList").on("click", function() {
			self.location = "memberBoardList";
		});
	});
</script>