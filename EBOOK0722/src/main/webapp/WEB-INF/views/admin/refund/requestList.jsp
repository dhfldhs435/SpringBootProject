<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h3 style="position: relative; right: 480px;">
	<spring:message code="refund.header.requestlist" />
</h3>
<table border="1">
	<tr>
		<th align="center" width="120"><spring:message code="sales.no" /></th>
		<th align="center" width="120"><spring:message code="member.id" /></th>
		<th align="center" width="240"><spring:message
				code="creation.title" /></th>
		<th align="center" width="180"><spring:message code="seller.id" /></th>
		<th align="center" width="160"><spring:message
				code="refund.requestdate" /></th>
		<th align="center" width="140"><spring:message
				code="refund.assortment" /></th>
		<th align="center" width="100"><spring:message
				code="refund.status" /></th>
	</tr>
	<c:choose>
		<c:when test="${empty reqeustList }">
			<tr>
				<td colspan="9"><spring:message code="common.listEmpty" /></td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${reqeustList}" var="reqeustList">
				<tr>
					<td align="center">${reqeustList.p_num }</td>
					<td align="center">${reqeustList.m_id }</td>
					<td align="center"><a
						href="/admin/refund/refundInfo?p_num=${reqeustList.p_num}">${reqeustList.e_title }</a></td>
					<td align="center">${reqeustList.s_nickname }(${reqeustList.s_id })</td>
					<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${reqeustList.p_refund_app_date }" /></td>
					<td align="center">${reqeustList.p_status }</td>
					<c:choose>
						<c:when test="${reqeustList.p_status eq 's_refuse' }">
							<td align="center">요청</td>
						</c:when>
						<c:otherwise>
							<td align="center">완료</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>

<br />

<script>
	var result = "${msg}";

	if (result === "SUCCESS") {
		alert("<spring:message code='common.processSuccess' />");
	}
</script>