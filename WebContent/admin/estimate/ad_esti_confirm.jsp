<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="admin/_css/employee.css" rel="stylesheet" type="text/css" />
<script src="admin/_js/plasticItem.js" rel="script"
	type="text/javascript"></script>

<%-- esti_process.jsp --%>
&nbsp;
<h3>::환자성형시술정보 목록::</h3>
<hr style="color: green">
<center>
	<font color="blue">환자번호::</font>
	<table border="1" cellpadding="5" id="plasItTable">
		<tr id="tableHead">
			<!-- <th>환자번호</th> -->
			<th>성형타입</th>
			<th>성형시술명</th>
			<th>성형시술가격</th>
		</tr>
		<c:forEach items="${list }" var="pitem">
			<tr id="tableData">
				<td>${pitem.pTypeNO}</td>
				<td>${pitem.pItemName}</td>
				<td>${pitem.pItemValue}</td>
			</tr>
			<c:set var="sum" value="${sum + pitem.pItemValue}" />
		</c:forEach>
		<tr>
			<td>Total Price</td>
			<td></td>
			<td><c:out value="${sum}" /></td>

		</tr>

	</table>


</center>