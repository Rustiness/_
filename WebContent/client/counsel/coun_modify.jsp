<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- coun_modify.jsp --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<title>counsel_info.jsp</title>
</head>

<body>
	<h3>온라인 상담정보</h3>
	<hr>
	<form action="/JavaChefWeb/coun.do" method="POST">
		<input type="hidden" name="cNO" value="${choice.cNO }" />
		<!-- <input type="hidden" name="id" value="${guest.id }"> -->
		<div>
			<table border="1" cellpadding="5">
				<tr>
					<td width="80">상담분야</td>
					<td><input type="text" name="pTypeNO"
						value="${choice.pTypeNO }"></td>

				</tr>

				<tr>
					<td>작성자</td>
					<td colspan="3"><input type="text" name="mNO"
						value="${choice.mNO }" disabled> 날짜 <input type="text"
						value="${choice.cDate }" disabled>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 조회 <input type="text" size="5" value="${choice.cContent }">
					</td>
				</tr>

				<tr>
				<td>글 제목 </td>
				<td><input type="text" name="cTitle" size="50" value="${choice.cTitle }" maxlength="16"><br>
				(글 제목은 16자내로 입력하십시오.)</td>
				</tr>
				
				<tr>
					<td>내용</td>
					<td colspan="2"><textarea rows="5" cols="50" name="cContent" value="${choice.cContent }" maxlength="166">${choice.cContent }</textarea><br>
						(내용은 160자내로 입력하십시오.)</td>
				</tr>
				
				<tr>
					<td>공개여부</td>
				 <c:if test="${choice.state eq '1'}"><td colspan="9">공개</td></c:if>
				  <c:if test="${choice.state eq '2'}"><td colspan="9">비공개</td></c:if>
				  <c:if test="${choice.state eq '3'}"><td colspan="9">유저 비공개</td></c:if>
				</tr>

				<tr>
					<td>답변</td>
					<td colspan="3">
					</td>
				</tr>
			</table>

			<br> &nbsp;&nbsp; <input type="submit" value="수정 확인"> 
			<input type="button" value="삭제" onclick="">


			<a href=coun.do><input type="button" value="목록"
				style="float: right; margin-right: 100px;"> </a>
		</div>
	</form>
</body>
</html>