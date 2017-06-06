<%--
   Created
   User: kosta
   Date: 2017-06-06
   Time: 오후 6:06
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="admin/_css/employee.css" rel="stylesheet" type="text/css"/>
<script src="admin/_js/employee.js" rel="script" type="text/javascript"></script>
<%-- ad_emp_confirm.jsp --%>
<h3>::사원 정보 등록::</h3>
<hr style="color: deeppink">
<center>
	<form id="empConForm" method="post">
		<table border="1" cellpadding="5" id="empConfirm">
			<tr id="tableHead">
				<th>항목</th>
				<th>정보</th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input name="eID" type="text" maxlength="20"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input name="pass" type="password" maxlength="30"></td>
			</tr>
			<tr>
				<td>사원명</td>
				<td><input name="name" type="text" maxlength="10"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input name="birth" type="date"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><select name="sex">
					<option value="1">남성</option>
					<option value="2">여성</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input name="tel" type="tel" maxlength="13"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input name="email" type="email" maxlength="30"></td>
			</tr>
			<tr>
				<td>직책</td>
				<td><select name="position">
					<option value="1">미지정</option>
					<option value="2">팀원</option>
					<option value="3">팀장</option>
					<option value="4">실장</option>
					<option value="5">본부장</option>
				</select></td>
			</tr>
			<tr>
				<td>관리등급</td>
				<td>미지정</td>
			</tr>
			<tr>
				<td>입사일</td>
				<td><input name="hireDate" type="date"></td>
			</tr>
			<tr>
				<td>계정상태</td>
				<td><select name="state">
					<option value="1">정상</option>
					<option value="2">휴직</option>
					<option value="3">퇴사</option>
					<option value="4" selected>비활성</option>
				</select>
				</td>
			</tr>
			<tr align="center">
				<td id="btnSet" colspan="2">
					<input type="button" id="btnInsertON" value="등록완료">
					<input type="reset" value="등록취소">
				</td>
			</tr>
		</table>
	</form>
</center>