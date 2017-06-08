/**
 * Created
 * User: KJK
 * Date: 2017-05-30
 * Time: 오전 11:13
 */

$(document).ready(function () {

	//마우스 오버 시 한줄 표시 ON
	$("#plasEsTable #tableData td").mouseenter(function () {
		$(this).closest('tr').css("background-color", "#cccccc").css('cursor', 'pointer');
	});
  
	//마우스 오버 해제 시 표시 제거
	$("#plasEsTable #tableData td").mouseleave(function () {
		$(this).closest('tr').css("background-color", "#ffffff").css('cursor', 'default');
	});

	//행 선택시 반응
	$(function () {
		var td = $('#plasEsTable #tableData');
		td.each(function () {
			$(this).click(function () {
				var pNO = $(this).children('td:nth-child(1)').text(); // pNO 가져오기
				$(location).attr('href', 'ad_esti.do?action=info&pNO=' + pNO); //제이쿼리 로케이션 이동!

			})
		})
	});
	
	//수정시작 버튼
	$("#btnModify").click(function () {
		var pItemNO = $('#plasItConfirm td:eq(5):nth-child(2)').text(); // pItemNO 가져오기
		console.log('pNO : ' + pNO);
		location.assign('ad_plasIt.do?action=modify&pNO='+pNO);
	});

	//수정진행 버튼
	$("#btnModifyON").click(function () {
		var pNO = $('#plasItModify td:eq(5):nth-child(2)').text(); // pItemNO 가져오기

		console.log('pNO : ' + pNO);
		//location.assign('ad_emp.do?action=update&eNO=' + eNO);
	});
	
	//수정 취소 버튼
	$("#btnCancel").click(function () {
		var pNO = $('#plasItModify td:eq(3):nth-child(2)').text(); // pItemNO 가져오기
		
		console.log('pNO : ' + pNO);
		location.assign('ad_plasIt.do?action=info&pNO=' + pNO);
	});

	//pType목록 버튼
	$("#btnList").click(function () {
		location.assign('ad_plasIt.do?action=list');
	});


});
