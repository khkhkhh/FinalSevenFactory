<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset='utf-8' />
	<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/sellerheader.jsp" />
<jsp:include page="/WEB-INF/views/template/sellerSide.jsp" />

<link href='resources/static/fullcalendar/main.css' rel='stylesheet' />
<script src='resources/static/fullcalendar/main.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
 <script>
  //예약관련 값 변수로 받아오기
    	 	document.addEventListener('DOMContentLoaded', function() {
    		var calendarEl = document.getElementById('calendar');
    		var result =new Array();
            var calendar = new FullCalendar.Calendar(calendarEl, {
                // Tool Bar 목록 document : https://fullcalendar.io/docs/toolbar
                headerToolbar: {
                    left: 'prevYear,prev,next,nextYear today',
                    center: 'title',
                    right: 'dayGridMonth,dayGridWeek,dayGridDay'
                },
                selectable: true,
                selectMirror: true,
                navLinks: true, // can click day/week names to navigate views
                editable: true,
                dayMaxEvents: true, // allow "more" link when too many events
                // 이벤트 객체 필드 document : https://fullcalendar.io/docs/event-object
                events: [
                	<c:forEach var="rDTO" items="${list}" >
                    {
                    		title: "예약번호:${rDTO.rNo} / 방번호:${rDTO.gNo}",
                    		start: '${rDTO.rCheckIn}',
                    		end: '${rDTO.rCheckOut}'
                    },
                    </c:forEach>
                    {
                    title: '투게더 창립일',
                    start: '2022-5-23',
                    end: '2022-5-23'
                    }
                ]
            });

            calendar.render();
        });
    </script>
  </head>
  <body>
    <div id='calendar'></div>
  </body>
</html>
<!-- 정적페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>