<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h3 style="position: relative; right: 500px;">
	<spring:message code="user.header.resignSellerList" />
</h3>
<table border="1">
	<tr>
		<th align="center" width="80"><spring:message code="creation.no" /></th>
		<th align="center" width="150"><spring:message
				code="creation.regdate" /></th>
		<th align="center" width="80"><spring:message code="creation.id" /></th>
		<th align="center" width="80"><spring:message
				code="creation.name" /></th>
		<th align="center" width="80"><spring:message code="user.age" /></th>
		<th align="center" width="80"><spring:message code="user.mail" /></th>
		<th align="center" width="120"><spring:message
				code="creation.phone" /></th>
		<th align="center" width="160"><spring:message
				code="user.creationRegCnt" /></th>
		<th align="center" width="100"><spring:message
				code="user.totalSellCnt" /></th>
		<th align="center" width="80"><spring:message code="user.grade" /></th>
	</tr>
	<c:choose>
		<c:when test="${empty sellerResignList }">
			<tr>
				<td colspan="10"><spring:message code="common.listEmpty" /></td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${sellerResignList}" var="sellerResignList">
				<tr>
					<td align="center">${sellerResignList.s_num }</td>
					<td align="right"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${sellerResignList.s_join_date }" /></td>
					<td align="center">${sellerResignList.s_id }</td>
					<td align="center">${sellerResignList.s_name }</td>
					<td align="center">${sellerResignList.s_resident_num }</td>
					<td align="center">${sellerResignList.s_email }</td>
					<td align="center">${sellerResignList.s_phone }</td>
					<td align="center">${sellerResignList.creation_reg_cnt }</td>
					<td align="center">${sellerResignList.e_sell_cnt }</td>
					<td align="center">${sellerResignList.s_grade }</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>