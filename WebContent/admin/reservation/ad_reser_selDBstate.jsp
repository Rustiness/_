<%@page import="kr.hospi.beans.Reservation2"%>
<%@page import="java.util.List"%>
<%@page import="kr.hospi.dao.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String state = request.getParameter("state");
	
	ReservationDAO dao = new ReservationDAO();
	List<Reservation2> list = dao.selectState(state);
	
	Reservation2 reservation = new Reservation2();
	out.print("[");
	for(int i=0; i<list.size(); i++){
		reservation = list.get(i);
		out.print("{\"id\":\""+reservation.getrNO()+
				  "\",\"title\":\""+reservation.getpTypeName()+
				  "\",\"start\":\""+reservation.getrDate()+
				  "T"+reservation.getrFTime()+
				  "\",\"end\":\""+reservation.getrDate()+
				  "T"+reservation.getrLTime()+"\"}");
		if(i<list.size()-1)
			out.print(",");
	}
	out.print("]");
%>