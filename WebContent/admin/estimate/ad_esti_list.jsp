<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="admin/_css/employee.css" rel="stylesheet" type="text/css" />
<script src="admin/_js/estimate.js" rel="script"
	type="text/javascript"></script>

<%-- ad_plasIt_list.jsp --%>
&nbsp;
<h3>::환자성형시술정보 목록::</h3>
<hr style="color: green">
<center>
	<table border="1" cellpadding="5" id="plasEsTable">
		<tr id="tableHead">
			<th>환자번호</th>
			<th>신청날짜</th>
			<th>환자이름</th>
			
			
		</tr>
		<c:forEach items="${listAll }" var="estimate">
			<tr id="tableData">
				<td>${estimate.pNO}</td>
				<td>${estimate.pDate}</td>
				<td>names</td>
			
			</tr>
		</c:forEach>
	</table>

</center>