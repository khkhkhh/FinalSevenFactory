<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="::::: 관리자모드 :::::" name="title" />
</jsp:include>
<jsp:include page="/WEB-INF/views/template/adminSide.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js"></script>
<style>
.adminMain-wrap {
	height: 800px;
	background-color: #E2E2E2;
	padding-top: 200px;
}

.group-btn {
	text-align: center;
}

.adminMainBtn {
	display: inline-block;
	padding: 15px 25px;
	font-size: 24px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	outline: none;
	color: #fff;
	background-color: #4CAF50;
	border: none;
	border-radius: 15px;
	box-shadow: 0 9px #999;
	margin: 0 20px;
}

.adminMainBtn:hover {
	background-color: #3e8e41
}

.adminMainBtn:active {
	background-color: #3e8e41;
	box-shadow: 0 5px #666;
	transform: translateY(4px);
}

#notice_name {
	width: 250px;
	margin-bottom: 70px;
}

/* .all {
	border: 1px solid black;
	width: 250px;
	height: auto;
	float: left;
	margin-right: 150px;
	margin-left: 40px;
	position: fixed;
}
 */
/* li {
	margin: 0px 20px;
	list-style-type: none;
}

a {
	text-decoration: none;
} */
</style>
<!-- <div style="height: 300px; width: 100%;"></div> -->
<div class="adminMain-wrap">

	<div class="group-btn">
		<input class="adminMainBtn" type="button" value="회원관리하기"
			onclick="location.href='adminList'"> <input
			class="adminMainBtn" type="button" value="객실예약현황"
			onclick="location.href='adminReservationList'">
	</div>

</div>

<%@ include file="/WEB-INF/views/template/footer.jsp"%>