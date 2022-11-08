<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/sellerheader.jsp" />
<jsp:include page="/WEB-INF/views/template/sellerSide.jsp" />
<title>Insert title here</title>
</head>
<!-- CSS -->
<style>
	allcontent{
		margin:5px auto;
		padding:5px auto;
		margin-left: 200px;
		/* text-align: center; */
	}
	h4{
		margin-left:600px;
	}
	#guestroomname{
		margin-left: 300px;
	}
	#requestbtn{
		margin:10px 0px 0px 500px;
		padding:10px;
	}
</style>
<body>
	<div class="allcontent">
	<div id="title"><h4>호텔 객실 등록페이지</h4></div>
		<div class="head">
		<span>▶ 호텔객실 대표 이미지 파일 <br/> </span><input type="file" name="imgFile" style="margin-left: 300px;">	
		<br/>
		<span>▶ 호텔객실명 <br/> </span>
		<input type="text" placeholder="상품명을 입력해주세요." id="guestroomname"/><br/><br/>
		</div>
		
		<div class="content">
		 <div class="price">
		 <span>▶  비수기 가격을 입력해주세요. <br/> </span>
		 	<input type="text" pattern="[0-9]+" style="margin-left: 300px;">원 
		 </div>
		 <div class="select">
		  <span>▶  노출 상태를 선택해주세요. <br/> </span>
		 	<select name="state" style="margin-left: 300px;">
		 		<option value="">노출 상태를 선택해주세요.</option>
		 		<option value="show">게시하기</option>
		 		<option value="hide">숨기기</option>
		 	</select>
		 </div>
		 <input type="button" value="등록요청하기" onclick="request()"id="requestbtn">
		</div>
	
	</div>
</body>
</html>
<!-- 정적페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>