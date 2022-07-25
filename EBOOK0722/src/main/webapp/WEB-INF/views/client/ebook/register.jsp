<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 회원가입 페이지</title>
</head>
<body>

	<h1>창작물 등록</h1>

	<form:form modelAttribute="ebook" action="register"
		enctype="multipart/form-data">
		<table>


			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><form:input path="e_title" /></td>
				<td><font color="red"><form:errors path="e_title" /></font></td>
			</tr>

			<tr>
				<td>게시물 소개</td>
				<td><form:textarea path="e_post_introduce"></form:textarea></td>
				<td><font color="red"><form:errors
							path="e_post_introduce" /></font></td>
			</tr>

			<tr>
				<td>저자</td>
				<td><form:input path="e_writer" /></td>
				<td><font color="red"><form:errors path="e_writer" /></font></td>
			</tr>

			<tr>
				<td>저자소개</td>
				<td><form:textarea path="e_profile"></form:textarea></td>
				<td><font color="red"><form:errors path="e_profile" /></font></td>
			</tr>

			<tr>
				<td>연령제한</td>
				<td><form:input path="e_age_limit" type="tel" /></td>
				<td><font color="red"><form:errors path="e_age_limit" /></font></td>
			</tr>

			<tr>
				<td>카테고리</td>
				<td><form:select path="e_category" items="${categoryList}"
						itemValue="value" itemLabel="label" /></td>
				<td><font color="red"><form:errors path="e_category" /></font></td>
			</tr>

			<tr>
				<td>목차</td>
				<td><form:textarea path="e_table_content"></form:textarea></td>
				<td><font color="red"><form:errors
							path="e_table_content" /></font></td>
			</tr>

			<tr>
				<td>희망 판매 가격</td>
				<td><form:input path="e_price" /></td>
				<td><font color="red"><form:errors path="e_price" /></font></td>
			</tr>


			<tr>
				<td>표지 이미지 첨부파일</td>
				<td><form:input path="e_coverimage" type="file" />
			</tr>

			<tr>
				<td>게시물 첨부파일</td>
				<td><form:input path="e_attachment" type="file" />
			</tr>

			<tr>
				<td>게시물 미리보기이미지</td>
				<td><form:input path="e_thumbnail" type="file" />
			</tr>


		</table>
	</form:form>

	<div>
		<button type="button" id="btnRegister">등록</button>
	</div>

</body>
<script>
	//등록 폼 전송
	$(document).ready(function() {

		var formObj = $("#ebook");

		$("#btnRegister").on("click", function() {
			formObj.submit();
		});

	});
</script>
</html>