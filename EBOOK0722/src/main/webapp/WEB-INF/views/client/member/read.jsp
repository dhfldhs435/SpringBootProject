<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원 수정 페이지</title>
<style type="text/css">
th {
	text-align: left;
}

td {
	text-align: left;
}
</style>

</head>
<body>

	<h1>계정 정보</h1>


	<table>


		<tr>
			<td><br></td>
		</tr>

		<tr>
			<td>이름</td>
			<td align="left">${member.m_name}</td>
		</tr>

		<tr>
			<td>이메일</td>
			<td align="left">${member.m_mail}</td>
		</tr>

		<tr>
			<td>가입일자</td>
			<td align="left">${member.m_join_date}</td>
		</tr>




	</table>


	<div>
		<button type="button"
			onclick="location.href='modify?m_num=${member.m_num}'">수정</button>
	</div>
</body>
</html>