$(function() {
	
		//마우스 오버 시 한줄 표시 ON
		$("#reserList #tableData td").mouseenter(function () {
			$(this).closest('tr').css("background-color", "#D8D8D8").css('cursor', 'pointer');
		});
	
		//마우스 오버 해제 시 표시 제거
		$("#reserList #tableData td").mouseleave(function () {
			$(this).closest('tr').css("background-color", "#ffffff").css('cursor', 'default');
		});
	
		//마우스 커서 표시 ON
		$("select, #btnSet input").mouseenter(function () {
			$(this).css('cursor', 'pointer');
		});
	
		//마우스 커서 표시 OFF
		$("select, #btnSet input").mouseleave(function () {
			$(this).css('cursor', 'default');
		});
	
		//행 선택시 반응
		$(function () {
			var td = $('#reserList #tableData');
			td.each(function () {
				$(this).click(function () {
					var rNO = $(this).children('td:nth-child(1)').text(); //rNO가져오기
					$(location).attr('href', 'reser_mod.do?reser=rInfo&rNO=' + rNO); //제이쿼리 로케이션 이동!
				})
			})
		});
	});