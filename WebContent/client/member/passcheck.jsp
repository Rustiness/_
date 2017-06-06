<%@page import="kr.hospi.beans.Member"%>
<%@page import="java.util.List"%>
<%@page import="kr.hospi.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 확인</title>
</head>
<%-- passcheck.jsp --%>
<body>
	<script type="text/javascript">
	function checkPass(){//비밀번호 일치 여부를 확인하는 함수
		var pass_check = document.getElementById("pass_check").value;
		var pass = document.getElementById("pass").value;
		if(pass_check!=pass)
			alert('비밀번호가 일치하지 않습니다.');
		else{
			opener.document.location.href="/JavaChefWeb/join_term.do";
			window.close();
		}
	}
</script>
	<form name="frm">
		<center>
			<table width="300" bgcolor="#ffe4b5" cellpadding="5">
				<tr>
					<td>비밀번호 확인
						<hr>
					</td>
				</tr>
				<tr>
					<td>
						비밀번호 입력: <input type="text" id="pass_check">
						<input type="hidden" id="pass" value="${user.pass}">
					<hr>
					</td>
				</tr>
				<tr align="center">
					<td><input type="button" value="비밀번호 확인" onclick="checkPass()">
						<input type="reset" value="취소" onclick="window.close()"></td>
				</tr>
			</table>
		</center>
	</form>
</body>
</html>