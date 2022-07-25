<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<style type="text/css">
li {
	list-style: none;
	padding: 6px;
	float: left;
}
</style>
<h2>
	<spring:message code="mb.list" />
</h2>


<h4>
	<a href="<%=request.getContextPath()%>/memberBoard/memberBoardRegister"><spring:message
			code="mb.new" /></a>
</h4>


<table border="2">
	<tr>
		<th align="center" width="180"><spring:message code="mb.num" /></th>
		<th align="center" width="180">작성자 일련번호</th>
		<th align="center" width="150"><spring:message code="mb.title" /></th>
		<th align="center" width="200"><spring:message code="mb.content" /></th>
		<th align="center" width="100"><spring:message
				code="mb.processing" /></th>
		<th align="center" width="180"><spring:message code="mb.regDate" /></th>
	</tr>
	<c:choose>
		<c:when test="${empty memberBoardList}">
			<tr>
				<td colspan="4"><spring:message code="mb.empty" /></td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${memberBoardList}" var="memberBoard">
				<tr>
					<td align="center">${memberBoard.mb_num}</td>
					<td align="center">${memberBoard.m_num }</td>

					<td align="center"><a
						href='/memberBoard/memberBoardRead?mb_num=${memberBoard.mb_num}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&Keyword=${scri.keyword}'>${memberBoard.mb_title }</a></td>

					<td align="center">${memberBoard.mb_content}</td>
					<td align="center">${memberBoard.mb_processing }</td>
					<td align="center">${memberBoard.mb_reg_Date }</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
<div class="search">
	<select name="searchType">
		<option value="n"
			<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
		<option value="t"
			<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
		<option value="c"
			<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
		<option value="w"
			<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
		<option value="tc"
			<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
	</select> <input type="text" name="keyword" id="keywordInput"
		value="${scri.keyword }" />

	<button id="searchBtn" type="button">검색</button>


</div>


<div>
	<ul>
		<c:if test="${pageMaker.prev }">
			<li><a
				href="memberBoardList${pageMaker.makeSearch(pageMaker.startPage - 1)}"><spring:message
						code="common.back" /></a></li>
		</c:if>

		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }"
			var="idx">
			<li><a href="memberBoardList${pageMaker.makeSearch(idx)}">${idx}</a></li>
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
			<li><a
				href="memberBoardList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
		</c:if>


	</ul>
</div>






<script>
	$(function() {
		$('#searchBtn').click(
				function() {
					self.location = "memberBoardList"
							+ '${pageMaker.makeQuery(1)}' + "&searchType="
							+ $("select option:selected").val() + "&keyword="
							+ encodeURIComponent($('#keywordInput').val());
				});
	});
	var result = "${msg}";

	if (result === "SUCCESS") {
		alert("<spring:message code='common.processSuccess'/>");
	}
</script>