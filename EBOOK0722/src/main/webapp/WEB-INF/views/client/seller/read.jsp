<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 수정 페이지</title>
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
			<td align="left">${seller.s_name}</td>
		</tr>

		<tr>
			<td>닉네임</td>
			<td align="left">${seller.s_nickname}</td>
		</tr>

		<tr>
			<td>판매자 등급</td>
			<td align="left">${seller.s_grade}</td>
		</tr>


		<tr>
			<td>이메일</td>
			<td align="left">${seller.s_email}</td>
		</tr>

		<tr>
			<td>핸드폰번호</td>
			<td align="left">${seller.s_phone}</td>
		</tr>


		<tr>
			<td>주소</td>
			<td align="left">${seller.s_address}</td>
		</tr>

		<tr>
			<td>은행명</td>
			<td align="left">${seller.s_bank_name}</td>
		</tr>

		<tr>
			<td>계좌번호</td>
			<td align="left">${seller.s_account_num}</td>

		</tr>

		<tr>
			<td>예금주명</td>
			<td align="left">${seller.s_ah_name}</td>
		</tr>



		<tr>
			<td><br></td>
		</tr>

		<tr>
			<td>자격증 세부사항</td>
			<td align="left">${seller.s_certificate_detail}</td>
		</tr>


		<tr>
			<td>경력, 수상이력 세부사항</td>
			<td align="left">${seller.s_career_detail}</td>
		</tr>

		<tr>
			<td>질문</td>
			<td align="left">${seller.s_answer}</td>
		</tr>

		<tr>
			<td>가입일자</td>
			<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
					value="${seller.s_join_date}" /></td>
		</tr>




	</table>


	<div>
		<button type="button"
			onclick="location.href='modify?s_num=${seller.s_num}'">수정</button>
	</div>
</body>
</html>