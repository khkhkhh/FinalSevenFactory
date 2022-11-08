<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/sellerheader.jsp" />
<jsp:include page="/WEB-INF/views/template/sellerSide.jsp" />
<title>사업자 이벤트관리</title>
</head>
<!--CSS -->
<style>
allcontent {
	margin: 5px auto;
	margin-left: 200px;
}

h4 {
	margin-left: 600px;
}

.content {
	display: flex;
	width: 300px;
	border: 0.5px solid gray;
}

.imgcontent {
	flex: 1;
}

.eventcontent {
	flex: 2;
	border: 0.5px solid gray;
	margin-left: 100px;
}

textarea {
	width: 300px;
}
</style>
<!--JS-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	
</script>
<body>
	<div class="allcontent">
		<div id="title">
			<h4>호텔 이벤트 요청 페이지</h4>
		</div>
		<div class="eventTitle"></div>
		<form id="se1" action="eventApproveRequest">
			<div class="content">
				<div class="imgcontent">
					<span>▶이벤트 배너 <br /></span> 
					<input type="file" name="eThumbnail">
				</div>
				<div class="eventcontent">
					<!-- 이벤트 객실명 db에서 가져와서 select-option으로 만들어도 좋을듯 -->
					<span>▶이벤트 객실명 <br /></span> 
					<select name="gName">
						<option value="" >선택해주세요.</option>
						<c:forEach var="gDTO" items="${list}" >
							<option value="${gDTO}" >${gDTO}</option>
						</c:forEach>
					</select> <br /> 
					<span>▶이벤트 가격<br /></span> 
					<input type="text" id="eventprice" value="" name="ePrice" /><br /> 
					<span>▶이벤트 시작일 <br /></span>
					<input type="date" id="startdate" value="" name="eStart" /><br /> 
					<span>▶이벤트 종료일 <br /> </span> 
					<input type="date" id="enddate" value="" name="eEnd" /><br /> 
					<span>▶별도 요구사항 <br /> </span>
					<textarea id="eventcontent" cols="20" rows="5" name="eAddtion"></textarea>
					<input type="hidden" value="${sId}" name="sId"/>
				</div>
			</div>
			<div style="width: 1500px;">
				
				<input type="submit" value="이벤트 요청" style="float: right;" />
			</div>
		</form>
	</div>
</body>
</html>
<!-- 정적페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp"%>