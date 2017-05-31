<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='client/_css/common.css' rel='stylesheet' />
<%--
	login_confirm.jsp
	[로그인 창]
--%>
<script type="text/javascript">
	function moveJoin(){//회원가입1(join_confirm1.jsp) 페이지로 이동
		location.href="/JavaChefWeb/client/member/join_confirm1.jsp";
	}
	
	function moveLost(){//아이디, 비밀번호 찾기(pass_lost_confirm.jsp) 페이지로 이동
		location.href="/JavaChefWeb/client/member/pass_lost_confirm.jsp";
	}
</script>
<h3>회원 로그인</h3>
<hr>
<center>
<form action="/JavaChefWeb/login/login.do" method="post">
	<table width="400" bgcolor="#ffe4b5" cellpadding="5">
		<tr align="center">
			<td colspan="3">MEMBER LOGIN<td>
		</tr>
		<tr align="center">
			<td>ID : </td><td><input size="17" type="text" name="mID"></td>
			<%-- 로그인 버튼 --%>
			<td rowspan="2"><input type="submit" name="login" value="로그인"></td>
		</tr>
		<tr align="center">
			<td>PASSWORD : </td><td><input size="18" type="password" name="pass"></td>
		</tr>
	</table>
	<br><br>
	<%-- 회원가입 페이지로 이동하는 버튼 --%>
	<input type="button" value="회원가입" onclick="moveJoin()">
	<%-- 아이디 비밀번호 찾기 페이지로 이동하는 버튼 --%>
	<input type="button" value="아이디 및 비밀번호 찾기" onclick="moveLost()">
	<br><br>
	<html:messages property="errorid" id="msg">
         <%-- 아이디에 빈값이 있을 때 에러 메시지 출력 --%>
         <font color="red"><bean:write name="msg"/></font>
    </html:messages>
	<br>
	<html:messages property="errorpass" id="msg">
         <%-- 비밀번호에 빈값이 있을 때 에러 메시지 출력 --%>
         <font color="red"><bean:write name="msg"/></font>
    </html:messages>
</form>
</center>