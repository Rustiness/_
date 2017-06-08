<%@page import="java.util.List"%>
<%@page import="kr.hospi.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복 체크</title>
</head>
<body>
<script type="text/javascript">
	function clearID(){
		opener.document.getElementById("mID").value="";
		opener.document.getElementById("mID").focus();
		window.close();
	}
	
	function verifyID(){
		opener.document.getElementById("mID_verified").value
			=opener.document.getElementById("mID").value;
		window.close();
	}
</script>
<center>
<% 
	String mID = request.getParameter("mID");//아이디 입력란에서 받아온 아이디
	
	MemberDAO dao = new MemberDAO();
	int t = dao.dpCheck(mID);
	
	
	if(t>0){%>
	<font color="red"><b>이미 존재하는 아이디입니다!</b></font><br><br>
	<input type="reset" value="취소" onclick="clearID()">
	<%}
	else if(t==-1)
	{%>
		<font color="red"><b>에러</b></font><br><br>
		<input type="reset" value="취소" onclick="clearID()">
	<%}
	else{%>
	<b>사용가능한 아이디입니다!</b><br><br>
	<input type="button" value="사용" onclick="verifyID()">
	<input type="reset" value="취소" onclick="clearID()">
	<%}%>
</center>
</body>
</html>