<%--
   Created
   User: KJK
   Date: 2017-06-09
   Time: 오후 12:18
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="admin/_css/employee.css" rel="stylesheet" type="text/css"/>
<script src="admin/_js/employee.js" rel="script" type="text/javascript"></script>
<%-- ad_grade_list.jsp --%>
<c:if test="${admin==null}">
	<script>
		alert("관리자 로그인 후 이용가능합니다.");
		location.href='admin.do';
	</script>
</c:if>
<c:if test="${admin!=null}">
<h3>::관리 목록::</h3>
<hr style="color: deeppink">
<center>
	<table border="1" cellpadding="5" id="gradeList">
		<tr id="tableHead">
			<th>gNO</th>
			<th>관리분류</th>
			<th>설명</th>
		</tr>
		<c:forEach items="${gradelist}" var="gradeInfo">
			<tr id="tableData">
				<td>${gradeInfo.gNO}</td>
				<td>${gradeInfo.gName}</td>
				<td>${gradeInfo.gMemo}</td>
			</tr>
		</c:forEach>
	</table>
</center>
</c:if>