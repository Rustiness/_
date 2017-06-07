<%--
   Created
   User: KJK
   Date: 2017-06-07
   Time: 오전 09:31
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="admin/_css/member.css" rel="stylesheet" type="text/css"/>
<script src="admin/_js/member.js" rel="script" type="text/javascript"></script>
<%-- ad_mem_info.jsp --%>
<h3>::회원 상세정보::</h3>
<hr style="color: deeppink">
<center>
	<table border="1" cellpadding="5" id="memInfo">
		<tr id="tableHead">
			<th>항목</th>
			<th>정보</th>
		</tr>
		<c:forEach items="${memlist}" var="memInfo">
			<tr>
				<td>식별번호</td>
				<td>${memInfo.mNO}</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${memInfo.mID}</td>
			</tr>
			<tr>
				<td>회원가입질문</td>
				<td>${memInfo.qNO}</td>
			</tr>
			<tr>
				<td>회원가입답변</td>
				<td>${memInfo.answer}</td>
			</tr>
			<tr>
				<td>회원명</td>
				<td>${memInfo.name}</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>${memInfo.birth}</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
						<%-- 성별 --%>
					<c:choose>
						<c:when test="${memInfo.sex eq '1'}">남성</c:when>
						<c:when test="${memInfo.sex eq '2'}">여성</c:when>
						<c:otherwise>???</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${memInfo.tel}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${memInfo.email}</td>
			</tr>
			<tr>
				<td>관심사</td>
				<td>${memInfo.pTypeNO}</td>
			</tr>
			<tr>
				<td>최근접속일</td>
				<td>${memInfo.latestDate}</td>
			</tr>
			<tr>
				<td>가입일</td>
				<td>${memInfo.joinDate}</td>
			</tr>
			<tr>
				<td>회원메모</td>
				<td><textarea style="overflow: auto;" readonly>${memInfo.mMemo}</textarea></td>
			</tr>
			<tr>
				<td>회원메모수정일</td>
				<td><c:if test="${memInfo.mMdate eq null}">미등록</c:if>${memInfo.mMdate}</td>
			</tr>
			<tr>
				<td>예약정보</td>
				<td>${memInfo.rNO}</td>
			</tr>
			<tr>
				<td>견적정보</td>
				<td>${memInfo.pNO}</td>
			</tr>
			<tr>
				<td>계정상태</td>
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
		<tr align="center">
			<td id="btnSet" colspan="2">
				<input type="button" id="btnModify" value="정보수정">
				<input type="button" id="btnList" value="회원목록">
			</td>
		</tr>
	</table>
</center>
