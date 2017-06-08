/**
 * Created
 * User: KJK
 * Date: 2017-05-30
 * Time: 오전 11:13
 */

$(document).ready(function () {

	//마우스 오버 시 한줄 표시 ON
	$("#plasItTable #tableData td").mouseenter(function () {
		$(this).closest('tr').css("background-color", "#cccccc").css('cursor', 'pointer');
	});
  
	//마우스 오버 해제 시 표시 제거
	$("#plasItTable #tableData td").mouseleave(function () {
		$(this).closest('tr').css("background-color", "#ffffff").css('cursor', 'default');
	});

	//행 선택시 반응
	$(function () {
		var td = $('#plasItTable #tableData');
		td.each(function () {
			$(this).click(function () {
				var pItemNO = $(this).children('td:nth-child(4)').text(); // pItemNO 가져오기
				$(location).attr('href', 'ad_plasIt.do?action=info&pItemNO=' + pItemNO); //제이쿼리 로케이션 이동!

			})
		})
	});
	
	//수정시작 버튼
	$("#btnModify").click(function () {
		var pItemNO = $('#plasItConfirm td:eq(5):nth-child(2)').text(); // pItemNO 가져오기
		console.log('pItemNO : ' + pItemNO);
		location.assign('ad_plasIt.do?action=modify&pItemNO='+pItemNO);
	});

	//수정진행 버튼
	$("#btnModifyON").click(function () {
		var pItemNO = $('#plasItModify td:eq(5):nth-child(2)').text(); // pItemNO 가져오기

		console.log('pItemNO : ' + pItemNO);
		//location.assign('ad_emp.do?action=update&eNO=' + eNO);
	});
	//수정 취소 버튼
	$("#btnCancel").click(function () {
		var pItemNO = $('#plasItModify td:eq(3):nth-child(2)').text(); // pItemNO 가져오기
		alert(pItemNO);
		console.log('pItemNO : ' + pItemNO);
		location.assign('ad_plasIt.do?action=info&pItemNO=' + pItemNO);
	});

	//pType목록 버튼
	$("#btnList").click(function () {
		location.assign('ad_plasIt.do?action=list');
	});


});
