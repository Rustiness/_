<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보</title>
</head>
<body>
<script type="text/javascript">
	function moveMain(){//메인 페이지로 이동
		location.href="/JavaChefWeb/client.do";
	}
	
	function moveMod(){//회원정보수정 페이지로 이동
		location.href="/JavaChefWeb/mem_mod.do";
	}
	
	function logout(){
		 var con = confirm("접속을 종료하시겠습니까");
		 if(con == true){
		  location.href="/JavaChefWeb/logout.do";
		  //logout을 위해 세션을 제거하는 페이지 호출
		 }
	}
</script>
	<h3>회원정보</h3>
	<hr>
	아이디: ${user.mID}<br>
	비밀번호: ${user.pass}<br>
	회원가입 질문: ${user.question}<br>
	회원가입 답변: ${user.answer}<br>
	이름: ${user.name}<br>
	생일: ${user.birth}<br>
	성별: ${user.sex}<br>
	전화번호: ${user.tel}<br>
	이메일: ${user.email}<br>
	관심사: ${user.pTypeNO}<br><br>
	<input type="button" value="메인화면" onclick="moveMain()">
	<input type="button" value="회원정보수정" onclick="moveMod()">
	<input type="button" value="로그아웃" onclick="logout()">
</body>
</html>