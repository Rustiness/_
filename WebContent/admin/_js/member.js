/**
 * Created
 * User: KJK
 * Date: 2017-06-07
 * Time: 오전 12:34
 */

$(document).ready(function () {

	//마우스 오버 시 한줄 표시 ON
	$("#memList #tableData td").mouseenter(function () {
		$(this).closest('tr').css("background-color", "#cccccc").css('cursor', 'pointer');
	});

	//마우스 오버 해제 시 표시 제거
	$("#memList #tableData td").mouseleave(function () {
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
		var td = $('#memList #tableData');
		td.each(function () {
			$(this).click(function () {
				var mNO = $(this).children('td:nth-child(1)').text(); // mNO 가져오기
				$(location).attr('href', 'ad_mem.do?action=info&mNO=' + mNO); //제이쿼리 로케이션 이동!
			})
		})
	});

	//수정시작 버튼
	$("#btnModify").click(function () {
		var mNO = $('#memInfo td:eq(1):nth-child(2)').text(); // mNO 가져오기
		console.log('mNO : ' + mNO);
		location.assign('ad_mem.do?action=updForm&mNO=' + mNO);
	});

	//수정진행 버튼
	$("#btnModifyON").click(function () {
		var mNO = $('#memModify td:eq(1):nth-child(2)').text(); // mNO 가져오기
		var dataString = $("#empModForm").serialize(); //name 집합
		//console.log(dataString);

		$.ajax({
			type: "POST",
			url: "ad_mem.do?action=update&mNO=" + mNO,
			data: dataString,
			success: function () {
				console.log('성공!!');
				location.assign('ad_mem.do?action=info&mNO=' + mNO);
			},
			error: function () {
				console.log('실패');
				alert('수정에 실패하였습니다.');
			}
		})
	});

	//수정 취소 버튼
	$("#btnCancel").click(function () {
		var mNO = $('#memModify td:eq(1):nth-child(2)').text(); // mNO 가져오기
		console.log('mNO : ' + mNO);
		location.assign('ad_mem.do?action=info&mNO=' + mNO);
	});

	//회원목록 버튼
	$("#btnList").click(function () {
		location.assign('ad_mem.do?action=list');
	});
});
