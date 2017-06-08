<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="admin/_css/employee.css" rel="stylesheet" type="text/css"/>
<script src="admin/_js/plasticType.js" rel="script" type="text/javascript"></script>
<%-- ad_plasTy_info.jsp --%>
<h3>::성형과목 상세정보::</h3>
<hr style="color: deeppink">
<center>
	<table border="1" cellpadding="5" >
		<tr id="tableHead">
			<th>항목</th>
			<th>정보</th>
		</tr>
		<%-- <c:forEach items="${pTypeInfolist}" var="plasTinfo"> --%>
			<tr>
				<td>번호</td>
				<td >${pTypeInfolist.num}</td>
			</tr>
			<tr>
				<td>pTypeNO</td>
				<td id="ptypeNO">${pTypeInfolist.pTypeNO}</td>
			</tr>
			<tr>
				<td>pTypeName</td>
				<td>${pTypeInfolist.pTypeName}</td>
			</tr>
			<tr>
				<td>Active/Inactive</td>
				<td>${pTypeInfolist.state}</td>
			</tr>
			
		<%-- </c:forEach> --%>
		<tr align="center">
			<td colspan="2">
				<input type="button" id="btnModify" value="정보수정">
				<input type="button" id="btnList" value="목록">
			</td>
		</tr>
	</table>
</center>