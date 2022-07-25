<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.no-nuderline {
	text-decoration: none;
}

.dropbtn {
	background-color: #f5f7fa;
	color: black;
	padding: 16px;
	font-size: 16px;
	border: none;
}

.btn a {
	color: black;
	/*padding: 10px 10px;*/
	text-decoration: none;
	display: block;
}

.btn a:hover {
	background-color: #ddd;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	background-color: #f5f7fa;
	min-width: 100px;
	box-shadow: 0px 8px 16px 0px rgba(0.0 .0 .0 .2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	/*padding: 10px 10px;*/
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #ddd;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #f5f7fa;
}
</style>
</head>

<body>
	<!-- 메뉴 login -->

	<h1 class="btn">
		<sec:authorize access="!isAuthenticated()">
			<a href="/auth/login"><spring:message code="header.login" /></a>
		</sec:authorize>
	</h1>

	<sec:authorize access="isAuthenticated()">

		<div>
			<h1>
				<sec:authentication property="principal.username" />
				님
			</h1>
		</div>

		<h2 class="btn">
			<a href="/auth/logout">로그아웃 </a>
		</h2>

	</sec:authorize>

	<sec:authorize access="hasRole('ROLE_SUPERADMIN')">

		<div class="dropdown">
			<button class="dropbtn">창작물 관리</button>
			<div class="dropdown-content">
				<h2>
					<!-- 창작물 등록 목록을 메뉴에 추가한다. -->
					<a href="/admin/creation/regList"><spring:message
							code="menu.creation.list.reg" /></a>
				</h2>
				<h2>
					<!-- 창작물 삭제 목록을 메뉴에 추가한다. -->
					<a href="/admin/creation/delList"><spring:message
							code="menu.creation.list.del" /></a>
				</h2>
				<h2>
					<!-- 창작물 등록신청 목록을 메뉴에 추가한다. -->
					<a href="/admin/creation/regAppList"><spring:message
							code="menu.creation.list.regApp" /></a>
				</h2>
				<h2>
					<!-- 창작물 삭제신청 목록을 메뉴에 추가한다. -->
					<a href="/admin/creation/delAppList"><spring:message
							code="menu.creation.list.delApp" /></a>
				</h2>
			</div>
		</div>
		<hr>
		<div class="btn">
			<h2>
				<!-- 카테고리 변경을 메뉴에 추가한다. -->
				<a href="/admin/category/creationCategory"><spring:message
						code="menu.creation.category" /></a>
			</h2>
		</div>
		<hr>
		<div class="dropdown">
			<button class="dropbtn">거래 관리</button>
			<div class="dropdown-content">
				<h2>
					<!-- 환불 관리를 메뉴에 추가한다. -->
					<a href="/admin/refund/requestList"><spring:message
							code="menu.refund.reqeust" /></a>
				</h2>
				<h2>
					<!-- 매출 현황을 메뉴에 추가한다. -->
					<a href="/admin/sales/salesStatus"><spring:message
							code="menu.sales.salesstatus" /></a>
				</h2>
				<h2>
					<!-- 거래 내역을 메뉴에 추가한다. -->
					<a href="/admin/sales/transactionHistory"><spring:message
							code="menu.sales.transactionhistory" /></a>
				</h2>
			</div>
		</div>
		<hr>
		<div class="dropdown">
			<button class="dropbtn">회원 관리</button>
			<div class="dropdown-content">
				<h2>
					<!-- 판매자회원 목록을 메뉴에 추가한다. -->
					<a href="/admin/user/sellerList"><spring:message
							code="menu.user.sellerList" /></a>
				</h2>
				<h2>
					<!-- 일반회원 목록을 메뉴에 추가한다. -->
					<a href="/admin/user/memberList"><spring:message
							code="menu.user.memberList" /></a>
				</h2>
				<h2>
					<!-- 탈퇴한 판매자회원 목록을 메뉴에 추가한다. -->
					<a href="/admin/user/sellerResignList"><spring:message
							code="menu.user.sellerResignList" /></a>
				</h2>
				<h2>
					<!-- 탈퇴한 일반회원 목록을 메뉴에 추가한다. -->
					<a href="/admin/user/memberResignList"><spring:message
							code="menu.user.memberResignList" /></a>
				</h2>
			</div>
		</div>
		<hr>
		<div class="dropdown">
			<button class="dropbtn">공지사항 관리</button>
			<div class="dropdown-content">
				<h2>
					<!-- 판매자회원 공지사항을 메뉴에 추가한다. -->
					<a href="/admin/notice/sellerList"><spring:message
							code="menu.notice.sellerList" /></a>
				</h2>
				<h2>
					<!-- 일반회원 공지사항을 메뉴에 추가한다. -->
					<a href="/admin/notice/memberList"><spring:message
							code="menu.notice.memberList" /></a>
				</h2>
			</div>
		</div>

	</sec:authorize>



	<sec:authorize access="hasRole('ROLE_SELLER')">
		<div class="dropdown">
			<button class="dropbtn">마이 페이지</button>
			<div class="dropdown-content">
				<!-- 창작물 등록 -->
				<h2>
					<a href="/ebook/register">창작물 등록</a>
				</h2>
				<!-- 창작물 등록 내역 -->
				<h2>
					<a href="/ebook/uploadList">창작물 등록내역</a>
				</h2>
				<!-- 판매내역 -->
				<h2>
					<a href="/purchase/sellerSalesList">판매내역</a>
				</h2>
				<!-- 정산관리 -->
				<h2>
					<a href="/purchase/sellerSettlementList">정산관리</a>
				</h2>
				<!-- 환불 관리 -->
				<h2>
					<a href="/purchase/sellerRefundList">환불관리</a>
				</h2>
				<!-- 계정 관리 -->
				<h2>
					<a href="/seller/read">계정관리</a>
				</h2>
			</div>
		</div>
		<hr>


		<!-- 판매자권한 고객센터 -->
		<div class="dropdown">
			<button class="dropbtn">
				<spring:message code="side.serviceCenter" />
			</button>
			<div class="dropdown-content">
				<h2>
					<a href="<%=request.getContextPath()%>/notice/noticelist"> <spring:message
							code="side.memberNotice" />
					</a>
				</h2>
				<h2>
					<a href="<%=request.getContextPath()%>/faqboard/memberFaqList">
						자주묻는 질문 </a>
				</h2>
				<h2>
					<a href="/sellerBoard/sellerBoardList"> 문의게시판 </a>
				</h2>
			</div>
		</div>


	</sec:authorize>

	<hr>
	<br>

	<!-- 회원 권한 카테고리 -->
	<div class="dropdown">
		<button class="dropbtn">

			<spring:message code="side.category" />

		</button>
		<div class="dropdown-content">
			<h2>
				<a href="/"> <spring:message code="side.all" /></a>
			</h2>
			<h2>
				<a href="/"> <spring:message code="side.poetry" /></a>
			</h2>
			<h2>
				<a href="/"> <spring:message code="side.essay" /></a>
			</h2>
			<h2>
				<a href="/"> <spring:message code="side.shotStroy" /></a>
			</h2>
		</div>
	</div>

	<hr>
	<br>

	<!-- 회원권한 인기순위 -->
	<div class="btn">

		<h2>
			<a href="/ebook/list"> <spring:message code="side.bestSeller" /></a>
		</h2>
	</div>

	<hr>
	<br>

	<!-- 회원권한 신작 -->
	<div class="btn">

		<h2>
			<a href="/ebook/list" class="no-underline"><spring:message
					code="side.newBook" /></a>
		</h2>

	</div>

	<hr>
	<br>

	<sec:authorize access="hasRole('ROLE_MEMBER')">

		<!-- 회원권한 마이페이지-->
		<div class="dropdown">

			<button class="dropbtn">
				<spring:message code="side.myPage" />
			</button>

			<div class="dropdown-content">
				<h2>
					<a href="/purchase/memberDownloadList"> <spring:message
							code="side.purchaseHistory" />
					</a>
				</h2>
				<h2>
					<a href="/purchase/memberRefundList"> <spring:message
							code="side.refundHistory" />
					</a>
				</h2>
				<h2>
					<a href="/member/read"> <spring:message
							code="side.accountManagement" />
					</a>
				</h2>

			</div>

		</div>
		<hr>
		<br>
		<br>
		<!-- 회원권한 고객센터 -->
		<div class="dropdown">
			<button class="dropbtn">
				<spring:message code="side.serviceCenter" />
			</button>
			<div class="dropdown-content">
				<h2>
					<a href="<%=request.getContextPath()%>/notice/noticelist"> <spring:message
							code="side.memberNotice" />
					</a>
				</h2>
				<h2>
					<a href="<%=request.getContextPath()%>/faqboard/memberFaqList">
						자주묻는 질문 </a>
				</h2>
				<h2>
					<a href="/memberBoard/memberBoardList"> <spring:message
							code="side.memberBoard" />
					</a>
				</h2>
			</div>
		</div>
		<hr>
	</sec:authorize>
</body>
</html>