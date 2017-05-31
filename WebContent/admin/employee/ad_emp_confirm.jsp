<%--
   Created
   User: KJK
   Date: 2017-05-30
   Time: 오후 06:59
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="admin/_css/employee.css" rel="stylesheet" type="text/css"/>
<script src="admin/_js/employee.js" rel="script" type="text/javascript"></script>
<%-- ad_emp_list.jsp --%>
<h3>::사원 상세정보::</h3>
<hr style="color: deeppink">
<center>
	<table border="1" cellpadding="5" id="empConfirm">
		<tr id="tableHead">
			<th>항목</th>
			<th>정보</th>
		</tr>
		<c:forEach items="${emplist}" var="empinfo">
			<tr>
				<td>식별번호</td>
				<td>${empinfo.eNO}</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${empinfo.eID}</td>
			</tr>
			<tr>
				<td>사원명</td>
				<td>${empinfo.name}</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>${empinfo.birth}</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>${empinfo.sex}</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${empinfo.tel}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${empinfo.email}</td>
			</tr>
			<tr>
				<td>직책</td>
				<td>${empinfo.position}</td>
			</tr>
			<tr>
				<td>최근접속일</td>
				<td>${empinfo.latestDate}</td>
			</tr>
			<tr>
				<td>계정상태</td>
				<td>${empinfo.state}</td>
			</tr>
		</c:forEach>
		<tr align="center">
			<td colspan="2">
				<input type="button" id="btnModify" value="정보수정">
				<input type="button" id="btnList" value="직원목록">
			</td>
		</tr>
	</table>
</center>
