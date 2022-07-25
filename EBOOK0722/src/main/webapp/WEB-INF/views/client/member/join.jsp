<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원 회원가입</title>
</head>
<body>

	<form:form modelAttribute="member" method="post">
		<table>
			<!-- 이름 입력 -->
			<tr>
				<td><spring:message code="member.name" /></td>
				<td><form:input path="m_name" placeholder="Name" /></td>
				<td><font color="red"><form:errors path="m_name" /></font></td>
			</tr>
			<!-- 아이디 입력 -->
			<tr>
				<td><spring:message code="member.id" /></td>
				<td><form:input path="m_id" placeholder="Id" /></td>
				<td><font color="red"><form:errors path="m_id" /></font> <!-- 아이디 중복 확인 -->
					<button type="button" id="overlappedID">
						<spring:message code="action.repeatcheck" />
					</button> <span id="olmessage"></span></td>
			</tr>
			<!-- 비밀번호 입력 -->
			<tr>
				<td><spring:message code="member.pw" /></td>
				<td><input type="password" id="m_pw1" placeholder="Password" /></td>
			</tr>
			<!-- 비밀번호 재확인 -->
			<tr>
				<td><spring:message code="member.pwcheck" /></td>
				<td><form:input type="password" path="m_pw" id="m_pw2"
						placeholder="PasswordCheck" /></td>
			</tr>
			<!-- 이메일 입력 -->
			<tr>
				<td><spring:message code="member.mail" /></td>
				<td><form:input path="m_mail" placeholder="Email" /><input
					type="button" id="overlappedEmail" value="중복검사"><span
					id="email_olmessage"> </span></td>
				<td><font color="red"><form:errors path="m_mail" /></font></td>
			</tr>
			<!-- 주민등록번호 6자리 입력 -->
			<tr>
				<td><spring:message code="member.residentnum" /></td>
				<td><form:input text="number" path="m_resident_num"
						maxlength="6" placeholder="Residentnum" /></td>
				<td><font color="red"><form:errors path="m_resident_num" /></font>-
					<!-- 주민등록번호 7번째 1자리 입력 --> <input type="number" maxlength="1"
					placeholder="Residentnum7" />●●●●●●
			</tr>

			<tr>
				<td>질문</td>
				<td><form:input path="m_answer" /></td>
				<td><font color="red"><form:errors path="m_answer" /></font></td>

			</tr>
			<!-- 컨텐츠 이용약관 동의 -->
			<tr>
				<td><spring:message code="member.contentagree" /></td>
				<td><button type="button" id="btnContentAgree">
						<spring:message code="action.view" />
					</button> <input type="radio" id="btnAgree1"> <spring:message
						code="action.agree" /></td>
			</tr>
			<!-- 개인정보 이용약관 동의 -->
			<tr>
				<td><spring:message code="member.privatyagree" /></td>
				<td><button type="button" id="btnPrivatyAgree">
						<spring:message code="action.view" />
					</button> <input type="radio" id="#btnAgree2"> <spring:message
						code="action.agree" /></td>
			</tr>
			<!-- 환불 정책 보기 -->
			<tr>
				<td><spring:message code="member.refundagree" /></td>
				<td><button type="button" id="btnRefundAgree">
						<spring:message code="action.view" />
					</button></td>
			</tr>

		</table>

	</form:form>

	<div>
		<!-- 회원가입 버튼 -->
		<button type="submit" id="btnJoin">
			<spring:message code="action.join" />
		</button>
		<!-- 돌아가기 버튼 -->
		<button type="submit" id="btnReset">
			<spring:message code="action.reset" />
		</button>
	</div>

	<script>
		$(document).ready(function() {

			var formObj = $("#member");

			//회원가입
			$("#btnJoin").on("click", function() {
				formObj.submit();

				//비밀번호 재확인
				if ($("#m_pw1").val() != $("#m_pw2").val()) {
					alert("비밀번호가 일치하지않습니다");
					$("#m_pw2").focus();
					$("#m_pw2").val("");
					return false;

				} else {
					return true;
				}
				;

			});

			//아이디 중복확인
			$("#overlappedID").on("click", function() {
				$("#btnJoin").attr("type", "button");
				const id = $("#m_id").val();

				$.ajax({
					type : "get",
					async : false,
					url : "http://localhost:8080/member/idCheck",
					data : {
						id : id
					},
					success : function(data) {
						if (data == 1) {
							$("#olmessage").text("이미 사용중인 ID 입니다.");
						} else {
							$("#olmessage").text("사용 가능한 ID 입니다.");
							$("#btnJoin").attr("type", "submit");
						}
					}

				});

			});

			$("#overlappedEmail").click(function() {
				const email = $("#m_mail").val();

				$.ajax({
					type : "get",
					async : false,
					url : "http://localhost:8080/member/emailCheck",
					data : {
						email : email
					},
					success : function(data) {

						if (data == 2) {

							$("#email_olmessage").text("이메일을 입력해주세요.");

						} else if (data == 1) {

							$("#email_olmessage").text("이미 사용중인 이메일 입니다.");
							document.getElementById('s_email').value = '';

						} else {

							$("#email_olmessage").text("사용 가능한 이메일 입니다.");
						}

					}

				})

			});

			//돌아가기
			$("#btnReset").on("click", function() {
				location.href = "/";
			});

		});
	</script>
	<script>
		$(document).ready(function() {

			//컨텐츠 이용 약관 보기
			$("#btnContentAgree").on("click", function() {
				window.open("contentAgree", "컨텐츠 이용 약관");
				button();
			});

			//개인정보 이용동의 약관 보기
			$("#btnPrivatyAgree").on("click", function() {
				window.open("privatyAgree", "개인정보 이용동의 약관");
				button();
			});

			//환불 정책 보기
			$("#btnRefundAgree").on("click", function() {
				window.open("refundAgree", "환불 정책 약관");
				button();
			});

		});
	</script>
</body>
</html>