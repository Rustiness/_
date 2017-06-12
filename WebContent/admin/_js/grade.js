/**
 * Created
 * User: KJK
 * Date: 2017-06-09
 * Time: 오후 12:40
 */
$(document).ready(function () {

	//마우스 오버 시 한줄 표시 ON
	$("#gradeList #tableData td").mouseenter(function () {
		$(this).closest('tr').css("background-color", "#cccccc").css('cursor', 'pointer');
	});

	//마우스 오버 해제 시 표시 제거
	$("#gradeList #tableData td").mouseleave(function () {
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
		var td = $('#gradeList #tableData');
		td.each(function () {
			$(this).click(function () {
				var gNO = $(this).children('td:nth-child(1)').text(); // gNO 가져오기
				$(location).attr('href', 'ad_grade.do?action=info&gNO=' + gNO); //제이쿼리 로케이션 이동!
			})
		})
	});

	//등록진행 버튼
	$("#btnInsertON").click(function () {
		var dataString = $("#gradeConForm").serialize(); //name 집합
		//console.log(dataString);

		$.ajax({
			type: "POST",
			url: "ad_grade.do?action=insert",
			data: dataString,
			success: function () {
				console.log('성공!!');
				location.assign('ad_grade.do?action=list');
			},
			error: function () {
				console.log('실패');
				alert('등록에 실패하였습니다.');
			}
		})
	});


	//수정시작 버튼
	$("#btnModify").click(function () {
		var gNO = $('#empInfo td:eq(1):nth-child(2)').text(); // gNO 가져오기
		console.log('gNO : ' + gNO);
		location.assign('ad_grade.do?action=updForm&gNO=' + gNO);
	});

	//수정진행 버튼
	$("#btnModifyON").click(function () {
		var gNO = $('#empModify td:eq(1):nth-child(2)').text(); // gNO 가져오기
		var dataString = $("#empModForm").serialize(); //name 집합
		//console.log(dataString);

		$.ajax({
			type: "POST",
			url: "ad_grade.do?action=update&gNO=" + gNO,
			data: dataString,
			success: function () {
				console.log('성공!!');
				location.assign('ad_grade.do?action=info&gNO=' + gNO);
			},
			error: function () {
				console.log('실패');
				alert('수정에 실패하였습니다.');
			}
		})
	});

	//수정 취소 버튼
	$("#btnCancel").click(function () {
		var gNO = $('#gradeModify td:eq(1):nth-child(2)').text(); // gNO 가져오기
		console.log('gNO : ' + gNO);
		location.assign('ad_grade.do?action=info&gNO=' + gNO);
	});

	//관리목록 버튼
	$("#btnList").click(function () {
		location.assign('ad_grade.do?action=list');
	});

});
