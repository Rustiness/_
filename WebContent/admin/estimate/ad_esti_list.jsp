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
			<th>눈성형</th>
			<th>코성형</th>
			<th>안면윤곽성형</th>
			<th>체형성형</th>
			<th>가슴성형</th>
		</tr>
		<c:forEach items="${listAll }" var="estimate">
			<tr id="tableData">
				<td>${estimate.pNO}</td>
				<td>${estimate.pDate}</td>
				<td>${estimate.pEyeItem}</td>
				<td>${estimate.pNoseItem}</td>
				<td>${estimate.pFaceItem}</td>
				<td>${estimate.pBodyItem}</td>
				<td>${estimate.pBreastItem}</td>

			</tr>
		</c:forEach>
	</table>

</center>