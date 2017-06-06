/**
 * Created
 * User: KJK
 * Date: 2017-05-30
 * Time: 오전 11:13
 */

$(document).ready(function () {

	//마우스 오버 시 한줄 표시 ON
	$("#empList #tableData td").mouseenter(function () {
		$(this).closest('tr').css("background-color", "#cccccc").css('cursor', 'pointer');
	});

	//마우스 오버 해제 시 표시 제거
	$("#empList #tableData td").mouseleave(function () {
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
		var td = $('#empList #tableData');
		td.each(function () {
			$(this).click(function () {
				var eNO = $(this).children('td:nth-child(1)').text(); // eNO 가져오기
				$(location).attr('href', 'ad_emp.do?action=info&eNO=' + eNO); //제이쿼리 로케이션 이동!
			})
		})
	});

	//등록진행 버튼
	$("#btnInsertON").click(function () {
		var dataString = $("#empConForm").serialize(); //name 집합
		//console.log(dataString);

		$.ajax({
			type: "POST",
			url: "ad_emp.do?action=insert",
			data: dataString,
			success: function () {
				console.log('성공!!');
				location.assign('ad_emp.do?action=list');
			},
			error: function () {
				console.log('실패');
				alert('등록에 실패하였습니다.');
			}
		})
	});


	//수정시작 버튼
	$("#btnModify").click(function () {
		var eNO = $('#empInfo td:eq(1):nth-child(2)').text(); // eNO 가져오기
		console.log('eNO : ' + eNO);
		location.assign('ad_emp.do?action=updForm&eNO=' + eNO);
	});

	//수정진행 버튼
	$("#btnModifyON").click(function () {
		var eNO = $('#empModify td:eq(1):nth-child(2)').text(); // eNO 가져오기
		var dataString = $("#empModForm").serialize(); //name 집합
		//console.log(dataString);

		$.ajax({
			type: "POST",
			url: "ad_emp.do?action=update&eNO=" + eNO,
			data: dataString,
			success: function () {
				console.log('성공!!');
				location.assign('ad_emp.do?action=info&eNO=' + eNO);
			},
			error: function () {
				console.log('실패');
				alert('수정에 실패하였습니다.');
			}
		})
	});

	//수정 취소 버튼
	$("#btnCancel").click(function () {
		var eNO = $('#empModify td:eq(1):nth-child(2)').text(); // eNO 가져오기
		console.log('eNO : ' + eNO);
		location.assign('ad_emp.do?action=info&eNO=' + eNO);
	});

	//사원목록 버튼
	$("#btnList").click(function () {
		location.assign('ad_emp.do?action=list');
	});


});
