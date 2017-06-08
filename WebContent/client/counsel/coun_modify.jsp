<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- coun_modify.jsp --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<title>counsel_info.jsp</title>
<script type="text/javascript">

function validcheck(){
	var f = document.form;
	if(f.pTypeNO.value=='======'){
		alert('상담분야를 선택하세요~!');
	}else if(f.cTitle.value==''){
		alert('글 제목을 입력하세요~!');
		f.cTitle.focus();
	}else if(f.cContent.value==''){
		alert('내용을 입력하세요~!');
		f.cContent.focus();
	}else if(f.state.value=='======'){
		alert('공개여부를 선택하세요~!');
	}
	f.submit();
} 
</script>

</head>

<body>
	<h3>온라인 상담정보</h3>
	<hr>
	<form action="coun_modcheck.do" method="POST" name="form">
		<input type="hidden" name="action" value="update" />
		<!-- <input type="hidden" name="id" value="${guest.id }"> -->
		<input type="hidden" name="cNO" value="${choice.cNO }" />
		<div>
			<table border="1" cellpadding="5">
				<tr>
					<td width="80">상담분야</td>
					<td>
					    <select name="pTypeNO" onchange="validcheck()">
    						 <option>
    						 <c:if test="${choice.pTypeNO eq 'EY'}">눈성형</c:if>
	                         <c:if test="${choice.pTypeNO eq 'NO'}">코성형</c:if>
	           			     <c:if test="${choice.pTypeNO eq 'FA'}">얼굴성형</c:if>
	           	   			 <c:if test="${choice.pTypeNO eq 'BO'}">체형성형</c:if>
	           				 <c:if test="${choice.pTypeNO eq 'BR'}">가슴성형</c:if>
	           				 </option>
	           				 <option>======</option>
	           				 <option value="EY">눈성형</option> 
    						 <option value="NO">코성형</option>
     						 <option value="FA">얼굴성형</option>
    						 <option value="BO">체형성형</option>
    						 <option value="BR">가슴성형</option>
    						
  					   </select>
 					</td>
				</tr>

				<tr>
					<td>작성자</td>
					<td colspan="3"><input type="text" name="mNO"
						value="${choice.mNO }" readonly> 날짜 <input type="text"
						value="${choice.cDate }" readonly>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 조회 <input type="text" size="5" value="${choice.cCount }" readonly>
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
					 <td>
					  <select name="state"> 
						 <option>
    						 <c:if test="${choice.state eq '1'}">공개</c:if>
	                         <c:if test="${choice.state eq '2'}">비공개</c:if>
	           				 </option>
	           				 <option>======</option>
	           				<option>공개</option>
	           				<option>비공개</option>
  					   </select>
					 </td>
				</tr>

				<tr>
					<td>답변</td>
					<td colspan="3">
					</td>
				</tr>
			</table>

			<br> &nbsp;&nbsp; 
			<button value="수정 확인" onclick="validcheck()">수정 확인</button> 
			<input type="button" value="삭제" onclick="">


			<a href=coun.do><input type="button" value="목록"
				style="float: right; margin-right: 150px;"> </a>
		</div>
	</form>
</body>
</html>