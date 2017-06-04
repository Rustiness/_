<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- coun_info.jsp --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery3.js"></script>
<script type="text/javascript">

</script>
<title>counsel_info.jsp</title>
</head>
<%-- counsel_info.jsp --%>
<body>
	<h3>온라인 상담정보</h3>
	<hr>
	<form method="POST">
		<div>
			<table border="1" cellpadding="5">
				<tr>
					<td width="80">상담분야</td>
				<!-- 	<td><input type="text" value="${choice.pTypeNO }" disabled>  -->
					<td colspan="9">${choice.pTypeNO } </td>
				</tr>

				<tr>
					<td>작성자</td>
					<td colspan="3">${choice.mNO }</td>
					<td>날짜</td>
					<td colspan="3">${choice.cDate }</td>
					<td>조회</td>
					<td colspan="3">${choice.cCount }</td>
				
				</tr>

				<tr>
					<td>글제목</td>
					<td colspan="9">${choice.cTitle } <br> </td>
				</tr>

				<tr>
					<td>내용</td>
					<td colspan="9">${choice.cContent }<br> 
							</td>
				</tr>

				<tr>
					<td>공개여부</td>
				  <c:if test="${choice.state eq '1'}"><td colspan="9">공개</td></c:if>
				  <c:if test="${choice.state eq '2'}"><td colspan="9">비공개</td></c:if>
				  <c:if test="${choice.state eq '3'}"><td colspan="9">유저 비공개</td></c:if>
				    
				</tr>


				<tr>
					<td>답변</td>
					<td colspan="9">
						<!--      	<textarea rows="10" cols="85" name="contents"></textarea> -->
					</td>
				</tr>
			</table>

			<br> &nbsp;&nbsp; 
			<a href="coun_mod.do"><input type="button" value="수정"></a> 
			<a href="coun.do?action=select&cNO=${bean.cNO }" ><input type="button" value="삭제"></a>

			<a href=coun.do><input type="button" value="목록"
				style="float: right; margin-right: 100px;"> </a>
		</div>
	</form>
</body>
</html>