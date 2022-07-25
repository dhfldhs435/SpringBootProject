<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매내역 페이지</title>
</head>
<body>
	<!-- 상단 메시지 -->
	<h2>판매내역</h2>
	<table border="1" align="center">
		<tr>
			<!-- 구매 상품 번호 -->
			<th align="center" width="80">결제번호</th>

			<!-- 구매 상품 제목 -->
			<th align="center" width="150"><spring:message
					code="download.title" /></th>

			<!-- 구매 일시 -->
			<th align="center" width="150"><spring:message
					code="download.buydate" /></th>

			<!-- 판매금액 -->
			<th align="center" width="150">판매금액</th>

			<!-- 판매금액 -->
			<th align="center" width="100">비고</th>



		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="5">
						<!-- 구매 상품 없을시 메시지 출력 --> <spring:message code="download.empty" />
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="purchase">
					<tr>
						<!-- 구매 일련번호 -->
						<td align="center">${purchase.p_num}</td>

						<!-- 제목 -->
						<td align="center">${purchase.e_title}</td>

						<!-- 구 매 일시 -->
						<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${purchase.p_reg_date}" /></td>

						<!-- 판매금액 -->
						<td align="center">${purchase.e_price}원</td>

						<!-- 비고 -->
						<td align="center"><c:if
								test="${purchase.p_status == 'refundApply'}">
								 환불접수
							</c:if> <c:if test="${purchase.p_status == 's_refuse'}">심의중</c:if> <c:if
								test="${purchase.p_status == 'refundApproval'}">환불완료</c:if></td>



					</tr>

				</c:forEach>
			</c:otherwise>

		</c:choose>
	</table>

</body>
</html>