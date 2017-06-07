<%--
   Created
   User: kosta
   Date: 2017-06-06
   Time: 오후 9:37
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="admin/_css/member.css" rel="stylesheet" type="text/css"/>
<script src="admin/_js/member.js" rel="script" type="text/javascript"></script>
<%-- ad_mem_list.jsp --%>
<h3>::회원 목록::</h3>
<hr style="color: deeppink">
<center>
	<table border="1" cellpadding="5" id="memList">
		<tr id="tableHead">
			<th>mNO</th>
			<th>아이디</th>
			<th>회원명</th>
			<th>생년월일</th>
			<th>성별</th>
			<th>관심사</th>
			<th>최근접속</th>
			<th>가입일</th>
			<th>회원메모</th>
			<th>예약정보</th>
			<th>견적정보</th>
			<th>계정상태</th>
		</tr>
		<c:forEach items="${memlist}" var="memInfo">
			<tr id="tableData">
				<td>${memInfo.mNO}</td>
				<td>${memInfo.mID}</td>
				<td>${memInfo.name}</td>
				<td>${memInfo.birth}</td>
				<td>
						<%-- 성별 --%>
					<c:choose>
						<c:when test="${memInfo.sex eq '1'}">남성</c:when>
						<c:when test="${memInfo.sex eq '2'}">여성</c:when>
						<c:otherwise>???</c:otherwise>
					</c:choose>
				</td>
				<td>${memInfo.pTypeNO}</td>
				<td>${memInfo.latestDate}</td>
				<td>${memInfo.joinDate}</td>
				<td id="mMemoText" title="${memInfo.mMemo}">${memInfo.mMemo}</td>
				<td>${memInfo.rNO}</td>
				<td>${memInfo.pNO}</td>
				<td>
						<%-- 상태 --%>
					<c:choose>
						<c:when test="${memInfo.state eq '1'}">정상</c:when>
						<c:when test="${memInfo.state eq '2'}">장기미접속</c:when>
						<c:when test="${memInfo.state eq '3'}">탈퇴</c:when>
						<c:when test="${memInfo.state eq '4'}">이용정지</c:when>
						<c:otherwise>???</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
	</table>
</center>