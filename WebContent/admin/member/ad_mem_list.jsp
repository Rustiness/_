<%@page import="kr.hospi.beans.Member"%>
<%@page import="kr.hospi.dao.MemberDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원목록</title>
</head>
<%-- ad_mem_list.jsp --%>
<body>
<h3>회원정보리스트</h3>
<hr color=cc99ff>
<center>
<table border="1" cellpadding="5">
       <tr bgcolor="cccccc"><th>번호</th><th>회원ID</th><th>이름</th><th>생년월일</th><th>성별</th><th>연락처</th><th>EMAIL</th><th>관심분야</th></tr>
       <% 
       		MemberDAO dao = new MemberDAO();
   			List<Member> list = dao.selectAll();
   			
       		for(int i=0;i<list.size();i++) {
       		session.setAttribute("user", list.get(i));%>
       <tr>
           <td><%=(i+1) %></td>
           <td>${user.mID }</td>
           <td>${user.name }</td>
           <td>${user.birth }</td>
           <td>${user.sex }</td>
           <td>${user.tel }</td>
           <td>${user.email }</td>
           <td>${user.pTypeNO }</td>
       </tr>              <%-- 최대 돌수있는만큼 !! --%>
       <%} session.invalidate();%>
    </table>
</center>
</body>
</html>