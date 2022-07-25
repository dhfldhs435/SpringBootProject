<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h3 style="position: relative; right: 210px;">
	<spring:message code="notice.header.seller.list" />
</h3>

<!-- 검색 폼을 만든다. -->
<form:form modelAttribute="pgrq" method="get"
	action="sellerList${pgrq.toUriStringByPage(1)}"
	cssStyle="position: relative; left: 178px;">
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
		<th align="center" width="80"><spring:message code="notice.no" /></th>
		<th align="center" width="320"><spring:message
				code="notice.title" /></th>
		<th align="center" width="150"><spring:message
				code="notice.regdate" /></th>
		<th align="center" width="80"><spring:message
				code="notice.writer" /></th>
	</tr>

	<c:choose>
		<c:when test="${empty noticeListS }">
			<tr>
				<td colspan="4"><spring:message code="common.listEmpty" /></td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${noticeListS}" var="notice">
				<tr>
					<td align="center">${notice.sn_num }</td>
					<!-- 게시글 상세보기할 때 페이징 요청 정보를 매개변수로 전달한다. -->
					<td align="left"><a
						href="sellerRead${pgrq.toUriString(pgrq.page)}&sn_num=${notice.sn_num }"><c:out
								value="${notice.sn_title }" /></a></td>
					<td align="right"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${notice.sn_reg_date }" /></td>
					<td align="center">${notice.sn_writer }</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>

<div style="position: relative; left: 300px">
	<a href="sellerRegister"><button type="button">
			<spring:message code="action.new" />
		</button></a>
</div>

<!-- 페이징 네비게이션 -->
<div>
	<c:if test="${pagination.prev }">
		<a href="${pagination.startPage - 1}">&laquo;</a>
	</c:if>

	<c:forEach begin="${pagination.startPage }"
		end="${pagination.endPage }" var="idx">
		<a href="/notice/sellerList${pagination.makeQuery(idx)}">${idx}</a>
	</c:forEach>

	<c:if test="${pagination.next && pagination.endPage > 0}">
		<a href="${pagination.endPage + 1}">&raquo;</a>
	</c:if>
</div>

<script>
	var result = "${msg}";

	if (result === "SUCCESS") {
		alert("<spring:message code='common.processSuccess' />");
	}
</script>