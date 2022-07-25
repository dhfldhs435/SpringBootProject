<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2>
	<spring:message code="creation.header.deleteList" />
</h2>
<table border="1">
	<tr>
		<th align="center" width="80"><spring:message code="creation.no" /></th>
		<th align="center" width="80"><spring:message code="creation.id" /></th>
		<th align="center" width="80"><spring:message
				code="creation.nickname" /></th>
		<th align="center" width="120"><spring:message
				code="creation.phone" /></th>
		<th align="center" width="160"><spring:message
				code="creation.eno" /></th>
		<th align="center" width="80"><spring:message
				code="creation.category" /></th>
		<th align="center" width="320"><spring:message
				code="creation.title" /></th>
		<th align="center" width="120"><spring:message
				code="creation.thumbnail" /></th>
		<th align="center" width="150"><spring:message
				code="creation.deldate" /></th>
	</tr>
	<c:choose>
		<c:when test="${empty delList }">
			<tr>
				<td colspan="9"><spring:message code="common.listEmpty" /></td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${delList}" var="creationlist">
				<tr>
					<td align="center">${creationlist.s_num }</td>
					<td align="center">${creationlist.s_id }</td>
					<td align="center">${creationlist.s_nickname }</td>
					<td align="center">${creationlist.s_phone }</td>
					<td align="center">${creationlist.e_num }</td>
					<td align="center">${creationlist.e_category }</td>
					<td align="left">${creationlist.e_title }</td>
					<td align="center"><img
						src="display?e_num=${creationlist.e_num }"></td>
					<td align="right"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${creationlist.e_reg_date }" /></td>
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