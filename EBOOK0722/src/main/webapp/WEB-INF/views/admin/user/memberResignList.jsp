<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h3 style="position: relative; right: 420px;">
	<spring:message code="user.header.resignMemberList" />
</h3>
<table border="1">
	<tr>
		<th align="center" width="120"><spring:message code="user.no" /></th>
		<th align="center" width="160"><spring:message
				code="user.quitdate" /></th>
		<th align="center" width="100"><spring:message code="user.id" /></th>
		<th align="center" width="100"><spring:message
				code="user.nickname" /></th>
		<th align="center" width="100"><spring:message code="user.name" /></th>
		<th align="center" width="80"><spring:message code="user.age" /></th>
		<th align="center" width="200"><spring:message code="user.mail" /></th>
		<th align="center" width="120"><spring:message code="user.phone" /></th>
		<th align="center" width="200"><spring:message
				code="user.quitreason" /></th>
	</tr>
	<c:choose>
		<c:when test="${empty memberResignList }">
			<tr>
				<td colspan="9"><spring:message code="common.listEmpty" /></td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${memberResignList }" var="memberResignList">
				<tr>
					<td align="center">${memberResignList.m_num }</td>
					<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${memberResignList.m_quit_date }" /></td>
					<td align="center">${memberResignList.m_id }</td>
					<td align="center">${memberResignList.m_name }</td>
					<td align="center">${memberResignList.m_resident_num }</td>
					<td align="center">${memberResignList.m_mail }</td>
					<td align="center">${memberResignList.m_quit_reason }</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>