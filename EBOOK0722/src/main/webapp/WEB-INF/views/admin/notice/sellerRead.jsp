<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2>
	<spring:message code="notice.header.seller.read" />
</h2>
<form:form modelAttribute="notice">
	<form:hidden path="sn_num" />

	<!-- 현재 페이지 번호와 페이징 크기 그리고 검색유형, 검색어를 숨겨진 필드 요소를 사용하여 전달한다. -->
	<input type="hidden" name="page" value="${pgrq.page}">
	<input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}">
	<input type="hidden" name="searchType" value="${pgrq.searchType}">
	<input type="hidden" name="keyword" value="${pgrq.keyword}">

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
			<td colspan="3"><form:input path="sn_title" size="80"
					readonly="true" /></td>
		</tr>
		<tr>
			<td><spring:message code="notice.content" /></td>
			<td align="center" colspan="3"><form:textarea path="sn_content"
					cols="80" rows="5" readonly="true" /></td>
		</tr>
		<tr>
			<td><spring:message code="notice.attachmentfile" /></td>
			<c:choose>
				<c:when test="${empty notice.sn_attachment_url }">
					<td colspan="3"><spring:message code="common.attachmentEmpty" /></td>
				</c:when>
				<c:otherwise>
					<td colspan="3"><a
						href="/notice/sellerdownload\?sn_num=${notice.sn_num }"><form:input
								path="sn_attachment_url" size="80" readonly="true" /></a></td>
				</c:otherwise>
			</c:choose>
		</tr>
	</table>
</form:form>
<div>
	<button type="submit" id="btnModify">
		<spring:message code="action.modify" />
	</button>
	<button type="submit" id="btnRemove">
		<spring:message code="action.remove" />
	</button>
	<button type="submit" id="btnList">
		<spring:message code="action.list" />
	</button>
</div>

<script>
	$(document).ready(function() {
		var formObj = $("#notice");
		
		// 현재 페이지 번호와 페이징 크기
		var pageObj = $("#page");
		var sizePerPageObj = $("#sizePerPage");
		var pageVal = pageObj.val();
		var sizePerPageVal = sizePerPageObj.val();

		$("#btnModify").on("click", function() {
			var sn_num = $("#sn_num");
			var sn_numVal = sn_num.val();
			self.location = "/notice/sellerModify?sn_num=" + sn_numVal;
		});
		$("#btnRemove").on("click", function() {
			formObj.attr("action", "/notice/sellerRemove");
			formObj.submit();
		});
		$("#btnList").on("click", function() {
			self.location = "/notice/sellerList";
		});
	});
</script>