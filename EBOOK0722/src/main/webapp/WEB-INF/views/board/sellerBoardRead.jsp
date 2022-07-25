<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시물 상세보기</h2>


	<table align="center">
		<tr>
			<td>작성자</td>
			<td><sec:authentication property="principal.username" /></td>

		</tr>

		<tr>

			<td>작성일</td>
			<td>${sellerBoard.sb_reg_Date}</td>
		</tr>


		<tr>
			<td>게시물일련번호</td>
			<td>${sellerBoard.sb_num}<input id="sb_num" type="hidden"
				value="${sellerBoard.sb_num}">
			</td>

		</tr>

		<tr>
			<td>게시물 제목</td>
			<td>${sellerBoard.sb_title}</td>

		</tr>

		<tr>
			<td>게시물 내용</td>
			<td>${sellerBoard.sb_content}</td>

		</tr>

		<tr>
			<td>첨부파일</td>
			<c:if test="display?sb_num=${sellerBoard.sb_num } != null">
				<td><img src="display?sb_num=${sellerBoard.sb_num} "
					width="210" height="180"></td>
			</c:if>
		</tr>
	</table>


	<div>


		<sec:authorize access="hasRole('ROLE_MEMBER')">
			<button type="submit" id="btnEdit">편집하기</button>

		</sec:authorize>

		<button type="submit" id="btnList">목록으로</button>

	</div>



	<%-- ====== 상세 정보 보여주기 종료 ====== --%>
	<jsp:include page="sellerReply.jsp"></jsp:include>

</body>

<script>
	$(document)
			.ready(
					function() {

						var formObj = $("#sellerBoard");

						$("#btnList")
								.on(
										"click",
										function() {
											self.location = "/sellerBoard/sellerBoardList?page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
										});

					});
</script>
</html>