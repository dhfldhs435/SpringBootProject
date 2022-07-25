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
<title>게시물 리스트</title>
</head>
<body>
	<h2>정산 관리</h2>

	<table>
		<tr>
			<th align="center" width="80">표지</th>
			<th align="center" width="80">제목</th>
			<th align="center" width="150">등록일시</th>
			<th align="center" width="80">판매수량</th>
			<th align="center" width="80">환불수량</th>
			<th align="center" width="100">판매금액</th>
		</tr>
		<c:choose>
			<c:when test="${empty ebookList }">
				<tr>
					<td>게시물 목록이 비어있습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${ebookList}" var="ebook">
					<tr>
						<td align="center"><img
							src="/ebook/cover?e_num=${ebook.e_num}" width="100"></td>
						<td align="center"><a href="read?e_num=${ebook.e_num}">
								${ebook.e_title}</a></td>
						<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${ebook.e_reg_date}" /></td>
						<td align="center">${ebook.e_sell_cnt}권</td>
						<td align="center">${ebook.e_refund_cnt}권</td>

						<td align="center">${(ebook.e_sell_cnt * ebook.e_price) - (ebook.e_refund_cnt * ebook.e_price)}원</td>


					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<h2>익월 정산 예정 내역</h2>
	<table>
		<tr>

			<th align="center" width="100">총 판매수량</th>
			<th align="center" width="150">총 판매금액</th>
			<th align="center" width="150">총 환불금액</th>
			<th align="center" width="150">정산예정금액</th>
		</tr>
		<c:choose>
			<c:when test="${empty ebookList }">
				<tr>
					<td>게시물 목록이 비어있습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:set var="cnt_sum" value="0" />
				<c:set var="sale_sum" value="0" />
				<c:set var="refund_sum" value="0" />
				<c:forEach items="${ebookList}" var="ebook">

					<c:set var="cnt_sum" value="${cnt_sum + ebook.e_sell_cnt}" />

					<c:set var="sale_sum"
						value="${(ebook.e_sell_cnt * ebook.e_price) + sale_sum}" />

					<c:set var="refund_sum"
						value="${(ebook.e_refund_cnt * ebook.e_price) + refund_sum}" />
				</c:forEach>
				<tr>
					<td align="center">${cnt_sum}권</td>

					<td align="center">${sale_sum}원</td>

					<td align="center">${refund_sum}원</td>

					<td align="center">${(sale_sum - refund_sum) * 0.85}원</td>


				</tr>

			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>



