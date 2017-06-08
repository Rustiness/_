<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="admin/_css/common.css" rel="stylesheet" type="text/css"/>
<title>JAVACHEF성형외과 - 관리자</title>
</head>
<body>
	<center>
		<h3>관리자 로그인</h3>
		<form action="ad_login.do" method="POST">
			아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="id" style="margin-bottom: 10px;"><br>
			비밀번호 <input type="password" name="pass" style="margin-bottom: 10px;"><br>
			<input type="submit" value="로그인" class="btSty"> 
			<input type="reset" value="취소" class="btSty">
		</form>
	</center>
</body>
</html>