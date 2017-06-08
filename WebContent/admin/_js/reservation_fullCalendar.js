function selAll(){
	//DB에 있는 예약리스트를 달력에 나타내주기위한 ajax호출 - 전체 예약리스트
		$('.cate').prop('selected','selected');
		$('.time').prop('selected','selected');
		$('.state').prop('selected','selected');
	
		$.ajax({ //DB에 있는 예약리스트를 달력에 나타내주기위한 ajax호출 - 전체 예약리스트
		    url: 'admin/reservation/ad_reser_selDBall.jsp',
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

	function selState(){
	//DB에 있는 예약리스트를 달력에 나타내주기위한 ajax호출 - 예약상태별 예약리스트
		$('.time').prop('selected','selected');
		$('.cate').prop('selected','selected');
		
		var state = $('#state').val();
		if(state=='예약상태별') selAll();
		else{
	 		$.ajax({ 
			    type: 'POST',
			    url: 'admin/reservation/ad_reser_selDBstate.jsp',
			    data: ({state:state}),
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
	}
	function selCate(){
	//DB에 있는 예약리스트를 달력에 나타내주기위한 ajax호출 - 시간별 예약리스트
		$('.time').prop('selected','selected');
		$('.state').prop('selected','selected');
		
		var cate = $('#cate').val();
		if(cate=='카테고리별') selAll();
		else{
	 		$.ajax({ 
			    type: 'POST',
			    url: 'admin/reservation/ad_reser_selDBcate.jsp',
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
	}

	function selTime(){
	//DB에 있는 예약리스트를 달력에 나타내주기위한 ajax호출 - 카테고리별 예약리스트
		$('.cate').prop('selected','selected');
		$('.state').prop('selected','selected');
		
		var rFTime = $('#rFTime').val();
		if(rFTime=='시간별') selAll();
		else{
			$.ajax({ 
			    type: 'POST',
			    url: 'admin/reservation/ad_reser_selDBtime.jsp',
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
	}

	$(document).ready(function() { //window.onload와 같은 것
		$.ajax({ //DB에 있는 예약리스트를 달력에 나타내주기위한 ajax호출 - 전체 예약리스트
		    url: 'admin/reservation/ad_reser_selDBall.jsp',
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