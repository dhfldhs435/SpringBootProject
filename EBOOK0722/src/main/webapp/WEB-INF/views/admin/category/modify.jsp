<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="container">
	<h2>
		<spring:message code="category.header.modify" />
		<!-- 카테고리 수정 메세지 -->
	</h2>

	<!-- 카테고리 그룹코드, 카테고리명 폼양식 -->
	<form:form modelAttribute="adminCategory" action="modify">
		<table>
			<tr>
				<td><spring:message code="category.categoryCode" /></td>
				<td><form:input path="category_code" readonly="true" /></td>
				<td><font color="red"><form:errors path="category_code" />
				</font></td>
			</tr>

			<tr>
				<td><spring:message code="category.categoryName" /></td>
				<td><form:input path="category_name" /></td>
				<td><font color="red"><form:errors path="category_name" /></font></td>
			</tr>
		</table>
	</form:form>
	<div>
		<button type="submit" id="btnModify">
			<spring:message code="action.modify" />
		</button>
		<button type="submit" id="btnRemove">
			<spring:message code="action.remove" />
		</button>
		<button type="submit" id="btnList">
			<spring:message code="action.list" />
		</button>
	</div>
	<script>
		$(document).ready(
				function() {
					var formObj = $("#adminCategory");
					$("#btnModify").on(
							"click",
							function() {
								if (confirm("카테고리 이름을 '" + category_name.value
										+ "' 로 변경하시겠습니까?") == true) { //확인

									formObj.submit(); // 수정된 내용 DB전송

								} else { //취소

									return false;
								}
							});
					$("#btnRemove").on("click", function() {
						formObj.attr("action", "/admin/category/remove");

						if (confirm("카테고리를 삭제하시겠습니까?") == true) { //확인

							formObj.submit(); // 삭제(remove로) 전송

						} else { //취소

							return false;

						}
					});
					$("#btnList").on("click", function() {
						self.location = "creationCategory";
					});
				});
	</script>
</div>