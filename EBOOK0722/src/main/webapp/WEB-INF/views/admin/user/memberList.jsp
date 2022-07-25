<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h3 style="position: relative; right: 420px;">
	<spring:message code="user.header.memberList" />
</h3>
<table border="1">
	<tr>
		<th align="center" width="80"><spring:message code="creation.no" /></th>
		<th align="center" width="150"><spring:message
				code="creation.regdate" /></th>
		<th align="center" width="100"><spring:message code="creation.id" /></th>
		<th align="center" width="100"><spring:message
				code="creation.name" /></th>
		<th align="center" width="80"><spring:message code="user.age" /></th>
		<th align="center" width="200"><spring:message code="user.mail" /></th>
		<th align="center" width="120"><spring:message
				code="user.totalPayment" /></th>
		<th align="center" width="120"><spring:message
				code="user.purchaseCnt" /></th>
	</tr>
	<c:choose>
		<c:when test="${empty memberList }">
			<tr>
				<td colspan="8"><spring:message code="common.listEmpty" /></td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${memberList }" var="memberList">
				<tr>
					<td align="center">${memberList.m_num }</td>
					<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${memberList.m_join_date }" /></td>
					<td align="center">${memberList.m_id }</td>
					<td align="center">${memberList.m_name }</td>
					<td align="center">${memberList.m_resident_num }</td>
					<td align="center">${memberList.m_mail }</td>
					<td align="center">${memberList.totalPayment }</td>
					<td align="center">${memberList.purchase_cnt }</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>