<%--
   Created
   User: KJK
   Date: 2017-05-30
   Time: 오전 11:13
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="admin/_css/employee.css" rel="stylesheet" type="text/css"/>
<script src="admin/_js/employee.js" rel="script" type="text/javascript"></script>
<%-- ad_emp_list.jsp --%>
<h3>::사원정보 목록::</h3>
<hr style="color: deeppink">
<center>
	<table border="1" cellpadding="5" id="empList">
		<tr id="tableHead">
			<th>식별번호</th>
			<th>아이디</th>
			<th>사원명</th>
			<th>생년월일</th>
			<th>성별</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>직책</th>
			<th>최근접속일</th>
			<th>계정상태</th>
		</tr>
		<c:forEach items="${emplist}" var="empInfo">
			<tr id="tableData">
				<td>${empInfo.eNO}</td>
				<td>${empInfo.eID}</td>
				<td>${empInfo.name}</td>
				<td>${empInfo.birth}</td>
				<td>${empInfo.sex}</td>
				<td>${empInfo.tel}</td>
				<td>${empInfo.email}</td>
				<td>${empInfo.position}</td>
				<td>${empInfo.latestDate}</td>
				<td>${empInfo.state}</td>
			</tr>
		</c:forEach>
	</table>
</center>