<%-- mem_result.jsp로 수정 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정 결과</title>
</head>
<!-- mem_res.jsp -->
<body>

<script type="text/javascript">
	function back(){
		location.href="/JavaChefWeb/login.do";
	}
</script>

<center>
<table width="300" bgcolor="#ffe4b5" cellpadding="5">
	<tr><td>회원정보수정 완료<hr></td></tr>
	<tr>
		<td>
			${modifyMem.mID}님의 회원 정보가 수정되었습니다.<br>
			이용해주셔서 감사합니다.<hr>
			<% session.invalidate(); %>
		</td>
	</tr>
	<tr align="center"><td><input type="button" value="완료" onclick="back()"></td></tr>
</table>
</center>
</body>
</html>