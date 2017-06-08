<%@page import="kr.hospi.beans.PlasticItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- ad_plasIt_list.jsp --%>
<% PlasticItem list = (PlasticItem)request.getAttribute("list"); %>
<center>
		<form action="/JavaChefWeb/ad_plasIInsert.do" method="POST">
			

			진료타입:<input type="text" name="pTypeNO" /><br /> 진료타입명: <input
				type="text" name="pTypeName" /><br /> 진료시술번호: <input
				type="text" name="pItemNO" /><br /> 진료시술명: <input
				type="text" name="pItemName" /><br /> 진료시술가격: <input
				type="text" name="pItemValue" /><br /> 	Active/Inactive: <input
				type="text" name="state" /><br /> <input type="submit" value="입력">
			<input type="reset" value="취소">

		</form>
	</center>