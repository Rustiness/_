/**
 * Created
 * User: KJK
 * Date: 2017-06-09
 * Time: 오후 2:24
 */

//키다운 막기
$(document).keydown(function (e) {
	e = e || window.event;
	var nKeyCode = e.keyCode;

	try {
		if (nKeyCode >= 112 && nKeyCode <= 123 || /(?:9|16|17|21|25|92|93)/.test(nKeyCode)) {
			if (!+"\v1") {  // IE일 경우
				e.keyCode = e.returnValue = 0;
			} else {  // IE가 아닌 경우
				e.preventDefault();
			}
		}
	} catch (err) {
	}
});

Object.defineProperty(console, '_commandLineAPI', {
	get: function () {
		throw 'Error.'
	}
});

//드래그 우클릭 막기
$(document).ready(function () {
	$('body').on("selectstart", function (event) {
		return false;
	});
	$('body').on("dragstart", function (event) {
		return false;
	});
	//init(); //handler
});
