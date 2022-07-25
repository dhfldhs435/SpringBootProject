<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
</head>
<body>
<h2>게시물 상세보기</h2>
<form:form modelAttribute="memberBoard" enctype="multipart/form-data">
<form:hidden path="mb_num"/>
<form:hidden path="mb_attachmentFileUrl"/>
<table>
<tr>
<td>작성자</td>
<td><sec:authentication property="principal.username" /></td>
</tr>
&nbsp;


<tr>
<td>회원일련번호</td>
<td><form:input path="m_num" readonly="true" size="1"/></td>
<td><font color="red"><form:errors path="m_num"/></font></td>
</tr>

<tr>
<td>게시물 제목</td>
<td><form:textarea cols="20" rows="1" style="resize:none;" path="mb_title" /></td>
<td><font color="red"><form:errors path="mb_title"/></font></td>
</tr>

<tr>
<td>게시물 내용</td>
<td><form:textarea style="resize:none;" cols="30" rows="20"  path="mb_content" /></td>
<td><font color="red"><form:errors path="mb_content"/></font></td>
</tr>
<tr>
			<c:if test="display?mb_num=${memberBoard.mb_num} != null">
					<td><img src="display?mb_num=${memberBoard.mb_num} "
						width="210" height="180"></td>
				</c:if>
		</tr>

<tr>
	<td>첨부파일</td>
	<td><form:input path="mb_attachmentFile" type="file" /></td>
		
		</tr>
</table>
</form:form>

<div>
<sec:authentication property="principal" var="member"/>

<sec:authorize access="hasRole('ROLE_ADMIN')">
<button type="submit" id="btnReply">답글달기</button>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_MEMBER')">
<button type="submit" id="btnModify">수정하기</button>
<button type="submit" id="btnRemove">삭제하기</button>
</sec:authorize>

<button type="submit" id="btnList">목록으로</button>

</div>
</body>

<script>
$(document).ready(function() {
	
	var formObj = $("#memberBoard");
	
	$("#btnModify").on("click",function(){
		formObj.submit();
	});
	
	$("#btnRemove").on("click",function(){
		formObj.attr("action","/board/memberBoardRemove");
		formObj.submit();
	});
	
	$("#btnList").on("click",function(){
		self.location = "/board/memberBoardList"
	});
	
});

</script>
</html>