<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="cotentPath" value="${pageContent.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원 로그인 페이지</title>
</head>
<body>
	<h2>
		<c:out value="${error}" />
	</h2>
	<h2>
		<c:out value="${logout}" />
	</h2>
	<h2>로그인</h2>


	<form method="post" action="/login">
		<table>


			<!-- 아이디 입력 -->
			<tr>
				<td><spring:message code="member.id" /></td>
				<td><input type="text" name="username" placeholder="Id" /></td>
			</tr>

			<!-- 비밀번호 입력 -->
			<tr>
				<td><spring:message code="member.pw" /></td>
				<td><input type="password" name="password"
					placeholder="Password" /></td>
			</tr>
			<tr>
				<!-- 로그인 유지 버튼 -->
				<td><input type="checkbox" name="remember-me"> <spring:message
						code="login.keep" /></td>

			</tr>

			<tr>

				<!-- 로그인 버튼 -->
				<td colspan="2" align="center"><button>
						<spring:message code="login.login" />
					</button></td>


			</tr>


		</table>
		<sec:csrfInput />
	</form>


	<a href="/auth/loginSearch">아이디/비밀번호 찾기</a>


	<!-- 일반회원 회원가입 -->
	<a href="/member/join"> 일반 회원가입</a>

	<!-- 판매자회원 회원가입 -->
	<a href="/seller/register"> 판매자 회원가입</a>


</body>