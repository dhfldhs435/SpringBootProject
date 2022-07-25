<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2>
	<spring:message code="notice.header.seller.modify" />
</h2>
<form:form modelAttribute="notice" action="sellerModify"
	enctype="multipart/form-data">
	<form:hidden path="sn_num" />

	<!-- 현재 페이지 번호와 페이징 크기 그리고 검색유형, 검색어를 숨겨진 필드 요소를 사용하여 전달한다. -->
	<input type="hidden" name="page" value="${pgrq.page}">
	<input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}">
	<%-- 	<input type="hidden" name="searchType" value="${pgrq.searchType}">
	<input type="hidden" name="keyword" value="${pgrq.keyword}"> --%>

	<table border="1">
		<tr>
			<td><spring:message code="notice.writer" /></td>
			<td align="left" width="270">${notice.sn_writer }</td>
			<td><spring:message code="notice.regdate" /></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
					value="${notice.sn_reg_date }" /></td>
		</tr>
		<tr>
			<td><spring:message code="notice.title" /></td>
			<td colspan="3"><form:input path="sn_title" size="80" /></td>
		</tr>
		<tr>
			<td><spring:message code="notice.content" /></td>
			<td align="center" colspan="3"><form:textarea path="sn_content"
					cols="80" rows="5" /></td>
		</tr>
		<tr>
			<td><spring:message code="notice.attachmentfile" /></td>
			<td colspan="3"><input type="file" name="attachment" /></td>
		</tr>
	</table>
</form:form>

<div>
	<button type="submit" id="btnModify">
		<spring:message code="action.modify" />
	</button>
	<button type="submit" id="btnList">
		<spring:message code="action.list" />
	</button>
</div>

<script>
	$(document).ready(function() {
		var formObj = $("#notice");
		$("#btnModify").on("click", function() {
			formObj.submit();
		});
		$("#btnList").on("click", function() {
			self.location = "/notice/sellerList${pgrq.toUriString()}";
		});
	});
</script>