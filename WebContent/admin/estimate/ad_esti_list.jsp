<%@page import="iba.conf.ChefSqlMapClient"%>
<%@page import="java.util.List"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>진료과목입력</title>
<%-- ad_estimate_list.jsp --%>

	<%
	request.setCharacterEncoding("UTF-8");
	SqlMapClient sqlMap = ChefSqlMapClient.getSqlMapInstance();
	String action= request.getParameter("action");
	List<String> list= null;
	if(action.equals("pTypeName")){
	 list= sqlMap.queryForList("estimate.selectpTypeName");
	}else {
		String pTypeName = request.getParameter("action");
		 list= sqlMap.queryForList("estimate.selectpItemName", pTypeName);
	}
	out.print("<option>==선택==</option>");
	for(int i =0; i< list.size(); i++){
		out.print("<option>"+list.get(i)+"</option>");
		}
	 System.out.println("list222:"+list.get(0));
	
	%>
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
	
	
 	//-----------------------------------------------------------------
 	function requestpItemName(){
 		var pTypeName = document.getElementById('pTypeName').value;
 		var params="action="+pTypeName;
 		
 		new ajax.xhr.Request('ad_estimate_list.jsp',params, resultpItemName,'POST');
 	}
 	function resultpItemName(xhr){//callback
 		if(xhr.readyState==4 && xhr.status==200){
 			var str= xhr.responseText;
 			var pItemName= document.getElementById('pItemName');
 			pItemName.innerHTML=str;
 		}
 	}

 	window.onload= function(){
 		requestpTypeName();
 	}
 	
 	</script>
</head>
<!-- ad_esti_list.html -->
<body>
	<h3>성형외과 진료과목 출력</h3>
	<hr>
	<form action="ad_estimate_list_update.jsp" method="post">
		<table cellspacing='0' cellpadding='2' width=605 border="0">
			<tr>
				<td bgcolor='#D5C4E1' colspan='4' height='2'></td>
			</tr>
			<tr>
				<td colspan='4' height='1' bgcolor='#A29D9A'></td>
			</tr>
			<tr>
				<td><select name="pTypeName" id="pTypeName"
					onchange="requestpItemName()">
						<option>=선택=</option>
				</select></td>
			</tr>
			<tr>
				<td><select name="pItemName" id="pItemName">
						<option>=선택=</option>
				</select></td>
			</tr>
		</table>

		<input type="submit" value="수정요청"> <input type="reset"
			value="선택항목 모두 취소">
	</form>
</body>
