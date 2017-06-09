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
<%-- ad_emp_info.jsp --%>
<c:if test="${admin==null}">
	<script>
		alert("관리자 로그인 후 이용가능합니다.");
		location.href='admin.do';
	</script>
</c:if>
<c:if test="${admin!=null}">
<h3>::사원 상세정보::</h3>
<hr style="color: deeppink">
<center>
	<table border="1" cellpadding="5" id="empInfo">
		<tr id="tableHead">
			<th>항목</th>
			<th>정보</th>
		</tr>
		<c:forEach items="${emplist}" var="empInfo">
			<tr>
				<td>식별번호</td>
				<td>${empInfo.eNO}</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${empInfo.eID}</td>
			</tr>
			<tr>
				<td>사원명</td>
				<td>${empInfo.name}</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>${empInfo.birth}</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
						<%-- 성별 --%>
					<c:choose>
						<c:when test="${empInfo.sex eq '1'}">남성</c:when>
						<c:when test="${empInfo.sex eq '2'}">여성</c:when>
						<c:otherwise>???</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${empInfo.tel}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${empInfo.email}</td>
			</tr>
			<tr>
				<td>직책</td>
				<td>
						<%-- 직책 --%>
					<c:choose>
						<c:when test="${empInfo.position eq '1'}">미지정</c:when>
						<c:when test="${empInfo.position eq '2'}">팀원</c:when>
						<c:when test="${empInfo.position eq '3'}">팀장</c:when>
						<c:when test="${empInfo.position eq '4'}">실장</c:when>
						<c:when test="${empInfo.position eq '5'}">본부장</c:when>
						<c:otherwise>???</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>관리등급</td>
				<td>${empInfo.gName}</td>
			</tr>
			<tr>
				<td>입사일</td>
				<td>${empInfo.hireDate}</td>
			</tr>
			<tr>
				<td>퇴사일</td>
				<td>${empInfo.retireDate}</td>
			</tr>
			<tr>
				<td>최근접속일</td>
				<td>${empInfo.latestDate}</td>
			</tr>
			<tr>
				<td>계정상태</td>
				<td>
						<%-- 상태 --%>
					<c:choose>
						<c:when test="${empInfo.state eq '1'}">정상</c:when>
						<c:when test="${empInfo.state eq '2'}">휴직</c:when>
						<c:when test="${empInfo.state eq '3'}">퇴사</c:when>
						<c:when test="${empInfo.state eq '4'}">비활성</c:when>
						<c:otherwise>???</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
		<tr align="center">
			<td id="btnSet" colspan="2">
				<input type="button" id="btnModify" value="정보수정">
				<input type="button" id="btnList" value="사원목록">
			</td>
		</tr>
	</table>
</center>
</c:if>