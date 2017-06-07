<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="admin/_css/employee.css" rel="stylesheet" type="text/css"/>
<script src="admin/_js/plasticItem.js" rel="script" type="text/javascript"></script>
<script type="text/javascript">
 function addMedical() {
		var url = "admin/plasticSurgery/ad_plasIt_add.jsp";
		window.open(url, 'ad_plasIt_add', width = 300, height = 100);
	
	} //addMedical()
 	
 	
 	</script>
<%-- ad_plasIt_list.jsp --%>
&nbsp;<h3>::성형시술정보 목록::</h3>
<hr style="color: green">
<center>
	<table border="1" cellpadding="5" id="plasItTable">
		<tr id="tableHead">
			<th>번호</th>
			<th>성형타입</th>
			<th>성형타입명</th>
			<th>성형시술번호</th>
			<th>성형시술명</th>
			<th>가격</th>
			<th>상태</th>
			
		</tr>
		<c:forEach items="${listpItem}" var="plasItInfo">
			<tr id="tableData">
				
				<td>${plasItInfo.num}</td>
				<td>${plasItInfo.pTypeNO}</td>
				<td>${plasItInfo.pTypeName}</td>
				<td>${plasItInfo.pItemNO}</td>
				<td>${plasItInfo.pItemName}</td>
				<td>${plasItInfo.pItemValue}</td>
				<td>${plasItInfo.state}</td>
			</tr>
		</c:forEach>
		<input type="button" value="추가 진료과목입력" onclick="addMedical()"> <font color="blue">(추가 정보입력)</font>
	</table>
</center>