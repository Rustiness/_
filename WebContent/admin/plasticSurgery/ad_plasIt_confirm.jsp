<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="admin/_css/employee.css" rel="stylesheet" type="text/css"/>
<script src="admin/_js/plasticItem.js" rel="script" type="text/javascript"></script>
<%-- ad_plasTy_list.jsp --%>

<h3>::성형시술 상세정보::</h3>
<hr style="color: deeppink">
<center>
	<table border="1" cellpadding="5" id="plasItConfirm">
		<tr id="tableHead">
			<th>항목</th>
			<th>정보</th>
		</tr>
		<%-- <c:forEach items="${pItemInfolist}" var="plasIinfo"> --%>
			<tr>
				<td>번호</td>
				<td>${pItemInfolist.num}</td>
			</tr>
			<tr>
				<td>pTypeNO</td>
				<td>${pItemInfolist.pTypeNO}</td>
			</tr>
			<tr>
				<td>pItemNO</td>
				<td>${pItemInfolist.pItemNO}</td>
			</tr>
			<tr>
				<td>pItemName</td>
				<td>${pItemInfolist.pItemName}</td>
			</tr>
			<tr>
				<td>pItemValue</td>
				<td>${pItemInfolist.pItemValue}</td>
			</tr>
			<tr>
				<td>Active/Inactive</td>
				<td>${pItemInfolist.state}</td>
			</tr>
			
		<%-- </c:forEach> --%>
		<tr align="center">
			<td colspan="2">
				<input type="button" id="btnModify" value="정보수정">
				<input type="button" id="btnList" value="성형과목목록">
			</td>
		</tr>
	</table>
</center>