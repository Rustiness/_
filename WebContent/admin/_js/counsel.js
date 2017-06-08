/**
 * Created
 * User: KJK
 * Date: 2017-06-07
 * Time: 오후 06:08
 */

$(document).ready(function () {

	//마우스 오버 시 한줄 표시 ON
	$("#counList #tableData td").mouseenter(function () {
		$(this).closest('tr').css("background-color", "#cccccc").css('cursor', 'pointer');
	});

	//마우스 오버 해제 시 표시 제거
	$("#counList #tableData td").mouseleave(function () {
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
		var td = $('#counList #tableData');
		td.each(function () {
			$(this).click(function () {
				var cNO = $(this).children('td:nth-child(1)').text(); // cNO 가져오기
				$(location).attr('href', 'ad_coun.do?action=info&cNO=' + cNO); //제이쿼리 로케이션 이동!
			})
		})
	});

	//수정시작 버튼
	$("#btnModify").click(function () {
		var cNO = $('#counInfo td:eq(1):nth-child(2)').text(); // cNO 가져오기
		console.log('cNO : ' + cNO);
		location.assign('ad_coun.do?action=updInfoForm&cNO=' + cNO);
	});

	//수정진행 버튼
	$("#btnModifyON").click(function () {
		var cNO = $('#counModify td:eq(1):nth-child(2)').text(); // cNO 가져오기
		var dataString = $("#counModForm").serialize(); //name 집합
		//console.log(dataString);

		$.ajax({
			type: "POST",
			url: "ad_coun.do?action=updInfo&cNO=" + cNO,
			data: dataString,
			success: function () {
				console.log('성공!!');
				location.assign('ad_coun.do?action=info&cNO=' + cNO);
			},
			error: function () {
				console.log('실패');
				alert('수정에 실패하였습니다.');
			}
		})
	});

	//수정 취소 버튼
	$("#btnModCancel").click(function () {
		var cNO = $('#counModify td:eq(1):nth-child(2)').text(); // cNO 가져오기
		console.log('cNO : ' + cNO);
		location.assign('ad_coun.do?action=info&cNO=' + cNO);
	});


	//답변시작 버튼
	$("#btnComent").click(function () {
		var cNO = $('#counInfo td:eq(1):nth-child(2)').text(); // cNO 가져오기
		console.log('cNO : ' + cNO);
		location.assign('ad_coun.do?action=updComentForm&cNO=' + cNO);
	});

	//답변 등록 버튼
	$("#btnComentON").click(function () {
		var cNO = $('#counComent td:eq(1):nth-child(2)').text(); // cNO 가져오기
		var dataString = $("#counComForm").serialize(); //name 집합
		//console.log(dataString);

		$.ajax({
			type: "POST",
			url: "ad_coun.do?action=updComent&cNO=" + cNO,
			data: dataString,
			success: function () {
				console.log('성공!!');
				location.assign('ad_coun.do?action=info&cNO=' + cNO);
			},
			error: function () {
				console.log('실패');
				alert('답변 등록에 실패하였습니다.');
			}
		})
	});

	//답변 취소 버튼
	$("#btnComCancel").click(function () {
		var cNO = $('#counComent td:eq(1):nth-child(2)').text(); // cNO 가져오기
		console.log('cNO : ' + cNO);
		location.assign('ad_coun.do?action=info&cNO=' + cNO);
	});

	//상담목록 버튼
	$("#btnList").click(function () {
		location.assign('ad_coun.do?action=list');
	});
});
