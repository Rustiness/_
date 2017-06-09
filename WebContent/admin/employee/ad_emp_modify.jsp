<%--
   Created
   User: KJK
   Date: 2017-05-31
   Time: 오후 7:53
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="admin/_css/employee.css" rel="stylesheet" type="text/css"/>
<script src="admin/_js/employee.js" rel="script" type="text/javascript"></script>
<%-- ad_emp_modify.jsp --%>
<c:if test="${admin==null}">
	<script>
		alert("관리자 로그인 후 이용가능합니다.");
		location.href='admin.do';
	</script>
</c:if>
<c:if test="${admin!=null}">
<h3>::사원 정보 수정::</h3>
<hr style="color: deeppink">
<center>
	<form id="empModForm" method="post">
		<table border="1" cellpadding="5" id="empModify">
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
					<td><input name="name" type="text" value="${empInfo.name}" maxlength="10"></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input name="birth" type="date" value="${empInfo.birth}"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><select name="sex">
						<option value="1" <c:if test="${empInfo.sex eq '1'}">selected</c:if>>남성</option>
						<option value="2" <c:if test="${empInfo.sex eq '2'}">selected</c:if>>여성</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input name="tel" type="tel" maxlength="13" value="${empInfo.tel}"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input name="email" type="email" maxlength="30" value="${empInfo.email}"></td>
				</tr>
				<tr>
					<td>직책</td>
					<td><select name="position">
						<option value="1" <c:if test="${empInfo.position eq '1'}">selected</c:if>>미지정</option>
						<option value="2" <c:if test="${empInfo.position eq '2'}">selected</c:if>>팀원</option>
						<option value="3" <c:if test="${empInfo.position eq '3'}">selected</c:if>>팀장</option>
						<option value="4" <c:if test="${empInfo.position eq '4'}">selected</c:if>>실장</option>
						<option value="5" <c:if test="${empInfo.position eq '5'}">selected</c:if>>본부장</option>
					</select></td>
				</tr>
				<tr>
					<td>관리등급</td>
					<td>${empInfo.gName}</td>
				</tr>
				<tr>
					<td>입사일</td>
					<td><input name="hireDate" type="date" value="${empInfo.hireDate}"></td>
				</tr>
				<tr>
					<td>퇴사일</td>
					<td><input name="retireDate" type="date" value="${empInfo.retireDate}"></td>
				</tr>
				<tr>
					<td>최근접속일</td>
					<td>${empInfo.latestDate}</td>
				</tr>
				<tr>
					<td>계정상태</td>
					<td><select name="state">
						<option value="1" <c:if test="${empInfo.state eq '1'}">selected</c:if>>정상</option>
						<option value="2" <c:if test="${empInfo.state eq '2'}">selected</c:if>>휴직</option>
						<option value="3" <c:if test="${empInfo.state eq '3'}">selected</c:if>>퇴사</option>
						<option value="4" <c:if test="${empInfo.state eq '4'}">selected</c:if>>비활성</option>
					</select>
					</td>
				</tr>
			</c:forEach>
			<tr align="center">
				<td id="btnSet" colspan="2">
					<input type="button" id="btnModifyON" value="수정완료">
					<input type="reset" value="초기값 설정">
					<input type="button" id="btnCancel" value="수정취소">
					<input type="button" id="btnList" value="사원목록">
				</td>
			</tr>
		</table>
	</form>
</center>
</c:if>