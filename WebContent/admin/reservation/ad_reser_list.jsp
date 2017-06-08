<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- fullCalendar 스타일 -->
<link href='admin/_css/fullcalendar.min.css' rel='stylesheet'/>
<link href='admin/_css/fullcalendar.print.min.css' rel='stylesheet' media='print'/>
<link href='admin/_css/reservation_list.css' rel='stylesheet'/>
<!-- fullCalendar JS -->
<script src='admin/_js/moment.min.js'></script>
<script src='admin/_js/jquery.min.js'></script>
<script src='admin/_js/fullcalendar.min.js'></script>
<script src="admin/_js/reservation_fullCalendar.js" rel="script" type="text/javascript"></script>

<%-- ad_reser_list.jsp(관리자용: 예약목록출력 - 달력) --%>
<center>
	<p><img alt="예약목록" src="admin/_images/ad_reser_list.PNG"></p>
	
	<!-- <button class="btSty" onclick="selAll()">전체보기</button> -->
	<select id='rFTime' onchange="selTime()">
		<option class="time">시간별</option>
		<option value="09:30">(오전예약) 09:30-10:00</option>
		<option value="10:30">(오전예약) 10:30-11:00</option>
		<option value="11:30">(오전예약) 11:30-12:00</option>
		<option value="13:30">(오후예약) 13:30-14:00</option>
		<option value="14:30">(오후예약) 14:30-15:00</option>
		<option value="15:30">(오후예약) 15:30-16:00</option>
		<option value="16:30">(오후예약) 16:30-17:00</option>
		<option value="17:30">(오후예약) 17:30-18:00</option>
	</select>
	<select id='cate' onchange="selCate()">
		<option class="cate">카테고리별</option>
		<option>눈성형</option>
		<option>코성형</option>
		<option>안면윤곽성형</option>
		<option>가슴성형</option>
		<option>체형성형</option>
	</select>
	<select id='state' onchange="selState()">
		<option class="state">예약상태별</option>
		<option value="1">예약대기</option>
		<option value="2">예약완료</option>
		<option value="3">예약취소</option>
	</select>
	
	<div id='calendar'></div>
</center>