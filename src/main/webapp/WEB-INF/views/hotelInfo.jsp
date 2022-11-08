<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f3e6622db3f5814e8e191da89d96838&libraries=LIBRARY"></script>

<style type="text/css" >
	* {
		font-family: "Inconsolata", sans-serif;
	}
	.bgimg { 
		background-position: center;
		background-size: cover;
		background-image: url("resources/assets/aboutUs_img/hotel.jpg");
		min-height: 750px;
	}
	#map{
		margin: 0 auto;
	}
	table {
		border-collapse: collapse;
		width: 55%;
		margin: 0 auto;
		margin-top: 30px;
		margin-bottom: 30px;
	}
	th, td {
		padding: 8px;
		text-align: left;
		border-bottom: 1px solid #ddd;
	}
	tr:hover {background-color:#f5f5f5;}
</style>



<header class="bgimg w3-display-container w3-grayscale-min" id="home">
	<div class="w3-display-bottomleft w3-center w3-padding-large w3-hide-small">
		<span class="w3-tag">A Global Leading</span>
	</div>
	<div class="w3-display-middle w3-center">
		<span class="w3-text-white" style="font-size:90px">Together</span>
	</div>
	<div class="w3-display-bottomright w3-center w3-padding-large">
		<span class="w3-text-white">Your Lifetime Friend</span>
	</div>
</header>

<!-- About Container -->
<div class="w3-container" id="about">
	<div class="w3-content" style="max-width:700px">
		<h5 class="w3-center w3-padding-64"><span class="w3-tag w3-wide">ABOUT THE US</span></h5>
		<p>투게더(Together)는 대한민국 최대규모 반려견 동반 호텔 예약 사이트입니다. 이제 아시아를 넘어 세계로 뻗어가는 글로벌 호텔로서 전세계 어디에서나 한결같이 품격있는 서비스와 시설로 고객에게 깊은 감동을 주는 브랜드를 지향하고 있습니다. <br/><br/>균형 있는 라이프스타일을 추구하며 품격의 가치를 아는 고객을 위해 세련되고 모던한 감각을 지닌 안락한 객실과 세심한 배려가 묻어나는 서비스를 준비합니다. 또한 투게더만의 감각적인 뷰와 다양한 경험을 제공하는 호텔시설은 감동을 더해드립니다.</p>
		<p>투게더에서 품격 있는 휴식으로 삶의 균형을 완성해가시길 바랍니다.</p>
		<div class="w3-panel w3-leftbar w3-light-grey">
			<p><i>"고객으로부터 신뢰받는 프로로서의 자부심과 열정을 잊지 않는다" -사랑, 자유, 풍요의 꿈을 실현하는 투게더의 철학</i></p>
			<p>고품격 경영 업계 선도</p>
		</div>
<img src="resources/assets/aboutUs_img/room.jpg" style="width:100%;max-width:1000px" class="w3-margin-top">
<p><strong>Tel : </strong>010-1111-1111</p>
<p><strong>Email : </strong>admin@google.com</p>
	</div>
</div>
<h5 class="w3-center w3-padding-48"><span class="w3-tag w3-wide">WHERE TO FIND US</span></h5>




<script>
	// 이미지 지도에 표시할 마커입니다
	// 이미지 지도에 표시할 마커를 아래와 같이 배열로 넣어주면 여러개의 마커를 표시할 수 있습니다 
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = { 
		        center: new kakao.maps.LatLng(36.349268551597966 , 127.37767658950676), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var imageSrc = 'https://ifh.cc/g/Gvw26t.png', // 마커이미지의 주소입니다
		//var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
	    imageSize = new kakao.maps.Size(30, 30), // 마커이미지의 크기입니다
	    //imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	    imageOption = {offset: new kakao.maps.Point(10, 10)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	      
		
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		// 마커가 표시될 위치입니다 
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
		var markerPosition  = new kakao.maps.LatLng(36.349268551597966 , 127.37767658950676); 
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition,
		    image: markerImage
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		var iwContent = 
			'<p style="width:200px"><b>Seven Factory</b><br>대전광역시 대덕대로</p>';
			iwPosition = 
			new daum.maps.LatLng(36.349268551597966 , 127.37767658950676);

			var infowindow = new daum.maps.InfoWindow({
				position: iwPosition,
				content: iwContent,
				removable: true
				});

			daum.maps.event.addListener(marker, 'click', function() {
				infowindow.open(map, marker);
				});

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);    
	
</script>

<table>
	<tr>
		<th colspan="2">Location of Us</th>
	</tr>
	<tr>
		<td>ADDRESS</td>
		<td>대전광역시 서구 대덕대로 182 오라클빌딩 10층</td>
	</tr>
	<tr>
		<td>BY SUBWAY</td>
		<td>정부청사역 2번출구</td>
	</tr>
	<tr>
		<td>BY BUS</td>
		<td>
		B:203, 211, 216, 301, 315, 316, 318, 604, 605, 617, 703, 706, 116, 3 /
		</td>
	</tr>
</table>


<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>