<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2>
	<spring:message code="notice.header.seller.register" />
</h2>
<form:form modelAttribute="notice" action="sellerRegister"
	enctype="multipart/form-data">
	<table>
		<tr>
			<td><spring:message code="notice.writer" /></td>
			<td align="left">${notice.sn_writer }</td>
			<td><form:hidden path="sn_writer" /></td>
		</tr>
		<tr>
			<td><spring:message code="notice.title" /></td>
			<td><form:input path="sn_title" /></td>
		</tr>
		<tr>
			<td><spring:message code="notice.content" /></td>
			<td><form:input path="sn_content" /></td>
		</tr>
		<tr>
			<td><spring:message code="notice.attachmentfile" /></td>
			<td><input type="file" name="snAttachment" /></td>
			<td></td>
		</tr>
	</table>
</form:form>

<div>
	<button type="submit" id="btnRegister">
		<spring:message code="action.register" />
	</button>
	<button type="submit" id="btnList">
		<spring:message code="action.list" />
	</button>
</div>

<script>
	$(document).ready(function() {
		var formObj = $("#notice");

		$("#btnRegister").on("click", function() {
			formObj.submit();
		});
		$("#btnList").on("click", function() {
			self.location = "/notice/sellerList";
		});
		
	});
</script>