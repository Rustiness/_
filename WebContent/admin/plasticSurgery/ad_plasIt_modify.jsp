<%@page import="kr.hospi.beans.PlasticItem"%>
<%@page import="iba.conf.ChefSqlMapClient"%>
<%@page import="java.util.List"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- ad_plasIt_modify.jsp --%>
<link href="admin/_css/employee.css" rel="stylesheet" type="text/css"/>
<script src="admin/_js/plasticItem.js" rel="script" type="text/javascript"></script>
<%-- ad_plasTy_modify.jsp --%>
<h3>::성형시술상세정보::</h3>
<hr style="color: deeppink">
<center>
	<form id="plasModForm" method="post">
		<table border="1" cellpadding="5" id="plasItModify">
			<tr id="tableHead">
				<th>항목</th>
				<th>정보</th>
			</tr>
			<%-- <c:forEach items="${plaslist}" var="plasItInfo"> --%>
				<tr>
					<td>번호</td>
					<td>${pItemInfolist.num}</td>
				</tr>
				<tr>
					<td>성형타입번호</td>
					<td><input id="pTypeNO" type="text" value="${pItemInfolist.pTypeNO}" disabled></td>
				</tr>
				<tr>
					<td>성형시술번호</td>
					<td><input id="pItemNO" type="text" value="${pItemInfolist.pItemNO}" disabled></td>
				</tr>
				<tr>
					<td>성형시술명</td>
					<td><input id="pItemName" type="text" value="${pItemInfolist.pItemName}"></td>
				</tr>
				<tr>
					<td>성형시술가격</td>
					<td><input id="pItemValue" type="text" value="${pItemInfolist.pItemValue}"></td>
				</tr>
				
				<tr>
					<td>Active/Inactive</td>
					<td><select id="state">
						<option value="1" <c:if test="${pItemInfolist.state eq '1'}">selected</c:if>>Active</option>
						<option value="0" <c:if test="${pItemInfolist.state eq '0'}">selected</c:if>>Inactive</option>
		
					</select>
					</td>
				</tr>
			<%-- </c:forEach> --%>
			<tr align="center">
				<td id="btnSet" colspan="2">
					<input type="button" id="btnModifyON" value="수정완료">
					<input type="reset" value="초기값 설정">
					<input type="button" id="btnCancel" value="수정취소">
					<input type="button" id="btnList" value="성형타입목록">
				</td>
			</tr>
		</table>
	</form>
</center>