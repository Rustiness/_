<%--
   Created
   User: KJK
   Date: 2017-06-07
   Time: 오전 10:38
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="admin/_css/member.css" rel="stylesheet" type="text/css"/>
<script src="admin/_js/member.js" rel="script" type="text/javascript"></script>
<%-- ad_mem_modify.jsp --%>
<h3>::회원 정보 수정::</h3>
<hr style="color: deeppink">
<center>
	<form id="memModForm" method="post">
		<table border="1" cellpadding="5" id="memModify">
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
					<td>가입시 선택 질문</td>
					<td>${memInfo.qNO}</td>
				</tr>
				<tr>
					<td>가입시 작성 답변</td>
					<td>${memInfo.answer}</td>
				</tr>
				<tr>
					<td>회원명</td>
					<td><input name="name" type="text" value="${memInfo.name}" maxlength="10"></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input name="birth" type="date" value="${memInfo.birth}"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><select name="sex">
						<option value="1" <c:if test="${memInfo.sex eq '1'}">selected</c:if>>남성</option>
						<option value="2" <c:if test="${memInfo.sex eq '2'}">selected</c:if>>여성</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input name="tel" type="tel" maxlength="13" value="${memInfo.tel}"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input name="email" type="email" maxlength="30" value="${memInfo.email}"></td>
				</tr>
				<tr>
					<td>관심사</td>
					<td>${memInfo.pTypeNO}</td>
				</tr>
				<tr>
					<td>회원메모</td>
					<td><textarea name="mMemo" maxlength="100" style="overflow: auto;">${memInfo.mMemo}</textarea></td>
				</tr>
				<tr>
					<td>마지막 메모작성일</td>
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
					<td><select name="state">
						<option value="1" <c:if test="${memInfo.state eq '1'}">selected</c:if>>정상</option>
						<option value="2" <c:if test="${memInfo.state eq '2'}">selected</c:if>>장기미접속</option>
						<option value="3" <c:if test="${memInfo.state eq '3'}">selected</c:if>>탈퇴</option>
						<option value="4" <c:if test="${memInfo.state eq '4'}">selected</c:if>>이용정지</option>
					</select>
					</td>
				</tr>
			</c:forEach>
			<tr align="center">
				<td id="btnSet" colspan="2">
					<input type="button" id="btnModifyON" value="수정완료">
					<input type="reset" value="초기값 설정">
					<input type="button" id="btnCancel" value="수정취소">
					<input type="button" id="btnList" value="회원목록">
				</td>
			</tr>
		</table>
	</form>
</center>