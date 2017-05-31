<%@page import="kr.hospi.beans.Member"%>
<%@page import="java.util.List"%>
<%@page import="kr.hospi.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 체크</title>
</head>
<%-- idcheck.jsp --%>
<body>
	<script type="text/javascript">
	function dupId(){
		var mID = document.getElementById("mID").value;
		
		var b=confirm("'"+mID+"'는 사용가능한 ID입니다. 사용하시겠습니까?");
		if(b==true){
			opener.document.getElementById("mID").value=mID;
			window.close();
		}
	}
</script>

	<form name="frm">
		<center>
			<table width="300" bgcolor="#ffe4b5" cellpadding="5">
				<tr>
					<td>아이디 중복확인
						<hr>
					</td>
				</tr>
				<tr>
					<td>아이디 입력: <input type="text" id="mID">
					<hr></td>
				</tr>
				<tr align="center">
					<td><input type="button" value="중복확인" onclick="dupId()">
						<input type="reset" value="취소" onclick="window.close()"></td>
				</tr>
			</table>
			<%-- <br>
	<table width="300" bgcolor="#ffe4b5" cellpadding="5">
		<tr><td>비밀번호 확인<hr></td></tr>
		<tr><td>비밀번호 입력: <input type="text" name="pass"><hr></td></tr>
		<tr align="center"><td><input type="submit" value="확인">
	</table>
	<br>
	<table width="300" bgcolor="#ffe4b5" cellpadding="5">
		<tr align="center"><td>입력하신 ID는 입니다. 이 ID를 사용하시겠습니까?<br><br>
				<input type="button" value="사용하기"><hr></td></tr>
		<tr><td>아이디 입력: <input type="text" name="id"><hr></td></tr>
		<tr align="center"><td><input type="submit" value="중복확인">
				<input type="reset" value="취소"></td></tr>
	</table>
	<br>
	<table width="300" bgcolor="#ffe4b5" cellpadding="5">
		<tr align="center"><td>입력하신 ID는 , 중복된 ID입니다. 다시 입력해주세요.<br><br>
				<input type="button" value="사용하기"><hr></td></tr>
		<tr><td>아이디 입력: <input type="text" name="id"><hr></td></tr>
		<tr align="center"><td><input type="submit" value="중복확인">
				<input type="reset" value="취소"></td></tr>
	</table>
--%>
		</center>
	</form>
</body>
</html>