<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>진료과목입력</title>
<script type="text/javascript" src="../_js/ajax2.js"></script>
<script type="text/javascript">
 	function requestpTypeName(){
 		new ajax.xhr.Request('ad_estimate_list.jsp?action=pTypeName', null, resultpTypeName,'GET');
 	}
 	function resultpTypeName(xhr){//callback
 		
 		if(xhr.readyState==4 && xhr.status==200){
 			var str= xhr.responseText;
 			var pTypeName= document.getElementById('pTypeName');
 			pTypeName.innerHTML=str;
 		}
 	}
 	window.onload= function(){
 		requestpTypeName();
 	}
 	
 	</script>
</head>
<%--ad_estimate_input.jsp --%>
<body>

<center>
	<form action="ad_estimate.jsp" method="POST">
	
	번호:<input type="text" name="num" /><br/>
	
			진료과목:	<select name="pTypeName" id="pTypeName"
					onchange="requestpItemName()">
						<option>=선택=</option>
				</select>
			
	진료타입:<input type="text" name="pTypeNO" /><br/>
	진료시술번호: <input type="text" name="pItemNO" /><br/>
	진료시술명: <input type="text" name="pItemName" /><br/>
	진료시술가격:  <input type="text" name="pItemValue" /><br/>
	Active/Inactive:  <input type="text" name="state" /><br/>
		<input type="submit" value="입력" >
		<input type="reset" value="취소">

	</form>
	</center>
</body>
</html>
