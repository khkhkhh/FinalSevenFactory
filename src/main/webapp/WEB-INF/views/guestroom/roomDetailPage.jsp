<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <!-- 동적인 페이지 포함 -->
   <jsp:include page="/WEB-INF/views/template/header.jsp">
      <jsp:param value="객실소개" name="title" />
   </jsp:include>
  <!-- CSS -->
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f3e6622db3f5814e8e191da89d96838&libraries=services"></script>
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<style>
.all{
    display:flex;
    margin: 50px 20px 20px 300px;
}

#info{
   margin-left: 600px;
}
.slider-wrap {
   flex:1; 

}
.productinfo{
   flex:2;
   margin:50px;
}

.slider-wrap{
    padding: 10px 0px 10px 80px;
     overflow: hidden;
}
ul li{
   display:inline-block;
}
#nav1,#nav2,#nav3{
   padding:5px 15px;
    border: 1px solid #333;
    height:30px;
    border-bottom: 1px solid #fff;

}
.nav{
    margin-left:350px;
}
#nav1:hover,#nav2:hover,#nav3:hover{
 background-color: #fffaf2;
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
#roominfo {
   width: 300px;
   padding:30px;
   margin-left:800px;
}
#map{
   margin-left:700px;
   }
h5{
   margin-left:700px;
}
button{
   width: 120px;
   height:30px;
   background-color: #fdf7f4;
   border:none;
   cursor: pointer;
}
#button{
   cursor: pointer;
   margin:100px 200px;
}
ul{
 border-bottom:1px solid black;
 width:1100px;
}

</style>

<!-- JS -->


<script type="text/javascript">
//뒤로가기로 되돌아 왔을 때 & 문서가 실행될 때
 $(window).bind("pageshow", function(event){
    $("#info").css("display", "inline"); //#info활성화
    $("#mapshow").css("display", "none");
   $("#qna").css("display", "none");
   });
</script>
<script>
function info(){
   $("#info").css("display", "inline");//#info활성화
   $("#mapshow").css("display", "none");
   $("#qna").css("display", "none"); 
}

function qna(){
   alert("Q&A게시판으로 이동합니다."); //#QNA활성화
   $("#mapshow").css("display", "none");
   $("#info").css("display", "none"); 
   location.href="qnaBoardList";
}
function around(){
   $("#qna").css("display", "none");
   $("#mapshow").css("display", "inline"); //#map활성화
   $("#info").css("display", "none"); 
}
$(document).ready(function (){
      $("#info").css("display", "inline");//#info활성화
      $("#mapshow").css("display", "none");
      $("#qna").css("display", "none"); 
   });

//예약하기페이지로 이동
function goreservation(){
   location.href="reser?hNo=${gDTO.hNo }&gNo=${gDTO.gNo}&rCheckIn=${rCheckIn}&rCheckOut=${rCheckOut}&mId=${loginDTO.mId}"   
}
//되돌아가기(roomlist페이지로 이동)
function goback(){
   window.history.back();
}
</script> 
<meta charset="UTF-8">
<title>객실 상세</title>
</head>
<body>
    <div class="roomList_backimg"> 
      <h3 id="hotelfive">Together</h3>
      <h1 id="pagetitle">Preview Rooms</h1>
   </div>
   <img id="roominfo" alt="roominfo"
         src="resources/assets/name_img/roominfo_name.png" /><br />
   <div class="all">
   <div class="slider-wrap">
      <div class="cont"><img src="resources/assets/guestroom/${gDTO.gThumbnail }.JPG" style="width:500px; height: 300px;"/></div>
      <c:set var="size" value="${gDTO.gImgCount}" />
      <c:forEach var="i" begin="1" end="${size}">
      <div class="cont"><img src="resources/assets/guestroom/${gDTO.gThumbnail }_${i}.JPG" style="width:500px; height: 300px;"/></div>
      </c:forEach>
   </div>
   <div class="productinfo">
      <p>상품이름 : ${gDTO.gName }</p>
      <p>상품가격 : ${gDTO.gPrice }</p>
      <p>최소인원 : ${gDTO.gMinPeople } | 최대인원 : ${gDTO.gMaxPeople }</p>
      <div id="button">
      <input type="button" onclick="goback()" value="되돌아가기" style="background-color: #fdf7f4; height: 40px; width:100px;"/>
      <input type="button" onClick="goreservation()" value="예약하기" style="background-color: #fdf7f4; height: 40px; width:100px;"/>
      </div>
   </div>
   </div>
   <div class="nav">
      <ul id="nav_line">
      <li id="nav1"onClick="info()">정보</li>
      <li id="nav2"onClick="around()">호텔 주변 정보</li>
      <li id="nav3"onClick="qna()">Q&A게시판 바로가기</li>
      </ul>
   </div>
      <div class="infoall">
      <c:forEach var="hDTO" items="${list }">
      <ul id="info">
      <li >
      <br>
      <img src="resources/assets/hotel_img/${hDTO.hThumbnail }.png" alt="${hDTO.hName }" style="width:600px;"/><br/>
      호텔주소 - ${hDTO.hAddress } <br/>
      호텔전화번호 - ${gDTO.gTel }<br/>
      객실정보 - ${gDTO.gExplain }<br/>
      객실사이즈 - ${gDTO.gRoomSize }평형<br/>
      
      </li>
      <li id="qna"></li>
      </ul>
      <input type="hidden" id="hAddress" value=" ${hDTO.hAddress }"/>
      </c:forEach>
   </div>
   <div id="mapshow" style="width:500px;height:400px;">
   <h5>숙소주변의 맛집을 지도로 확인하세요</h5>
   <div id="map" style="width:500px;height:400px;"></div>
   </div>
   <script>
      
   // 이미지 지도에 표시할 마커입니다
   // 이미지 지도에 표시할 마커를 아래와 같이 배열로 넣어주면 여러개의 마커를 표시할 수 있습니다 
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = { 
              center: new kakao.maps.LatLng(36.349268551597966 , 127.37767658950676), // 지도의 중심좌표
              level: 7// 지도의 확대 레벨
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
      
      /* // 마커가 표시될 위치입니다 
      var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
      var markerPosition  = new kakao.maps.LatLng(36.349268551597966 , 127.37767658950676); 
      
      // 마커를 생성합니다
      var marker = new kakao.maps.Marker({
          position: markerPosition,
          image: markerImage
      });
       */
      
      //주소를 통한 마커 
      var geocoder = new kakao.maps.services.Geocoder();
      //주소 변수설정 
      var hAddress =  document.getElementById("hAddress").value;
      var haroundfood = hAddress.substr(3,4);
      console.log("hAddress::"+hAddress);
      console.log("haroundfood::"+haroundfood);
      // 주소로 좌표를 검색합니다
      geocoder.addressSearch(hAddress, function(result, status) {
      
          // 정상적으로 검색이 완료됐으면 
           if (status === kakao.maps.services.Status.OK) {

              var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

              // 결과값으로 받은 위치를 마커로 표시합니다
              var marker = new kakao.maps.Marker({
                  map: map,
                  position: coords
              });

              // 인포윈도우로 장소에 대한 설명을 표시합니다
              var infowindow = new kakao.maps.InfoWindow({
                  content: '<div style="width:150px;text-align:center;padding:2px;">호텔위치</div>'
              });
              infowindow.open(map, marker);

              // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
             map.setCenter(coords); 
              
          } 
      });    
      
      
      
      //숙소 주변 맛집
      // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
      var infowindow = new kakao.maps.InfoWindow({zIndex:1});
      
      
      // 장소 검색 객체를 생성합니다
      var ps = new kakao.maps.services.Places(); 
      
      // 키워드로 장소를 검색합니다
      ps.keywordSearch(haroundfood+'맛집', placesSearchCB); 
      
      // 키워드 검색 완료 시 호출되는 콜백함수 입니다
      function placesSearchCB (data, status, pagination) {
          if (status === kakao.maps.services.Status.OK) {
      
              // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
              // LatLngBounds 객체에 좌표를 추가합니다
              var bounds = new kakao.maps.LatLngBounds();
      
              for (var i=0; i<data.length; i++) {
                  displayMarker(data[i]);    
                  bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
              }       
      
          } 
      }
      
      // 지도에 마커를 표시하는 함수입니다
      function displayMarker(place) {
          // 마커를 생성하고 지도에 표시합니다
          var marker = new kakao.maps.Marker({
              map: map,
              position: new kakao.maps.LatLng(place.y, place.x) 
          });
          marker.setRange(100);
      
          // 마커에 클릭이벤트를 등록합니다
          kakao.maps.event.addListener(marker, 'click', function() {
              // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
              infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
              infowindow.open(map, marker);
          });
      }
      
</script>
<script>
    $('.slider-wrap').slick({
      slide: 'div',        //슬라이드 되어야 할 태그
      infinite : true,     //무한 반복 옵션     
      slidesToShow : 1,        // 한 화면에 보여질 컨텐츠 개수
      slidesToScroll : 1,        //스크롤 한번에 움직일 컨텐츠 개수
      speed : 500,     // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
      arrows : true,         // 옆으로 이동하는 화살표 표시 여부
      dots : false,         // 스크롤바 아래 점으로 페이지네이션 여부
      autoplay : true,            // 자동 스크롤 사용 여부
      autoplaySpeed : 1500,         // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
      pauseOnHover : true,        // 슬라이드 이동 시 마우스 호버하면 슬라이더 멈추게 설정
      vertical : false,        // 세로 방향 슬라이드 옵션
      prevArrow : "<button type='button' class='slick-prev'>이전 이미지</button>",
      nextArrow : "<button type='button' class='slick-next'>다음 이미지</button>",
      draggable : true   //드래그 가능 여부 
    });
</script>

  <!-- 정적인 페이지 포함 -->
   <%@ include file="/WEB-INF/views/template/footer.jsp"%>

</body>

</html>