<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h3 style="position: relative; right: 565px;">
	<spring:message code="sales.header.salesstatus" />
</h3>

<!-- 검색 폼을 만든다. -->
<form:form modelAttribute="pgrq" method="get"
	action="salesStatus${pgrq.toUriStringByPage(1)}"
	cssStyle="position: relative; left: 460px;">
	<form:select path="searchType" items="${searchTypeCodeValueList}"
		itemValue="value" itemLabel="label" />

	<form:input path="keyword" />
	<button id="searchBtn">
		<spring:message code="action.search" />
	</button>
</form:form>
<br />
<table border="1">
	<tr>
		<th align="center" width="65"><spring:message code="creation.eno" /></th>
		<th align="center" width="150"><spring:message
				code="creation.regdate" /></th>
		<th align="center" width="80"><spring:message
				code="creation.category" /></th>
		<th align="center" width="320"><spring:message
				code="creation.title" /></th>
		<th align="center" width="100"><spring:message
				code="creation.nickname" /></th>
		<th align="center" width="120"><spring:message
				code="creation.price" /></th>
		<th align="center" width="100"><spring:message
				code="creation.sellcnt" /></th>
		<th align="center" width="100"><spring:message
				code="creation.refundcnt" /></th>
		<th align="center" width="120"><spring:message
				code="creation.total" /></th>
	</tr>
	<c:choose>
		<c:when test="${empty salesStatus }">
			<tr>
				<td colspan="9"><spring:message code="common.listEmpty" /></td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${salesStatus}" var="salesstatus">
				<tr>
					<td align="center">${salesstatus.e_num }</td>
					<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${salesstatus.e_reg_date }" /></td>
					<td align="center">${salesstatus.e_category }</td>
					<td align="center">${salesstatus.e_title }</td>
					<td align="center">${salesstatus.s_nickname }</td>
					<td align="center">${salesstatus.e_price }</td>
					<td align="center">${salesstatus.e_sell_cnt }</td>
					<td align="center">${salesstatus.e_refund_cnt }</td>
					<td align="center">${salesstatus.e_total }</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
<br />
<!-- 페이징 네비게이션 -->
<div>
	<c:if test="${pagination.prev }">
		<a href="${pagination.startPage - 1}">&laquo;</a>
	</c:if>

	<c:forEach begin="${pagination.startPage }"
		end="${pagination.endPage }" var="idx">
		<a href="/sales/salesStatus${pagination.makeQuery(idx)}">${idx}</a>
	</c:forEach>

	<c:if test="${pagination.next && pagination.endPage > 0}">
		<a href="${pagination.endPage + 1}">&raquo;</a>
	</c:if>
</div>