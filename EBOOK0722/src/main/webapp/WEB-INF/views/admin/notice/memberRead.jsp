<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2>
	<spring:message code="notice.header.member.read" />
</h2>
<form:form modelAttribute="notice">
	<form:hidden path="mn_num" />
	
	<!-- 현재 페이지 번호와 페이징 크기 그리고 검색유형, 검색어를 숨겨진 필드 요소를 사용하여 전달한다. -->
	<input type="hidden" name="page" value="${pgrq.page}">
	<input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}">
	<input type="hidden" name="searchType" value="${pgrq.searchType}">
	<input type="hidden" name="keyword" value="${pgrq.keyword}">
	
	<table border="1">
		<tr>
			<td><spring:message code="notice.writer" /></td>
			<td align="left" width="270">${notice.mn_writer }</td>
			<td><spring:message code="notice.regdate" /></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
					value="${notice.mn_reg_date }" /></td>
		</tr>
		<tr>
			<td><spring:message code="notice.title" /></td>
			<td colspan="3"><form:input path="mn_title" size="80"
					readonly="true" /></td>
		</tr>
		<tr>
			<td><spring:message code="notice.content" /></td>
			<td align="center" colspan="3"><form:textarea path="mn_content"
					cols="80" rows="5" readonly="true" /></td>
		</tr>
		<tr>
			<td><spring:message code="notice.attachmentfile" /></td>
			<c:choose>
				<c:when test="${empty notice.mn_attachment_url }">
					<td colspan="3"><spring:message code="common.attachmentEmpty" /></td>
				</c:when>
				<c:otherwise>
					<td colspan="3"><a
						href="/notice/memberdownload\?mn_num=${notice.mn_num }"><form:input
								path="mn_attachment_url" size="80" readonly="true" /></a></td>
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
			var mn_num = $("#mn_num");
			var mn_numVal = mn_num.val();
			self.location = "/notice/memberModify?mn_num=" + mn_numVal;
		});
		$("#btnRemove").on("click", function() {
			formObj.attr("action", "/notice/memberRemove");
			formObj.submit();
		});
		$("#btnList").on("click", function() {
			self.location = "/notice/memberList";
		});
	});
</script>