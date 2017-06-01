<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 및 비밀번호 찾기</title>
</head>
<%-- pass_lost_confirm.jsp --%>
<body>
<center>
	<% 
		String mID=(String)session.getAttribute("mID");
		if(!(mID!=null&&mID.length()>=1)) {%>
	<form name="conf1" method="POST" action="/JavaChefWeb/pass_lost_process.do">
	<table width="400" bgcolor="#ffe4b5" cellpadding="5">
		<tr>
			<td colspan="2">아이디 찾기<hr></td>
		</tr>
		<tr>
			<td>이름: </td>
			<td><input type="text" size="8" name="name"></td>
		</tr>
		<tr>
			<td>이메일: </td>
			<td>
				<input type="text" size="12" name="email1">
				@ <input type="text" size="12" name="email2">
			</td>
		</tr>
		<tr><td colspan="2"><hr></td></tr>
		<tr align="center">
			<td colspan="2">
				<input type="submit" value="확인">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
	</form>
	<%}else{%>
	아이디는 ${mID}입니다.<br><br>
	<form name="conf2" action="/login/lost2">
		<table width="400" bgcolor="#ffe4b5" cellpadding="5">
		<tr>
			<td colspan="2">비밀번호 찾기<hr></td>
		</tr>
		<tr>
			<td>이름: </td>
			<td><input type="text" size="8" name="name"></td>
		</tr>
		<tr>
			<td>아이디: </td>
			<td><input type="text" size="8" name="id" value="${mID}"></td>
		</tr>
		<tr>
			<td>이메일: </td>
			<td>
				<input type="text" size="12" name="email1">
				@ <input type="text" size="12" name="email2">
			</td>
		</tr>
		<tr><td colspan="2"><hr></td></tr>
		<tr align="center">
			<td colspan="2">
				<input type="submit" value="확인">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
	</form>
	<%} session.invalidate();%>
</center>
</body>
</html>