<%@page import="kr.hospi.beans.AdMember"%>
<%@page import="kr.hospi.beans.Member"%>
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
	List<AdMember> list = dao.selectAll();
	
	boolean result = false;//중복 여부를 알려주는 boolean값 result.
	
	if(list!=null){
	    for(int i=0;i<list.size();i++){
	    	String mID_check=list.get(i).getmID();//데이터베이스에 존재하는 아이디
	    	if(mID.equals(mID_check)){//중복이 존재할 경우
	    		result = true;
	    		break;
	    	}
	    }
	}
	
	if(result){%>
	<font color="red"><b>이미 존재하는 아이디입니다!</b></font><br><br>
	<input type="reset" value="취소" onclick="clearID()">
	<%}else{%>
	<b>사용가능한 아이디입니다!</b><br><br>
	<input type="button" value="사용" onclick="verifyID()">
	<input type="reset" value="취소" onclick="clearID()">
	<%}%>
</center>
</body>
</html>