<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	//로그아웃(logout.jsp) 처리
 	request.setCharacterEncoding("UTF-8");
 	
 	session.removeAttribute("admin");
	//user로 들어온 session을 제거
 	response.sendRedirect("/JavaChefWeb/admin.do");
	// 페이지의 메인으로 이동
%>