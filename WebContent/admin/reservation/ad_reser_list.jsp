<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- fullCalendar 스타일 -->
<link href='admin/_css/fullcalendar.min.css' rel='stylesheet'/>
<link href='admin/_css/fullcalendar.print.min.css' rel='stylesheet' media='print'/>
<!-- fullCalendar JS -->
<script src='admin/_js/moment.min.js'></script>
<script src='admin/_js/jquery.min.js'></script>
<script src='admin/_js/fullcalendar.min.js'></script>
<script>
	function selAll(){
	//DB에 있는 예약리스트를 달력에 나타내주기위한 ajax호출 - 전체 예약리스트
	$('.cate').attr('selected','selected');
	$('.time').attr('selected','selected');
	
		$.ajax({ //DB에 있는 예약리스트를 달력에 나타내주기위한 ajax호출 - 전체 예약리스트
		    url: 'admin/reservation/adSelectAll.jsp',
		    dataType: 'json',
		    success: function(events) {
		    	$("#calendar").fullCalendar('removeEvents', function(eventObject) {
		            return true;
		        });
		    	$('#calendar').fullCalendar('addEventSource', events);    
		    },
		    error: function(xhr) {
	         alert('error: '+xhr.status);
	     }
		});
	}

	function selCate(){
	//DB에 있는 예약리스트를 달력에 나타내주기위한 ajax호출 - 시간별 예약리스트
	$('.time').attr('selected','selected');
	
	var cate = $('#cate').val();
	if(cate=='카테고리별') selAll();
	
		$.ajax({ 
		    type: 'POST',
		    url: 'admin/reservation/ad_reser_selDBcate.jsp?',
		    data: ({cate:cate}),
		    dataType: 'json',
		    success: function(events) {
		    	$("#calendar").fullCalendar('removeEvents', function(eventObject) {
		            return true;
		        });
		    	$('#calendar').fullCalendar('addEventSource', events);    
		    },
		    error: function(xhr) {
	         alert('error: '+xhr.status);
	     }
		});
	}

	function selTime(){
	//DB에 있는 예약리스트를 달력에 나타내주기위한 ajax호출 - 카테고리별 예약리스트
	$('.cate').attr('selected','selected');
	
	var rFTime = $('#rFTime').val();
	if(rFTime=='시간별') selAll();
	
		$.ajax({ 
		    type: 'POST',
		    url: 'admin/reservation/ad_reser_selDBtime.jsp?',
		    data: ({rFTime:rFTime}),
		    dataType: 'json',
		    success: function(events) {
		    	$("#calendar").fullCalendar('removeEvents', function(eventObject) {
		            return true;
		        });
		    	$('#calendar').fullCalendar('addEventSource', events);    
		    },
		    error: function(xhr) {
	         alert('error: '+xhr.status);
	     }
		});
	}

	$(document).ready(function() { //window.onload와 같은 것
		$.ajax({ //DB에 있는 예약리스트를 달력에 나타내주기위한 ajax호출 - 전체 예약리스트
		    url: 'admin/reservation/adSelectAll.jsp',
		    dataType: 'json',
		    success: function(events) {
		    	$('#calendar').fullCalendar('addEventSource', events);    
		    },
		    error: function(xhr) {
	         alert('error: '+xhr.status);
	     }
		});

		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay,listWeek'
			},
			navLinks: true, // can click day/week names to navigate views
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			minTime: '09:00:00',
		    maxTime: '19:00:00',
			
			allDayText: '시간', //주간, 월간
			axisFormat: 'tt hh', //주간, 월간
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일',],
			dayNamesShort: ['일','월','화','수','목','금','토',],
			
			buttonText: {
				today: '오늘',
				month: '월간',
				week: '주간',
				day: '일간',
				list: '목록'
			},
			
			views: {
		        month: {
		            titleFormat: 'YYYY년 M월'
		        },
		        week: {
		            titleFormat: 'YYYY년 M월 D일'
		        },
		        day: {
		            titleFormat: 'YYYY년 M월 D일'
		        },
		        time: {
		        	timeFormat: 'TT HH:MM'
		        }
		    },
		    
		    timeFormat: 'H:mm',
		    
			eventClick: function(event, element) {
				//이벤트를 클릭했을때, 상세보기와 수정
				var rNO = event.id;
				location.href = 'ad_reser.do?reser=arInfo&rNO='+rNO;

		    }
		});
		
	});

</script>
<style>
	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 30px;
	}

</style>
<%-- ad_reser_list.jsp(관리자용: 예약목록출력 - 달력) --%>

<!-- 예약관리에 사용하는 calendar -->
<center>
	<h3>예약목록</h3>
	목록보기종류:
	<button onclick="selAll()">전체목록</button>
	<select id='cate' onchange="selCate()">
		<option class="cate">카테고리별</option>
		<option>눈성형</option>
		<option>코성형</option>
		<option>안면윤곽성형</option>
		<option>가슴성형</option>
		<option>체형성형</option>
	</select>
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
	<div id='calendar'></div>
</center>