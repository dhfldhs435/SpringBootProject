<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-book Market Creation Management</title>
</head>
<body>
<h3>창작물 관리 - 카테고리 변경</h3>
<form action="/logout" method="post">
<sec:csrfInput/>
<button>로그아웃</button>
</form>
</body>
</html>