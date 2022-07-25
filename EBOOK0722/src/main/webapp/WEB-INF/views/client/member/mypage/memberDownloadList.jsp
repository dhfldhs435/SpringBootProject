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
<title>회원 게시물 다운로드 페이지</title>
</head>
<body>
	<!-- 상단 메시지 -->
	<h2>
		<spring:message code="download.header" />
	</h2>
	<table border="1">
		<tr>
			<!-- 구매 상품 번호 -->
			<th align="center" width="80"><spring:message
					code="download.num" /></th>

			<!-- 구매 상품 제목 -->
			<th align="center" width="150"><spring:message
					code="download.title" /></th>

			<!-- 구매 일시 -->
			<th align="center" width="150"><spring:message
					code="download.buydate" /></th>

			<!-- 다운로드 링크 -->
			<th align="center" width="150"><spring:message
					code="download.link" /></th>

			<!-- 평점 -->
			<th align="center" width="80"><spring:message
					code="download.rating" /></th>

			<!-- 경과일 -->
			<th align="center" width="80">경과일</th>

			<!-- 환불신청 -->
			<th align="center" width="80">환불 신청</th>

		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="7">
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
						<td align="left">${purchase.e_title}</td>

						<!-- 구 매 일시 -->
						<td align="right"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${purchase.p_reg_date}" /></td>

						<!-- 다운로드 링크 -->
						<td align="center"><a
							href="/purchase/download\?p_num=${purchase.p_num}">DOWNLOAD</a></td>

						<!-- 평점 -->

						<td align="center">
							<form action="modify" method="post">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="hidden" name="p_num"
									value="${purchase.p_num}" /> <select name="e_rating">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select> <input name="e_num" value="${purchase.e_num}" type="hidden" />
								<c:if test="${purchase.p_status == 'purchaseConfirmation'}">
									<input type="submit" value="등록" />
								</c:if>
							</form>
						</td>

						<!-- 경과일 -->

						<td align="center">${purchase.elapsedDays}일</td>

						<!-- 환불신청 -->

						<td align="center"><c:if
								test="${purchase.p_status == 'purchaseSuccess' && purchase.elapsedDays < 7}">
								<a href="/purchase/refund?p_num=${purchase.p_num}">환불신청</a>
							</c:if> <c:if
								test="${purchase.p_status == 'purchaseConfirmation' || purchase.p_status == 'ratingComplate' || purchase.elapsedDays > 7}">
								환불불가
							</c:if></td>


					</tr>
				</c:forEach>
			</c:otherwise>

		</c:choose>
	</table>

</body>


</html>