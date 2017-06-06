<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 성공</title>
</head>
<%--
	login_res.jsp
	[로그인 성공 페이지]
--%>
<body>

<script type="text/javascript">
	function moveMain(){//메인 페이지로 이동
		location.href="/JavaChefWeb/client.do";
	}
	
	function moveInfo(){//회원정보 페이지로 이동
		location.href="/JavaChefWeb/mem_info.do";
	}
	
	function openPassCheck(){//비밀번호 확인 창(passcheck.jsp)을 새로 띄움
		window.open("/JavaChefWeb/client/member/passcheck.jsp","passCheck","left=900,top=100,width=400,height=200,resizable=yes");
	}
	
	function logout(){
		 var con = confirm("접속을 종료하시겠습니까");
		 if(con == true){
		  location.href="/JavaChefWeb/logout.do";
		  //logout을 위해 세션을 제거하는 페이지 호출
		 }
	}
</script>

<h3>회원 로그인</h3>
<hr>
<center>
<form>
	<table width="400" bgcolor="#ffe4b5" cellpadding="5">
		<tr align="center">
			<td>${user.mID}님의 접속을 환영합니다.<td>
		</tr>
	</table>
	<br><br>
	<%-- 메인 페이지로 이동하는 버튼 --%>
	<input type="button" value="메인화면 이동" onclick="moveMain()">
	<%-- 회원정보(mem_confirm.jsp) 페이지로 이동하는 버튼 --%>
	<input type="button" value="회원정보" onclick="moveInfo()">
	<%-- 회원정보수정(mem_mod.jsp) 페이지로 이동하는 버튼 --%>
	<input type="button" value="회원정보수정" onclick="openPassCheck()">
	<input type="button" value="로그아웃" onclick="logout()">
</form>
</center>
</body>
</html>