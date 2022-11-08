<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 사이드바</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js"></script>
</head>
<style>
.all{
	border: 1px solid black;
	width:250px;
	height:auto;
	float:left;	
	margin-right: 50px;
	margin-left:300px;
}
li{ 
	margin:0px 20px;
	list-style-type: none;
	
}
li p{ 
	color : black;
	
}
li:hover{ 
	cursor: pointer;
	color : red;
}
a{
	text-decoration: none;
}
.hover:hover{
	color: #ff5e62;
}
</style>

<script>
 function submit(a){
	 console.log(a);
	 side.action=a;
	 side.submit();
 }
</script>
<body>
	<div style="height:250px; width:100%;">
	</div> 
<div class="all">
	<form id="side" method="POST">
	<div>
		<ul> 
			<li class="icon"><i class="fa-solid fa-user" style="font-size:25px;"></i></li>
			<li class="hover"><p id="blacklist" onclick="submit(this.id)" >블랙리스트 등록요청</p></li>
			<li class="hover"><p id="extendPage" onclick="submit(this.id)">사업자 연장 요청</p></li>
		</ul>
		
		<ul>
			<li class="icon"><i class="fa-solid fa-cart-shopping" style="font-size:25px;"></i></li>
			<li class="hover"><p id="sellerMain" onclick="submit(this.id)">예약현황관리</p></li>
			<li class="hover"><p id="sellerresrevation" onclick="submit(this.id)">예약신청관리</p></li>
			<li class="hover"><p id="sellerreview" onclick="submit(this.id)">리뷰관리</p></li>
		</ul>
		
		<ul>
			<li class="icon"><i class="fa-solid fa-clipboard-list" style="font-size:25px;"></i></li>
			<li class="hover"><p id="sellerevent1" onclick="submit(this.id)">이벤트 요청</p></li>
			<li class="hover"><p id="sellerevent2" onclick="submit(this.id)">이벤트 연장 요청</p></li>
		</ul>
	</div>
	<input type="hidden" value="${loginDTO.sId }" name="sId"/>
	</form>
</div>
</body>
</html>