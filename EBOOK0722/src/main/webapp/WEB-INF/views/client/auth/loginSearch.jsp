<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
	<h2>로그인</h2>


	<form method="post" action="/IdSearch">
		<table>
			<tr>
				<th>아이디 찾기</th>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" id="email1" />
					<button type="button" id="btnIdSearch">조회</button></td>
			</tr>
			<tr>
				<td colspan="3"><font color="red"><span
						id="email1_olmessage"> </span></font></td>
			</tr>
		</table>

	</form>

	<br>
	<br>
	<br>
	<form method="post" action="/pwSearch">
		<table>
			<tr>
				<th>비밀번호 찾기</th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" id="id" /><font color="red"><span
						id="id_olmessage"> </span></font></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" id="email2" />
					<button type="button" id="btnPwSearch">조회</button> <font
					color="red"><span id="email2_olmessage"> </span></font></td>
			</tr>
			<tr></tr>
			<tr>
				<td><span id="question_olmessage"> </span></td>
				<td><input type="text" id="answer" />
					<button type="button" id="btnsubmit">제출</button> <font color="red"><span
						id="answer_olmessage"> </span></font></td>
			</tr>


		</table>

	</form>


</body>
<script>
	$("#btnIdSearch").click(
			function() {

				var email = $("#email1").val()

				if (email == "") {

					$("#email1_olmessage").text("이메일을 입력해주세요");

				} else {

					var params = {
						email : email
					}

					$.ajax({
						type : "get",
						async : false,
						url : "http://localhost:8080/auth/emailCheck",
						data : params,
						success : function(data) {

							if (data == "null") {

								$("#email1_olmessage").text(
										"해당 이메일로 가입된 유저가 존재하지 않습니다.");

							} else {

								$("#email1_olmessage").text(
										"해당 이메일로 조회된 아이디 : " + data);

							}

						}

					})
				}

			});

	$("#btnPwSearch").click(
			function() {

				var email = $("#email2").val()
				var id = $("#id").val()

				if (id == "") {

					$("#id_olmessage").text("아이디를 입력해주세요");

				}

				if (email == "") {

					$("#email2_olmessage").text("이메일을 입력해주세요");

				} else {

					var params = {

						id : id,
						email : email
					}

					$.ajax({
						type : "get",
						async : false,
						url : "http://localhost:8080/auth/pwCheck",
						data : params,
						success : function(data) {

							if (data == 1) {

								$("#email2_olmessage").text(
										"가입시 입력하신 이메일과 아이디를 정확히 입력해주세요.");

							} else {

								$("#question_olmessage").text("질문");

							}

						}

					})
				}

			});

	$("#btnsubmit").click(function() {

		var id = $("#id").val()
		var email = $("#email2").val()
		var answer = $("#answer").val()

		if (id == "") {

			$("#id_olmessage").text("아이디를 입력해주세요");

		}

		if (email == "") {

			$("#email2_olmessage").text("이메일을 입력해주세요");

		}

		if (answer == "") {

			$("#answer_olmessage").text("정답을 입력해주세요");

		} else {

			var params = {
				id : id,
				answer : answer
			}

			$.ajax({
				type : "get",
				async : false,
				url : "http://localhost:8080/auth/isPass",
				data : params,
				success : function(data) {
					if (data == "idNull") {

						$("#id_olmessage").text("아이디를 입력해주세요.");

					} else if (data == "null") {

						$("#answer_olmessage").text("오답");

					} else {

						$("#answer_olmessage").text("임시비밀번호 : " + data);
					}
				}
			})
		}

	});
</script>

</html>