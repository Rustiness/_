<%--
   Created
   User: KJK
   Date: 2017-06-07
   Time: 오후 5:38
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="admin/_css/counsel.css" rel="stylesheet" type="text/css"/>
<script src="admin/_js/counsel.js" rel="script" type="text/javascript"></script>
<%-- ad_coun_list.jsp --%>
<h3>::상담 목록::</h3>
<hr style="color: deeppink">
<center>
	<table border="1" cellpadding="5" id="counList">
		<tr id="tableHead">
			<th>cNO</th>
			<th>회원번호</th>
			<th>관심분야</th>
			<th>글 작성일</th>
			<th>글 제목</th>
			<th>답변작성일</th>
			<th>작성자번호</th>
			<th>답변코멘트</th>
			<th>state</th>
		</tr>
		<c:forEach items="${counlist}" var="counInfo">
			<tr id="tableData">
				<td>${counInfo.cNO}</td>
				<td>${counInfo.mNO}</td>
				<td>
						<%-- 관심분야 --%>
					<c:choose>
						<c:when test="${counInfo.pTypeNO eq 'EY'}">눈성형</c:when>
						<c:when test="${counInfo.pTypeNO eq 'NO'}">코성형</c:when>
						<c:when test="${counInfo.pTypeNO eq 'FA'}">안면윤각성형</c:when>
						<c:when test="${counInfo.pTypeNO eq 'BO'}">체형성형</c:when>
						<c:when test="${counInfo.pTypeNO eq 'BR'}">가슴성형</c:when>
						<c:otherwise>???</c:otherwise>
					</c:choose>
				</td>
				<td>${counInfo.cDate}</td>
				<td id="cTitleText" title="내용 : ${counInfo.cContent}">${counInfo.cTitle}</td>
				<td>${fn:substring(counInfo.eDate,0,19)}</td>
				<td>${counInfo.eNO}</td>
				<td id="eComentText" title="${counInfo.eComent}">${counInfo.eComent}</td>
				<td>
						<%-- 상태 --%>
					<c:choose>
						<c:when test="${counInfo.state eq '1'}">공개</c:when>
						<c:when test="${counInfo.state eq '2'}">비공개</c:when>
						<c:when test="${counInfo.state eq '3'}">유저비공개</c:when>
						<c:when test="${counInfo.state eq '4'}">삭제</c:when>
						<c:otherwise>???</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
	</table>
</center>