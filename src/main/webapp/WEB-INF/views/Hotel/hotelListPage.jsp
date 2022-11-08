<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
<
style>.roomListOne {
	display: inline-block;
	padding: 40px;
	transition: 0.5s;
}

.roomListOne:hover {
	transform: scale;
	scale: 1.02;
	opacity: 0.8;
}

img {
	width: 500px;
}

.roomListBox {
	padding-top: 50px;
	text-align: center;
}

.roomInfoLeft, .roomInfoRight {
	display: inline-block;
	padding: 5px;
}

.roomInfoLeft {
	text-align: left;
}

.roomInfoRight {
	text-align: right;
}

#line {
	margin: auto;
	color: gray;
	width: 1400px;
	border: 1px solid silver
}

.roomList_backimg {
	width: 100%;
	height: 750px;
	background-size: cover;
	background-image: url("resources/assets/background_img/hoteldog.png");
	text-align: center;
	color: white;
	padding-top: 300px;
}

#pagetitle {
	font-size: 85px;
	color: white;
}

#sevenfactory, #explain {
	font-weight: bold;
	color: white;
}

#explain {
	font-size: 15px;
}

#roominfo {
	width: 200px;
}
</style>

<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="객실소개" name="title" />
</jsp:include>

<!-- roomInfo 리스트 페이지  -->
<!-- 수정 form태그 추가 -->
<form action="">
	<div class="roomList_backimg">
		<h3 id="sevenfactory">Together</h3>
		<h1 id="pagetitle">Preview Rooms</h1>
		<p id="explain">투개더만의 객실 </p>
	</div>
	<div class="roomListBox">
		<img id="roominfo" alt="roominfo"
			src="resources/assets/name_img/roominfo_name.png" /><br />
		<br />
		<c:forEach var="hDTO" items="${list }">
			<c:if test="${1 eq (hDTO.hNo % 2)}">
				<div class="roomListOne">
					<!-- RoomView(상세페이지)로 이동 -->
					<%-- <a href="roomViewPage?gNo=${gDTO.gNo }&gName=${gDTO.gName}">
					<img src="URL" usemap="#${k.index }"  alt="${gDTO.gName }" src="resources/assets/guestroom_img/${gDTO.gThumbnail }.png">
					<map name="${k.index }">			
						<area class="area1" href="#" shape="rect" coords="16, 276, 150, 318">
					</map>
					</a> --%>
					<a href="hotelroomListPage?hNo=${hDTO.hNo }"> <img alt="${hDTO.hName }" src="resources/assets/hotel_img/${hDTO.hThumbnail }.png">
					</a>

					<!-- 방정보  -->
					<div class="roomInfoLeft">
						<h3>${hDTO.hName }</h3>
						<br /> ▶ 주소 : ${hDTO.hAddress}<br /> ▶ 최저가: ${hDTO.hMinprice}<br />
					</div>
				</div>
				<br />
				<hr id="line" />
			</c:if>

			<c:if test="${0 eq (hDTO.hNo % 2)}">
				<div class="roomListOne">
					<!-- 방정보  -->
					<div class="roomInfoRight">
						<h3>${hDTO.hName }Information</h3>
						<br /> 주소 : ${hDTO.hAddress} ◀<br /> 최저가 : ${hDTO.hMinprice} ◀<br />
					</div>
					<!-- RoomView(상세페이지)로 이동 -->
					<%-- <img usemap="#${k.index }"  alt="${gDTO.gName }" src="resources/assets/guestroom_img/${gDTO.gThumbnail }.png">
					<map name="${k.index }">
						<area href="roomViewPage?gNo=${gDTO.gNo }&gName=${gDTO.gName}" shape="rect" coords="16, 276, 150, 318">
					</map> --%>
					<a href="hotelroomListPage?hNo=${hDTO.hNo }"> <img
						alt="${hDTO.hName }"
						src="resources/assets/hotel_img/${hDTO.hThumbnail }.png">
					</a>
				</div>
				<br />
				<hr id="line" />
			</c:if>
		</c:forEach>
	</div>
</form>
<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp"%>