<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="admin/_css/employee.css" rel="stylesheet" type="text/css"/>
<script src="admin/_js/plasticType.js" rel="script" type="text/javascript"></script>

<%-- ad_plasIt_list.jsp --%>

 <script type="text/javascript">
 
 function addMedical() {
		var url = "admin/plasticSurgery/ad_plasTy_add.jsp";
		window.open(url, 'ad_plasTy_add', width = 300, height = 100);
	
	} //addMedical()
 	
 	
 	</script>
&nbsp;<h3>::성형타입 목록::</h3>
<hr style="color: green">
<center>
	<table border="1" cellpadding="5" id="plasTyTable">
		<tr id="tableHead">
			<th>식별번호</th>
			<th>성형타입</th>
			<th>성형타입명</th>
			<th>상태</th>
			
		</tr>
		<c:forEach items="${listpType}" var="plasTyInfo">
			<tr id="tableData">
				
				<td>${plasTyInfo.num}</td>
				<td>${plasTyInfo.pTypeNO}</td>
				<td>${plasTyInfo.pTypeName}</td>
				<td>
				<c:choose>
						<c:when test="${plasTyInfo.state eq '1'}">Active</c:when>
						<c:when test="${plasTyInfo.state eq '0'}">Inactive</c:when>
						<c:otherwise>???</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
	</table>

	<input type="button" value="추가 진료과목입력" onclick="addMedical()"> <font color="blue">(추가 진료하고자 하는 과목을 넣으세요)</font>
</center>