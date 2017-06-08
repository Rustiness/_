<%@page import="java.util.List"%>
<%@page import="kr.hospi.dao.ReservationDAO"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String date = request.getParameter("date");
	
	ReservationDAO dao = new ReservationDAO();
	List<String> list = dao.selectDate(date);
	
	for(int i=0; i<list.size(); i++){
		out.print(list.get(i));
		if(i<list.size()-1)
			out.print(",");
	}
%>