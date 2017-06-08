<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="admin/_css/employee.css" rel="stylesheet" type="text/css" />
<script src="admin/_js/plasticItem.js" rel="script"
	type="text/javascript"></script>
<%-- ad_plasTy_list.jsp --%>

<h3>::성형시술 상세정보::</h3>
<hr style="color: deeppink">
<center>
	<form id="plasTyConForm" method="post">
		<table border="1" cellpadding="5" id="plasTyConfirm">
			<tr id="tableHead">
				<th>항목</th>
				<th>정보</th>
			</tr>
			
			<tr>
				<td>번호</td>
				<td><input name="num" type="text" maxlength="10"></td>
			</tr>

			<tr>
				<td>pTypeNO</td>
				<td><input name="pTypeNO" type="text" maxlength="10"></td>
			</tr>
			<tr>
				<td>pTypeName</td>
				<td><input name="pTypeName" type="text" maxlength="10"></td>
			</tr>
			<tr>
				<td>Active/Inactive</td>
				<td><select name="state">
						<option value="1">Active</option>
						<option value="0">Inactive</option>
				</select></td>
			</tr>

			
			<tr align="center">
				<td colspan="2"><input type="button" id="btnModify"
					value="정보수정"> <input type="button" id="btnList"
					value="성형과목목록"></td>
			</tr>
		</table>
		</form>
</center>