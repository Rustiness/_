/**
 * Created
 * User: KJK
 * Date: 2017-05-30
 * Time: 오전 11:13
 */

$(document).ready(function () {

	//마우스 오버 시 한줄 표시 ON
	$("#plasTyTable #tableData td").mouseenter(function () {
		$(this).closest('tr').css("background-color", "#cccccc").css('cursor', 'pointer');
	});
  
	//마우스 오버 해제 시 표시 제거
	$("#plasTyTable #tableData td").mouseleave(function () {
		$(this).closest('tr').css("background-color", "#ffffff").css('cursor', 'default');
	});

	//행 선택시 반응
	$(function () {
		var td = $('#plasTyTable #tableData');
		td.each(function () {
			$(this).click(function () {
				var pTypeNO = $(this).children('td:nth-child(2)').text(); // pTypeNO 가져오기
				$(location).attr('href', 'ad_plasTy.do?action=info&pTypeNO=' + pTypeNO); //제이쿼리 로케이션 이동!

			})
		})
	});

	//수정시작 버튼
	$("#btnModify").click(function () {
		
		var pTypeNO = $('#ptypeNO').text(); // pTypeNO 가져오기
		
		console.log('pTypeNO : ' + pTypeNO);
		location.assign('ad_plasTy.do?action=modify&pTypeNO=' + pTypeNO);
	});

	//수정진행 버튼
	$("#btnModifyON").click(function () {
		var pTypeNO = $('[id=pTypeNO]').val(); // pTypeNO 가져오기
		
		var dataString = $("#plasModForm").serialize(); //name 집합
		
		$.ajax({
			type: "POST",
			url: "ad_plasTy.do?action=update&pTypeNO=" + pTypeNO,
			data: dataString,
			success: function () {
				alert("수정성공");
				location.assign('ad_plasTy.do?action=info&pTypeNO=' + pTypeNO);
			},
			error: function () {
				console.log('실패');
				alert('수정에 실패하였습니다.');
			}
		})
	});
	

		

	//수정 취소 버튼
	$("#btnCancel").click(function () {
		var pTypeNO = $('#plasTyModify td:eq(1):nth-child(2)').text(); // pTypeNO 가져오기
		console.log('pTypeNO : ' + pTypeNO);
		location.assign('ad_plasTy.do?action=info&pTypeNO=' + pTypeNO);
	});

	//pType목록 버튼
	$("#btnList").click(function () {
		location.assign('ad_plasTy.do?action=list');
	});


});
