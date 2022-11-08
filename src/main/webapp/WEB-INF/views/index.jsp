<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="shortcut icon" type="image/x-icon"
   href="resources/together.ico" />

<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" type="text/css"
   href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
   integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
   crossorigin="anonymous"></script>
<script type="text/javascript"
   src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<%
request.setCharacterEncoding("utf-8");
String title = request.getParameter("title");
if (title == null || title.isEmpty()) {
   title = "Welcome to the KoreaHotel";
}
pageContext.setAttribute("title", title);
%>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Inconsolata">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
   src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>
@import
   url('https://fonts.googleapis.com/css2?family=Secular+One&display=swap')
   ;

@import
   url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&display=swap')
   ;

@font-face {
   font-family: 'HSYuji-Regular';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/HSYuji-Regular.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}

@
keyframes waviy { 0%,40%,100%{
   transform: translateY(0);
}

20
%
{
transform
:
translateY(
-20px
)
}
}
.ALLALL {
   font-family: 'HSYuji-Regular', sans-serif;
   /*  background-color: #fdfbf4; */
   background-color: #fdf7f4;
   width: 1900px;
}

.silder-title {
   font-family: 'HSYuji-Regular', sans-serif;
}

.main {
   display: flex;
   margin: 0px;
   padding: 0px;
   width: 1900px;
}

html {
   overflow-x: auto;
   width: 1900px;
}
/*----------------------------메인 Board , login%out !!!!!!!!!-----------------------------------------*/
.header-wrap {
   position: absolute;
   top: 0;
   text-align: center;
   width: 1000px;
   margin-top: 0px;
   z-index: 10;
}

.center-tab>a:hover {
   color: black;
}

#loginout {
   flex: 1;
   margin-bottom: 22px;
   text-decoration: none;
}

#loginout:hover {
   color: #ff5e62;
}

/* .footer-wrap {
         width: 100%;
        height: 200px;
        background-color: rgb(30,30,30);
        left: 0; 
        bottom: 0;
   } */
.footer {
   height: 200px;
   width: 100%;
   padding: 30px 0 30px 0;
   font-size: 13px;
   color: white;
   background-color: rgb(30, 30, 30);
   bottom: 0;
}

.footer .footer_menu {
   margin-bottom: 20px;
}

.footer ul {
   overflow: hidden;
   margin: 0 auto;
   width: 100%;
   text-align: center;
   margin-top: 10px;
}

.footer ul li {
   display: inline;
   margin: 0;
   height: 10px;
}

.footer ul.footer_menu li {
   padding-right: 15px;
}

.footer ul.company_info li {
   padding-right: 5px;
}

.footer ul.footer_menu li:after {
   content: '';
   width: 1px;
   height: 10px;
   background: #2e2e2e;
   display: inline-block;
   margin-left: 20px;
}

.footer ul.company_info li:after {
   content: '';
   width: 1px;
   height: 10px;
   background: #2e2e2e;
   display: inline-block;
   margin-left: 10px;
}

.footer ul li:last-child:after {
   display: none;
}

.footer p {
   text-align: center;
   margin-top: 10px;
}

.footer-img {
   width: 30px;
}

.footer-wrap .footer-content {
   color: rgb(170, 170, 170);
   column-count: 2;
   column-gap: 40px;
   font-weight: 300;
   width: 900px;
   margin: auto;
   padding: 50px 0 0 0;
}

.footer-bottom {
   bottom: 0;
   height: 20px;
   width: 100%;
   text-align: center;
   color: rgb(220, 220, 220);
   background-color: rgb(60, 60, 60);
}

.dropdown {
   position: relative;
   display: flex;
   flex: 1;
   align-items: center;
   justify-content: center;
}

.dropdown-content {
   display: none;
   position: absolute;
   background-color: rgba(0, 0, 0, 0.6);
   width: 150px;
   box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
   padding: 12px 16px;
}

.dropdown-content a {
   color: white;
   margin: 0 20px 40px 20px;
   text-shadow: 0px 0px 0px;
   font-weight: lighter;
}

.dropdown:hover .dropdown-content {
   display: block;
}

.dropdown-content a:hover {
   text-decoration: underline;
}

.dropdown:hover .dropdown-content {
   display: block;
   display:
}

.dropdown:hover .dropbtn {
   background-color: rgb(190, 190, 190);
}

.test_1 {
   width: 100%;
   height: 100%;
   display: none;
   z-index: 200;
   position: fixed;
}

.test_1.open {
   display: block;
}

.test_1.open:before {
   content: '';
   width: 100%;
   height: 100%;
   z-index: 25;
   position: fixed;
   background: black;
   opacity: 0.4;
   top: 0;
}

.test_1 .test_2 {
   position: fixed;
   margin: auto;
   top: 50%;
   z-index: 30;
   background: white;
   left: 50%;
   width: 450px;
   padding: 20px 45px 50px;
   height: 600px;
   margin-top: -268px;
   margin-left: -255px;
}

.login-box h1 {
   text-align: center;
}

.login-text {
   width: 360px;
   height: 47px;
   padding-left: 20px;
   border: 1px solid #d9d9d9;
   margin: 0 0 10px;
   font-size: 14px;
}

.find {
   float: right;
}

#loginButton {
   border: none;
   width: 360px;
   padding: 10px 0;
   background: black;
   color: white;
   margin: 10px 0;
}

#loginButton:hover {
   outline: none;
   background: #5A5A5A;
}

#mypage:hover {
   color: #ff5e62;
}

#registerButton {
   border: none;
   width: 360px;
   padding: 10px 0;
   background: #E3EAF3;
   margin: 0 0 10px
}

#registerButton:hover {
   outline: none;
   background: #A4CAED;
}
/*    a {text-decoration: none; font-size: 0.9em; color: black;} */
.pop-up-close {
   border: none;
   position: absolute;
   top: -20.5px;
   right: -20px;
   width: 40px;
   height: 41px;
   text-indent: -9999px;
   background-color: transparent;
   background-image: url(resources/x-button.png);
   background-repeat: no-repeat;
   background-size: 100%;
   background-position: center;
}

/*----------------------------메인 Board , login%out !!!!!!!!!-----------------------------------------*/

/* ------------------------체크인 박스-------------------------*/
.reservation-box {
   /* margin: 300px 400px; */
   border: 1px solid #ff5e62;
   padding: 5px;
   background: #ff5e62;
   margin-top: 24px;
   margin-left: 500px;
   width: 50%;
   flex: 3;
}

.reservation-box #logo {
   width: 200px;
}

.dropdown a:hover {
   color: black;
}

.dropdown  a {
   color: white;
   text-shadow: 2px 2px 2px gray;
   text-decoration: none;
   font-size: 25px;
   font-weight: bold;
}

.reservation-box-form {
   background: white;
   width: 100%;
   margin: 0;
   display: flex;
}

.footer-wrap {
   position: fixed;
   bottom: 0;
}

.login1 {
   position: relative;
   display: flex;
   flex: 1;
   align-items: center;
   justify-content: center;
   color: white;
   text-shadow: 2px 2px 2px gray;
   text-decoration: none;
   font-size: 25px;
   font-weight: bold;
}

#reservation-box-checkIn-div {
   width: 40%;
}

#reservation-box-checkOut-div {
   width: 40%;
}

#reservation-box-selectBtn-div {
   width: 20%;
   text-align: center;
}

#reservation-box-checkIn {
   width: 100%;
   border: none;
   text-align: center;
   font-size: 16px;
}

#reservation-box-checkOut {
   width: 100%;
   border: none;
   text-align: center;
   font-size: 16px;
}

#reservation-box-checkIn:focus {
   outline: none;
}

#reservation-box-checkOut:focus {
   outline: none;
}

#reservation-box-selectBtn {
   border: none;
   margin: auto;
   width: 101%;
   height: 100%;
   background: #ff5e62;
   color: white;
}
/* ------------------------체크인 박스 끝!!!!-------------------------*/

/* ------------------------중간 슬라이더!!!!-------------------------*/
.sliderAll {
   margin-top: 10px;
   display: flex;
}

.aaa {
   height: 220px;
   width: 0px;
   flex: 1;
   background-color: rgb(252, 232, 232);
}

section#cat2 {
   float: left;
   width: 520px;
   flex: 2;
}

.bbb {
   height: 220px;
   width: 100px;
   flex: 1;
   background-color: rgb(252, 232, 232);
}

/* ------------------------중간 슬라이더 끝!!!!-------------------------*/

/* ------------------------슬라이더 3개 !!!!!!!!-------------------------*/
.post-slider {
   width: 70%;
   margin: 0px auto;
   position: relative;
}

.waviy {
   color: #696969;
   position: relative;
   -webkit-box-reflect: below -20px
      linear-gradient(transparent, rgba(0, 0, 0, .2));
   font-size: 20px;
}

.waviy span {
   position: relative;
   display: inline-block;
   color: black;
   text-transform: uppercase;
   animation: waviy 1s infinite;
   animation-delay: calc(.1s * var(- -i));
}

.next {
   position: absolute;
   top: 80%;
   right: 10px;
   font-size: 2em;
   color: gray;
   cursor: pointer;
}

.prev {
   position: absolute;
   top: 80%;
   left: 70px;
   font-size: 2em;
   color: gray;
   cursor: pointer;
}

.post-wrapper {
   width: 84%;
   height: 350px;
   margin: 0px auto;
   overflow: hidden;
   padding: 10px 0px 10px 80px;
}

.post {
   width: 300px;
   height: 300px;
   margin: 0px 10px;
   display: inline-block;
   background: white;
   border-radius: 5px;
}

.post-info {
   font-size: 15px;
   height: 30%;
   padding-left: 10px;
}

#more, .silder-title {
   display: inline-block;
}

#more {
   float: right;
   text-decoration: none;
   margin-top: 35px;
}
/* ------------------------슬라이더 3개  끝!!!!!!!!-------------------------*/

/* ------------------------슬라이더 3개 !!!!!!!!-------------------------*/
.post-slider1 {
   width: 70%;
   margin: 0px auto;
   position: relative;
}

.next1 {
   position: absolute;
   top: 70%;
   right: 10px;
   font-size: 2em;
   color: gray;
   cursor: pointer;
}

.prev1 {
   position: absolute;
   top: 70%;
   left: 70px;
   font-size: 2em;
   color: gray;
   cursor: pointer;
}

.post-wrapper1 {
   width: 84%;
   height: 350px;
   margin: 0px auto;
   overflow: hidden;
   padding: 20px 0px 10px 180px;
}

.post1 {
   width: 300px;
   height: 300px;
   margin: 0px 10px;
   display: inline-block;
   background: white;
   border-radius: 5px;
}

.post-info1 {
   font-size: 15px;
   height: 30%;
   padding-left: 10px;
}

.slider-image {
   width: 100%;
   height: 175px;
   border-top-left-radius: 5px;
   border-top-right-radius: 5px;
}

.bubble {
   position: relative;
   width: 285px;
   height: 120px;
   padding: 0px;
   background: #FFFFFF;
   -webkit-border-radius: 10px;
   -moz-border-radius: 10px;
   border-radius: 10px;
   padding: 20px;
}

.bubble:after {
   content: '';
   position: absolute;
   border-style: solid;
   border-width: 18px 11px 0;
   border-color: #FFFFFF transparent;
   display: block;
   width: 0;
   z-index: 1;
   bottom: -18px;
   left: 62px;
}

.fa-user {
   width: 15px;
   margin-right: 10px;
}
/* ------------------------슬라이더 3개 끝 !!!!!!!!-------------------------*/
a.btn {
   list-style-type: none;
   display: block;
   background: #f08080;
   color: ff5e62;
   position: relative;
   text-transform: uppercase;
   letter-spacing: 0.1em;
   text-align: center;
   padding: 5px;
   transition: 250ms;
   text-decoration: none;
   font-weight: bold;
}

a.btnkakao {
   background: rgba(255, 233, 0);
}

a.btn:hover {
   background: #fffbd5;
   transition: 100ms;
}

.one {
   width: 100px;
   height: 100px;
   margin: 0 auto;
}

#logo {
   width: 100px;
   height: 100px;
}
/*----------------------------사이드 퀵바-----------------------------------------*/
.fixed {
   position: fixed;
   bottom: 200px;
   right: 50px;
   z-index: 10;
}

.chat-content {
   background-color: transparent;
   padding: 10px;
   border-radius: 10px;
   -webkit-box-shadow: 3px 5px 10px #999999;
   box-shadow: 3px 5px 10px #999999;
   -webkit-animation: chat 1s infinite;
   animation: chat 1s infinite;
   cursor: pointer;
   display: -webkit-box;
   display: -ms-flexbox;
   display: flex;
   -webkit-box-orient: vertical;
   -webkit-box-direction: normal;
   -ms-flex-direction: column;
   flex-direction: column;
   text-align: center;
}

.chat-content .chat__call {
   margin-bottom: 20px;
}

.chat-content .chat__call .callIcon, .chat-content, .chat__aboutUs,
   .chat__roomInfo, .chat__reservation {
   color: black;
   font-size: 20px;
   text-decoration: none;
}

.ssss {
   margin: 0px;
   padding: 0px;
}

/*----------------------------사이드 퀵바 끝!!!!!!!!!-----------------------------------------*/
</style>
<!-- 송지섭 -->

<script>
   // 카카오 초기화
   Kakao.init('6f3e6622db3f5814e8e191da89d96838');
   function loginWithKakao() {
      Kakao.Auth.authorize({
         redirectUri : 'http://localhost:8080/sevenfactory/loginKakao', /* redirect되는 URL */
         scope : 'profile_nickname' /* 전달 받을 정보 */
      })
   }
   function createHiddenLoginForm(kakaoId) {
      var frm = document.createElement('form');
      frm.setAttribute('method', 'post');
      frm.setAttribute('action', 'loginKakao');
      var hiddenInput = document.createElement('input');
      hiddenInput.setAttribute('type', 'hidden');
      hiddenInput.setAttribute('name', 'userid');
      hiddenInput.setAttribute('value', kakaoId);
      frm.appendChild(hiddenInput);
      document.body.appendChild(frm);
      frm.submit();
   }
</script>

<!-- 송지섭 -->
<script>
   var today = new Date();
   function fn_selectReservation(f) {

      if (f.rCheckIn.value == '' || f.rCheckOut.value == '') {
         alert('체크인 날짜와 체크아웃 날짜를 선택해 주세요.');
         f.rCheckIn.focus();
      } else if (f.rCheckIn.value > f.rCheckOut.value) {
         alert('체크인 날짜보다 체크아웃 날짜가 빠를 수 없습니다.');
         f.rCheckOut.focus();
      } else if (new Date(f.rCheckIn.value) < today) {
         alert('지날 날짜와 당일 예약은 불가능합니다.');
         f.rCheckIn.focus();

      } else if (f.rCheckIn.value == f.rCheckOut.value) {
         alert('체크인 날짜와 체크아웃 날짜가 같을 수 없습니다.');
         f.rCheckOut.focus();
      } else {
         f.action = "selectBookable";
         f.submit();
      }
   }
   var ht = null;
   (function(id, scriptSrc, callback) {
      var d = document, tagName = 'script', $script = d
            .createElement(tagName), $element = d
            .getElementsByTagName(tagName)[0];
      $script.id = id;
      $script.async = true;
      $script.src = scriptSrc;
      if (callback) {
         $script.addEventListener('load', function(e) {
            callback(null, e);
         }, false);
      }
      $element.parentNode.insertBefore($script, $element);
   })/* ('happytalkSDK',
         'https://design.happytalkio.com/sdk/happytalk.chat.v2.min.js',
         function() {
            ht = new Happytalk({
               siteId : '4000002422',
               siteName : 'Together',
               categoryId : '151348',
               divisionId : '151349'
            });
         }) */;
   window.kakaoAsyncInit = function() {
       Kakao.Channel.createChatButton({
         container: '#kakao-talk-channel-chat-button',
       });
     };

     (function(d, s, id) {
       var js, fjs = d.getElementsByTagName(s)[0];
       if (d.getElementById(id)) return;
       js = d.createElement(s); js.id = id;
       js.src = 'https://t1.kakaocdn.net/kakao_js_sdk/2.0.0/kakao.channel.min.js';
       js.integrity = 'sha384-qN6njjEgLQzM0N/uuB26JXrlFnwdctF+owkJc/pTqUpi1Qrp9xAvRKYIkzH5XcJU';
       js.crossOrigin = 'anonymous';
       fjs.parentNode.insertBefore(js, fjs);
     })(document, 'script', 'kakao-js-sdk');
   
</script>
<!-- 중간슬라이더 -->
<script>
        //웹 페이지가 시작할때 사용되는 기본값 설정
        $(document).ready(function(){
           $("#cat2").css("background-color","rgb(252,232,232)");
            let width = 900;
            let height = 220;
            let current = 0;

            //다시 처음부터 움직일수 있게 인터벌사용 - 커렌트값을 증가 또는 0으로 만들어주는 기능을 가진함수
            setInterval(function(){
                    current = current + 1;
                    current = current % imageLength;
                    moveTo();
                },3000); //1000단위당 1초
            //1초마다 커렌트값이 1씩 증가하면서 커*위 
            const moveTo = function(){
                $('.images').animate({
                    left: -current * width   
                },1000);
            };
            const imageLength = $('.slider').find('.image').length;
            
                $('.slider').css({
                    position: 'relative',
                    width: width,
                    height: height,
                    overflow: 'hidden'
                });
                $('.images').css({
                    position: 'absolute',
                    width: width * imageLength
                    
                });
                $('.image').css({
                    margin: 0,
                    padding: 0,
                    width : width,
                    height: height,
                    float: 'left'
                });
        });
    </script>
<!-- 중간슬라이더 끝 -->
<!-- 로그인 팝업 -->
<script type="text/javascript">
   var filename;
   
   
   
   
   function aa() {
    //캡차 갖고오는 메소드
      //$('.test_1').css("display","block");
      $('.test_1').addClass('open');

      $.ajax({
         url : 'getImage',
         type : 'POST',
         dataType : 'JSON',
         success : function(data) {
            filename = data.filename;
            $('#getchaImg').attr("src", "resources/storage/" + filename);
         },
         error : function() {
            alert('AJAX 통신이 실패했습니다1.');
         }
      });
   }

   function cc() {
    //캡차 실패했을 캡차 input을 포커스하는 메소드
      $.ajax({
         url : 'getImage',
         type : 'POST',
         dataType : 'JSON',
         success : function(data) {
            filename = data.filename;
            $('#getchaImg').attr("src", "resources/storage/" + filename);
         },
         error : function() {
            alert('AJAX 통신이 실패했습니다1.');
         }
      });
      $('#input_key').val('');
      $('#input_key').focus();
   }

   function bbb() {
      $('.test_1').removeClass('open');
      //$('.test_1').css("display","none");
   }

   $(document).ready(function() {
      // 아이디 기억하기 ------------------------------------------------------------------인재
      // savedIN에 savedID라는 쿠키를 가지고와서 저장()

      var savedID = getCookie("savedID");
      $('#login_mId').val(savedID);

      // savedID 가 있으면, 체크박스를 체크 상태로 유지
      if ($('#login_mId').val() != '') {
         $('#saveIDCheck').attr('checked', true);
      }

         // 체크박스의 상태가 변하면,
      // 즉 체크박스가 변하거나 키보드에 입력할 때, 쿠키를 7일간 저장시키는 기능
      $('#saveIDCheck').change(function() {
       // 체크되어 있다
      // 쿠키를  #login_mId에 있는 벨류를 saved아이디에 넣고 7일간 유지시키는 메소드
         if ($('#saveIDCheck').is(':checked')) {
            setCookie("savedID", $('#login_mId').val(), 7); // 7일간 쿠키에 보관
         }
            // 체크해제되어 있다.
         // 쿠키삭제하는 메소드
         else {
            deleteCookie("savedID");
         }
      });

         // 아이디를 입력할 때
      // login_mid의 키보드에 입력할 떄 
      $('#login_mId').keyup(function() {
         // 체크되어 있다
         // savedIDCheck가 체크 되어있다면 즉 , saved ID가 있다면
         if ($('#saveIDCheck').is(':checked')) {
            // sabrdId에 login_mId에 저장 후 7일간 유지시키는 메소드
            setCookie("savedID", $('#login_mId').val(), 7); // 7일간 쿠키에 보관
            
         }
      });
   });
   //-----------------------------------------------------------------------------------끝
   // logout 메서드로 이동시키는 기능 //--------------------------------------------------------------송인재
   function fn_logout() {
      location.href = 'logout';
   }
   // loginCheck로 포스트 방식으로 매핑시키고 JSON형태로 반환한다. 그리고 input_key에 input_key에 입력된 값을 전달한다.
   function fn_login(f) {
      $.ajax({
         url : 'loginCheck',
         type : 'POST',
         dataType : 'JSON',
         data : 'input_key=' + $('#input_key').val(),
      // 매개변수로 data를 넘기는 function이 성공한다면 -> 즉 통신이 된다면
         success : function(data) {
           // 만약에 data의 result 값이 true면 ajax 로그인으로 매핑을 포스트 방식을 이용하여 json으로 리턴 그리고 mId와 mPw에 값 대입
            if (data.result == true) {
               $.ajax({
                  url : 'login',
                  type : 'POST',
                  dataType : 'JSON',
                  data : 'mId=' + $('#login_mId').val() + '&mPw='
                        + $('#login_mPw').val(),
                  success : function(data) {
                  // 만약 데이터의 결과값이 yes가 아니면 즉 no라면 
                  // 속의 if로 들어가라
                  // data-result가 만약 deleted라면 탈퇴한 회원이라는 알럿을 뛰어라
                     if (data.result != 'YES') {
                        if (data.result == 'DELETED') {
                           alert('탈퇴한 회원입니다.');
                        } 
                  // 만약 탈퇴한 회원이 아니라면 아이디와 비밀번호 중 하나를 틀린거니깐 알럿을 띄우고 로그인 비밀번호와 캡차 input을 초기화 한 후 pw로 포커스를 넘긴다.
                  // 그 후에 캡차 이미지를 다시 가져온다.
                        else {
                           alert('로그인 실패 아이디와 비밀번호를 확인하세요.');
                        }
                        $('#login_mPw').val('');
                        $('#input_key').val('');
                        $('#login_mPw').focus();
                        cc();
                  // 만약 data-result가 yes라면 -> 다시 리로드해라
                     } else {
                        location.reload();
                     }
                  },
             // 애초에 success로 못 넘어간다면 ajax 통신이 실패함을 뛰어라
                  error : function() {
                     alert('AJAX 통신이 실패했습니다.2');
                  }
               });
            } 
         // 만약에 그림의 인증번호화 입력하신 인증번호가 다르다면 -> 캡차의 틀림을 의미하고 비운 후 포커스를 맞추고 다시 불러와라
            else {
               alert('그림의 인증번호와 입력하신 인증번호가 다릅니다.');
               $('#input_key').val('');
               $('#input_key').focus();
               cc();
            }
         },
         error : function() {
            alert('AJAX 통신이 실패했습니다.2');
         }
      });
   }
   <!-- 로그인 팝업 끝-->
    //카카오 로그인
   //Kakao.Auth.setAccessToken('${ACCESS_TOKEN}');
   // 1. 쿠키 만들기
   // setCookie(cookieName, value, exdays)
   // exDate라는 date 객체를 생성한다.
   // exdate에 getDate를 씀으로써 현재의 날짜를 세팅하고 그 후에 exdays라는 지정한 날짜를 추가한다.
   // 그로인해 쿠키가 유지되는 날짜를 지정한다.
   // cookieValue = escape(value) -> 벨류를 린다.
   // exdays=null이라면 빈 값을 추가하고, 아니라면 exdate라는 날짜를 GMTString() -> 한국 표준 날짜를 문자화 한것으로 추가하여 기간을 붙인다.
   // cookie에 cookieName에 쿠키 밸류의 값을 부여한다.
   // 만료일자를 설정하여 쿠키 벨류에 넣고 웹의 쿠키에 쿠키이름과 쿠키밸류를 추가한다.
   function setCookie(cookieName, value, exdays) {
      var exdate = new Date();
      exdate.setDate(exdate.getDate() + exdays);
      var cookieValue = escape(value)
            + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
      document.cookie = cookieName + "=" + cookieValue;
   }
   // 2. 쿠키 삭제
   // 쿠키를 삭제하는 메소드가 없기에 쿠키의 만료일을 오늘 하루 전으로 설정하여 이미 종료됐음을 알린다.
   function deleteCookie(cookieName) {
      var expireDate = new Date();
      expireDate.setDate(expireDate.getDate() - 1);
      document.cookie = cookieName + "= " + "; expires="
            + expireDate.toGMTString();
   }

   // 3. 쿠키 가져오기
   function getCookie(cookieName) {
      cookieName = cookieName + "=";
      var cookieData = document.cookie;
      var start = cookieData.indexOf(cookieName);
      var cookieValue = "";
      if (start != -1) {
         start += cookieName.length;
         var end = cookieData.indexOf(";", start);
         if (end == -1) {
            end = cookieData.length;
         }
         cookieValue = cookieData.substring(start, end);
      }
      return unescape(cookieValue);
   }
   function getCookie(cookieName) {
      cookieName = cookieName + "=";
      var cookieData = document.cookie;
      var start = cookieData.indexOf(cookieName);
      var cookieValue = "";
      if (start != -1) {
         start += cookieName.length;
         var end = cookieData.indexOf(";", start);
         if (end == -1) {
            end = cookieData.length;
         }
         cookieValue = cookieData.substring(start, end);
      }
      return unescape(cookieValue);
   }
   
</script>




<!-- 동적인 페이지 포함 -->
<div class="ALLALL">
   <div class="one">
      <a href="main"><img id="logo" alt="logo"
         src="resources/logo/logogo.png" /></a>
   </div>
   <!-- 사이드퀵 -->
   <div class="fixed">
      <div class="chat-content">
         <!-- <a class="chat__call">AboutUs</a> -->
         <!-- <a class="chat__kakao">채팅</a> -->
         <a href="hotelInfo" class="chat__aboutUs">AboutUs</a> <a
            href="reservation" class="chat__reservation">Reservation</a><br />
         <div style="cursor: pointer;" onclick="window.scrollTo(0,0);">
            <img src="resources/top.png" style="width: 30px; height: 30px;">
         </div>
         <c:if test="${loginDTO.mRight eq 1}">
              <a href="noticeBoardInsertPage" >공지사항쓰기</a>
           </c:if>
         <div
  id="kakao-talk-channel-chat-button"
  data-channel-public-id="_xgqxoCxj"
  data-title="consult"
  data-size="small"
  data-color="yellow"
  data-shape="pc"
  data-support-multiple-densities="true"
></div>
      </div>

   </div>
   <!-- 사이드퀵 끝-->
   <!-- -------------------------------------------------체크인 체크아웃---------------------------------------------- -->
   <div class="main">
      <div class="reservation-box">
         <form class="reservation-box-form">
            <div id="reservation-box-checkIn-div">
               체크인<br /> <input id="reservation-box-checkIn" type="date"
                  name="rCheckIn" />
            </div>
            <div id="reservation-box-checkOut-div">
               체크아웃<br /> <input id="reservation-box-checkOut" type="date"
                  name="rCheckOut" />
            </div>
            <div id="reservation-box-selectBtn-div">
               <input id="reservation-box-selectBtn" type="button" value="객실검색"
                  onclick="fn_selectReservation(this.form)">
            </div>
         </form>

      </div>

      <div class="dropdown">
         <a>Board▼</a>
         <div class="dropdown-content">
            <a href="noticeBoardListPage">Notice</a> <a href="qnaBoardList">QNA</a>
            <a href="ReviewBoardListPage">Review</a>
         </div>
      </div>
      <div class="login1">
         <c:if test="${loginDTO.mRight eq 1 or loginDTO.mRight eq 2}">
            <a href="adminMain">Member Management</a>
         </c:if>
         <!--  loginDTO.mRight ne 1이면 일반회원임-->
         <c:if test="${loginDTO ne null and loginDTO.mRight ne 1  and loginDTO.mRight ne 2}">
            <a href="goMyPage"
               style="margin-right: 70px; margin-left: -20px; text-decoration: none;"
               id="mypage">MyPage</a>
         </c:if>
         <c:if test="${loginDTO eq null }">
            <a id="loginout" href="javascript:void(0);" style="float: right;"
               onclick="aa()"><i class="fas fa-bone"></i><br />LOGIN</a>
         </c:if>
         <c:if test="${loginDTO ne null }">
            <a id="loginout" href="javascript:void(0);" style="float: right;"
               onclick="fn_logout()"><i class="fas fa-bone"></i><br />LOGOUT</a>
         </c:if>
      </div>

   </div>
   <!-- 체크인 체크아웃 끝-->

   <!-- 중간 큰 슬라이더 -->
   <div class="sliderAll">
      <div class="aaa"></div>
      <div class="ssss" style="position: relative;">
         <section id="cat2" class="slider">
            <div class="images">
               <img class="image" src="resources/assets/hotel_img/event1_r.png">
               <img class="image" src="resources/assets/hotel_img/event2_r.png">
               <img class="image" src="resources/assets/hotel_img/event3_r.png">
            </div>
         </section>
      </div>
      <div class="bbb"></div>
   </div>
   <!-- 중간 큰 슬라이더 끝 -->
   <!-- -----------------------첫번째 줄 슬라이더------------------------------------ -->
   <div class="page-wrapper" style="position: relative;">
      <!--page slider -->
      <div class="post-slider">
         <h3 class="waviy silder-title">
            <span style="-i: 1">인 </span> <span style="-i: 2">기</span> <span
               style="-i: 3">호</span> <span style="-i: 4">텔</span> <span
               style="-i: 5">T</span> <span style="-i: 6">O</span> <span
               style="-i: 7">P</span> <span style="-i: 8">-</span> <span
               style="-i: 9">1</span> <span style="-i: 10">0</span>
         </h3>
         <i class="fas fa-chevron-left prev"></i> <i
            class="fas fa-chevron-right next"></i>
         <div class="post-wrapper">
            <c:forEach var="hDTO" items="${list }">
               <div class="post">
                  <img alt="${hDTO.hName }"
                     src="resources/assets/hotel_img/${hDTO.hThumbnail }.png"
                     class="slider-image">
                  <div class="post-info">
                     <h4 style="margin: 0px;">
                        <a href="#" class="post-subject">${hDTO.hName }</a>
                     </h4>
                     ${hDTO.hAddress}

                  </div>
                  <a href="reservation" class="btn" style="color: white;">예약하기</a>
               </div>
            </c:forEach>
         </div>
      </div>
      <!-- -----------------------첫번째 줄 슬라이더 끝!!!!------------------------------------ -->

      <!-- -----------------------두번쨰 줄 슬라이더------------------------------------ -->
      <div class="page-wrapper1">
         <!--page slider -->
         <div class="post-slider1">

            <h3 class="waviy silder-title">
               <span style="-i: 1">투 </span> <span style="-i: 2">개</span> <span
                  style="-i: 3">더</span> <span style="-i: 4">예</span> <span
                  style="-i: 5">약</span> <span style="-i: 6">순</span> <span
                  style="-i: 7">위</span> <span style="-i: 8">-</span> <span
                  style="-i: 9">1</span> <span style="-i: 10">0</span>
            </h3>
            <a href="http://localhost:8080/sevenfactory/ReviewBoardListPage"
               id="more">리뷰 더보기</a> <i class="fas fa-chevron-left prev1"></i> <i
               class="fas fa-chevron-right next1"></i>
            <div class="post-wrapper1">
               <c:forEach var="rDTO" items="${list2 }">
                  <div class="post22">
                     <div class="bubble">

                        <b>${rDTO.rTitle }</b><br /> <a>${rDTO.rContent }</a>
                     </div>
                     <div class="post-info">
                        <h4 style="margin: 0px;"></h4>
                        <br /> <i class="far fa-user" style="height: 5%;">${rDTO.mId}
                        </i><br /> <br />

                        <c:forEach var="rating" varStatus="status" begin="1"
                           end="${rDTO.rRating }">
                           <img src="resources/together/star1.png" width="15px;"
                              style="display: inline-block" />
                        </c:forEach>
                        <c:forEach var="rating" varStatus="status" begin="1"
                           end="${5-rDTO.rRating }">
                           <img src="resources/together/star2.png" width="15px;"
                              style="display: inline-block" />
                        </c:forEach>
                        <br /> <br /> <a>${rDTO.gName }</a>
                     </div>
                  </div>
               </c:forEach>
            </div>
         </div>
      </div>
      <!-- -----------------------두번쨰 줄 슬라이더 끝!!!!!!------------------------------------ -->

      <div class="main-footer">
         <div class="main-wrap">

            <div class="test_1">

               <div class="test_2">
                  <div id="login" class="login-box">
                     <form method="POST">
                        <h1>LOGIN</h1>
                        <br /> 
                        <input class="login-text" id="login_mId" type="text" name="login_mId" placeholder="아이디" autofocus /><br />
                         <input class="login-text" id="login_mPw" type="password" name="login_mPw" placeholder="비밀번호" /><br />
                          <input id="saveIDCheck" type="checkbox" name="saveIDCheck" value="true" checked />아이디 기억하기 <img id="getchaImg" src="" style="width: 360px; height: 120px;" /> 
                           <input id="input_key" type="text" name="input_key" style="margin-top: 5px;" /> <a href="javascript:void(0);" onclick="cc()">
                            <i class="fas fa-redo-alt">새로고침</i></a> <br />
                             <input id="loginButton" type="button" value="로그인" onclick="fn_login(this.form)" />
                              <a class="btn btnkakao" id="kakao-login-btn" style="text-align: center;" href="javascript:loginWithKakao()">카카오 로그인/회원가입</a>
                               <input id="registerButton" type="button" value="회원가입" onclick="location.href='registerPage'" />
                        <div class="find">
                           <a href="findIdPage">아이디 찾기</a>&nbsp;|&nbsp; <a
                              href="findPwPage">비밀번호 찾기</a><br />
                        </div>
                        <a href="findReservationNumber">비회원 예약확인</a><br />
                     </form>
                  </div>
                  <button class="pop-up-close" onclick="bbb()"></button>
               </div>
            </div>
         </div>
      </div>
   </div>

   <!-- 슬라이더 스크립트 -->
   <script>
   $('.post-wrapper').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 2000,
        nextArrow:$('.next'),
        prevArrow:$('.prev'),
      });
   
   $('.post-wrapper1').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 2000,
        nextArrow:$('.next1'),
        prevArrow:$('.prev1'),
      });
</script>


   <!-- 정적인 페이지 포함 -->
   <%@ include file="/WEB-INF/views/template/footer.jsp"%>