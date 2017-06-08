<%@page import="java.util.List"%>
<%@page import="kr.hospi.dao.MemberDAO"%>
<%@page import="kr.hospi.beans.Member"%>
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

<script type="text/javascript">
	function moveLogin(){
		location.href="/JavaChefWeb/login.do";
	}
</script>

<center>
	<% /*
		Member member=new Member();
		 MemberDAO dao=new MemberDAO();
		 dao.
		*/
		
		String mID=(String)session.getAttribute("mID");//세션에 mID 뽑아옴.(LostAction에서 set했었다.)
		String pass=(String)session.getAttribute("pass");//세션에 pass 뽑아옴.(LostActionPass에서 set했었다.)
		
		if(!(mID!=null&&mID.length()>=1)) {%>
	<form name="conf1" method="POST" action="/JavaChefWeb/id_lost_process.do">
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
				<input type="submit" value="ID 찾기">
			</td>
		</tr>
	</table>
	</form>
	<% session.invalidate();}else if(!(pass!=null&&pass.length()>=1)){%>
	<font color=cceeff>아이디는</font> ${mID}<font color=cceeff>입니다.</font><br><br>
	<form name="conf2" action="/JavaChefWeb/pass_lost_process.do" method="POST">
		<table width="400" bgcolor="#ffe4b5" cellpadding="5">
		<tr>
			<td colspan="2">비밀번호 찾기<hr></td>
		</tr>
		<tr>
			<td align="left">아이디:<input type="text" size="8" name="id" value="${mID}" readonly> </td>
			
		</tr>
		</table>
		
		<table width="400" bgcolor="#ffe4b5" cellpadding="5">
		<tr>
			<td align="left">※※※비밀번호찾기질문선택※※※</td>
		</tr>
		<tr><td>
				 <select name="qNO">
              	        <option value="1">================선택===============</option>
              	 		<option value="2">기억에 남는 추억의 장소는?</option>
              	 		<option value="3">자신의 인생 좌우명은?</option>
              	 		<option value="4">가장 기억에 남는 선생님 성함은?</option>
              	 		<option value="5">타인이 모르는 자신만의 신체비밀이 있다면?</option>
              	 		<option value="6">추억하고 싶은 날짜가 있다면?</option>
              	 		<option value="7">받았던 선물 중 기억에 남는 독특한 선물은?</option>
              	 		<option value="8">유년시절 가장 생각나는 친구 이름은?</option>
              	 		<option value="9">인상 깊게 읽은 책 이름은?</option>
              	 		<option value="10">자신이제일 존경하는 인물은?</option>
              	 		<option value="11">친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
              	 		<option value="12">초등학교때 기억에 남는 짝꿍 이름은?</option>
              	 		<option value="13">다시 태어나면 되고 싶은 것은?</option>
              	 		<option value="14">내가 좋아하는 캐릭터는?</option>
              	      </select>
		
		
		
		    </td>
		</tr>
		<tr>
			<td>비밀번호답변: <input type="text" size="12" name="answer" >
			</td>
			
		</tr>
		<tr><td colspan="2"><hr></td></tr>
		<tr align="center">
			<td colspan="2">
				<input type="submit" value="비밀번호 찾기">
			</td>
		</tr>
	</table>
	</form>
	<%session.invalidate();}else{%>
		<center>
		<font color=cceeff>아이디는</font> ${mID}<font color=cceeff>입니다.</font><br><br>
		<font color=cceeff>아이디는</font> ${pass}<font color=cceeff>입니다.</font><br><br>
		<input type="button" value="로그인 페이지 이동" onclick="moveLogin()">
		</center>
	<%session.invalidate();}%>
</center>
</body>
</html>