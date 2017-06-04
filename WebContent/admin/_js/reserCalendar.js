/* reserCalendat.js(고객용 : 예약신청 달력) */
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
	        
	        onSelect: function(dateText) {  
	        	timepicker.style.display='';
	        	/* document.getElementById("rDate").value = dateText;
	        	//alert(dateText); */
	    	}
	    });
	});
	
	/* $(function(){
		  $('#datepicker').appendDtpicker({'locale':'ko'});
		}); */
