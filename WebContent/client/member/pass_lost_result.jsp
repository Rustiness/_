<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 및 비밀번호 찾기 결과</title>
</head>
<%-- pass_lost_result.jsp --%>
<body>
	<center>
		<table width="300" bgcolor="#ffe4b5" cellpadding="5">
			<tr><td>ID 찾기<hr></td></tr>
			<tr><td>이름 님이 가입하신  ID는 입니다.<hr></td></tr>
			<tr align="center"><td><input type="submit" value="완료"></td></tr>
		</table>
		<br>
		<table width="300" bgcolor="#ffe4b5" cellpadding="5">
			<tr><td>비밀번호 찾기<hr></td></tr>
			<tr><td>ID 님의 비밀번호는 입니다.<hr></td></tr>
			<tr align="center"><td><input type="submit" value="완료"></td></tr>
		</table>
		<br>
		<table width="300" bgcolor="#ffe4b5" cellpadding="5">
			<tr><td>아이디 찾기 결과<hr></td></tr>
			<tr><td>아이디 조회 결과 입력하신 정보와 일치하는 아이디를 찾지 못하였습니다. 다른 검색 항목으로 다시 시도해 보세요.
			<hr></td></tr>
			<tr align="center"><td><input type="button" value="다시 시도">
								   <input type="button" value="회원가입">
								   <input type="reset" value="취소"></td></tr>
		</table>
		<br>
		<table width="300" bgcolor="#ffe4b5" cellpadding="5">
			<tr><td>비밀번호 찾기 결과<hr></td></tr>
			<tr><td>비밀번호 조회 결과 입력하신 정보와 일치하는 아이디를 찾지 못하였습니다. 다른 검색 항목으로 다시시도해 보세요
			<hr></td></tr>
			<tr align="center"><td><input type="button" value="다시 시도">
								   <input type="button" value="회원가입">
								   <input type="reset" value="취소"></td></tr>
		</table>
	</center>
</body>
</html>