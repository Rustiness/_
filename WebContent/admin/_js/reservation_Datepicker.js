$(function() { //datepicker 설정
	
    $( "#datepicker" ).datepicker({
    	minDate: 1,
    	maxDate: "+1M",
        inline: true,
        showOtherMonths: true,
        showMonthAfterYear: true,
        yearSuffix: '년',
        monthNames: [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        altField : "#rDate",
        altFormat : "yy-mm-dd",
        beforeShowDay: function(date){ //토요일 & 일요일 선택 불가
			var day = date.getDay();
			return [(day != 0 && day != 6)];
		},
        
        onSelect: function(date) {  
        	$.ajax({ //날짜당 예약불가능한 시간을 출력하기위한 ajax
    		    url: 'client/reservation/reser_selDBtime.jsp',
    		    data: ({date:date}),
    		    success: function(events) {
    		    	$('option').prop('disabled',false);
   		    		$('option').attr('style','color:#7C7B7B');
    		    	
    		    	var event = events.trim().split(",");
    		    	if(event!=''){
	    		    	for(var i=0; i<event.length; i++){
	    		    		var time = event[i].split(":");
		    		    	alert('불가능시간: '+event[i]);
	    		    		$('.'+time[0]).prop('disabled',true);
	    		    		$('.'+time[0]).attr('style','color:#EAEAEA');
	    		    	}
    		    	}
        			timepicker.style.display='';
    		    },
    		    error: function(xhr) {
    	         alert('error: '+xhr.status);
    	     }
    		});
    	}
    });
});