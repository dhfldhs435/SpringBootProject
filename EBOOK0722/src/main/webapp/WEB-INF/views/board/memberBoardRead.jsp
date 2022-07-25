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
	<form:form modelAttribute="memberBoard" enctype="multipart/form-data">
		<form:hidden path="m_num" />
		<form:hidden path="mb_attachmentFileUrl" />





		<table>
			<tr>
				<td>작성자</td>
				<td><sec:authentication property="principal.username" /></td>
				&nbsp;
				<td>작성일</td>
				<td>${memberBoard.mb_reg_Date}</td>
			</tr>

			<tr>
				<td>게시물일련번호</td>
				<td><form:input path="mb_num" readonly="true" size="1"
						id="mb_num" /></td>
				<td><font color="red"><form:errors path="mb_num" /></font></td>
			</tr>

			<tr>
				<td>게시물 제목</td>
				<td><form:textarea cols="20" rows="1" style="resize:none;"
						path="mb_title" readonly="true" /></td>
				<td><font color="red"><form:errors path="mb_title" /></font></td>
			</tr>

			<tr>
				<td>게시물 내용</td>
				<td><form:textarea style="resize:none;" cols="30" rows="20"
						path="mb_content" readonly="true" /></td>
				<td><font color="red"><form:errors path="mb_content" /></font></td>
			</tr>

			<tr>
				<td>첨부파일</td>
				<c:if test="display?mb_num=${memberBoard.mb_num } != null">
					<td><img src="display?mb_num=${memberBoard.mb_num} "
						width="210" height="180"></td>
				</c:if>
			</tr>
		</table>
	</form:form>

	<div>




		<button type="submit" id="btnList">목록으로</button>

	</div>



	<%-- ====== 상세 정보 보여주기 종료 ====== --%>
	<jsp:include page="memberReply.jsp"></jsp:include>

</body>

<script>
	$(document)
			.ready(
					function() {

						var formObj = $("#memberBoard");

						$("#btnList")
								.on(
										"click",
										function() {
											self.location = "/memberBoard/memberBoardList?page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
										});

					});
</script>
</html>