<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입약관</title>
</head>
<%-- 
	join_confirm1.jsp 
	[회원가입1 - 약관 동의]
--%>
<body>
<script type="text/javascript">
	function moveLogin(){//로그인 페이지(login_confirm.jsp)로 이동
		location.href="/JavaChefWeb/login.do";
	}
	
	function confirm(){//약관 동의 여부를 체크
		var term1=document.frm.term1.checked;
		var term2=document.frm.term2.checked;//약관 1,2 동의 여부(boolean)
		
		if(term1==true&&term2==true){//약관에 모두 동의하면 회원가입2(join_confirm2.jsp) 페이지로 이동
			location.href="/JavaChefWeb/join2.do"
		}else{//하나라도 동의 안하면 알림창이 팝업
			alert('회원가입을 하시려면 모든 약관에 동의하셔야 합니다!');
		}
	}
</script>

<form name="frm" method="post">
	<h3>회원가입약관</h3>
	<hr>
	<center>
	<table width="400">
			<tr align="left">
				<td>이용약관</td>
			</tr>
			<tr align="center">
				<%-- 약관 1이 표시되는 텍스트 에리어 --%>
				<td><textarea cols="70" rows="5"></textarea></td>
			</tr>
			<tr align="right">
				<td>
					<%-- 약관1의 체크박스 --%>
					<input type="checkbox" name="term1">
					<font size="1">이용약관에 동의합니다.</font>
				</td>
			</tr>
			<tr align="left">
				<td>개인정보수집 및 이용안내</td>
			</tr>
			<tr align="center">
				<%-- 약관 2가 표시되는 텍스트 에리어 --%>
				<td><textarea cols="70" rows="5"></textarea></td>
			</tr>
			<tr align="right">
				<td>
					<%-- 약관2의 체크박스 --%>
					<input type="checkbox" name="term2">
					<font size="1">개인정보 취급 방식에 동의합니다.</font>
				</td>
			</tr>
		</table>
	<br>
	<%-- 동의 버튼: 약관에 모두 동의하면 회원가입2(join_confirm2.jsp)로 이동, 아닐시 알림창 팝업 --%>
	<input type="button" value="동의합니다." onclick="confirm()">
	<%-- 비동의 버튼: 현 페이지를 리셋하고 로그인(login_confirm.jsp) 페이지로 이동 --%>
	<input type="reset" value="동의하지 않습니다." onclick="moveLogin()">
	</center>
</form>
</body>
</html>