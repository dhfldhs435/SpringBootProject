<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h3 style="position: relative; right: 500px;">
	<spring:message code="user.header.sellerList" />
</h3>
<table border="1">
	<tr>
		<th align="center" width="80"><spring:message code="user.no" /></th>
		<th align="center" width="150"><spring:message
				code="user.joindate" /></th>
		<th align="center" width="80"><spring:message code="user.id" /></th>
		<th align="center" width="80"><spring:message code="user.name" /></th>
		<th align="center" width="80"><spring:message code="user.age" /></th>
		<th align="center" width="80"><spring:message code="user.mail" /></th>
		<th align="center" width="120"><spring:message code="user.phone" /></th>
		<th align="center" width="160"><spring:message
				code="user.creationRegCnt" /></th>
		<th align="center" width="100"><spring:message
				code="user.totalSellCnt" /></th>
		<th align="center" width="80"><spring:message code="user.grade" /></th>
	</tr>
	<c:choose>
		<c:when test="${empty sellerList }">
			<tr>
				<td colspan="10"><spring:message code="common.listEmpty" /></td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${sellerList}" var="sellerList">
				<tr>
					<td align="center">${sellerList.s_num }</td>
					<td align="right"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${sellerList.s_join_date }" /></td>
					<td align="center">${sellerList.s_id }</td>
					<td align="center">${sellerList.s_name }</td>
					<td align="center">${sellerList.s_resident_num }</td>
					<td align="center">${sellerList.s_email }</td>
					<td align="center">${sellerList.s_phone }</td>
					<td align="center">${sellerList.creation_reg_cnt }</td>
					<td align="center">${sellerList.e_sell_cnt }</td>
					<td align="center">${sellerList.s_grade }</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>