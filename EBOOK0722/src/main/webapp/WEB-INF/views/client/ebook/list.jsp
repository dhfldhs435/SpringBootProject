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


	<table>
		<tr>
			<th align="center" width="10" height="10">표지</th>
			<th align="center" width="150">제목</th>
			<th align="center" width="150">저자</th>
			<th align="center" width="280">등록일시</th>
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
						<td align="center"><img src="cover?e_num=${ebook.e_num}"
							width="100"></td>
						<td align="center"><a href="ebook/read?e_num=${ebook.e_num}">
								${ebook.e_title}</a></td>
						<td align="center">${ebook.e_writer}</td>
						<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${ebook.e_reg_date}" /></td>



					</tr>

				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>

</body>
</html>



