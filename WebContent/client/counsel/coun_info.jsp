<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- coun_info.jsp --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/JavaChefWeb/client/_js/jquery-3.2.1.js"></script>

<script type="text/javascript">
  function remove(){ //삭제버튼 클릭시 state를 유저 비공개로 해서 목록 리스트에서 안보이며 삭제된것처럼 보이게 함.
	 $.ajax({
		       url:'/JavaChefWeb/coun_modcheck.do',
		       data:{
		    	      action:'remove',
		    	      cNO:'${param.cNO}'
		            },
               type:'post',
               success:function(result){
            	   //화면에서 해당 목록 삭제후 '온라인 상담목록' 출력
            	   //alert('성공!!');
            	   location.href='coun.do'
               },
               error:function(xhr){
            	   //alert('실패!!'+ xhr.status);
               }
	 });
  }
</script>
<title>counsel_info.jsp</title>
</head>
<%-- counsel_info.jsp --%>
<body>
	<h3>온라인 상담정보</h3>
	<hr>
	<form method="POST" name="frm" action="coun_modcheck.do">
		<div>
			<table border="1" cellpadding="5">
				<tr>
					<td width="80">상담분야</td>
				<!-- 	<td><input type="text" value="${choice.pTypeNO }" disabled>  -->
			        <td>
				<c:if test="${choice.pTypeNO eq 'EY'}"><td>눈성형</td></c:if>
	            <c:if test="${choice.pTypeNO eq 'NO'}"><td>코성형</td></c:if>
	           	<c:if test="${choice.pTypeNO eq 'FA'}"><td>얼굴성형</td></c:if>
	           	<c:if test="${choice.pTypeNO eq 'BO'}"><td>체형성형</td></c:if>
	           	<c:if test="${choice.pTypeNO eq 'BR'}"><td>가슴성형</td></c:if>
	           	</td>
				</tr>

				<tr>
					<td>작성자</td>
					<td colspan="3">${choice.mNO }</td>
					<td>날짜</td>
					<td colspan="3">${fn:substring(choice.cDate,0,19)}</td> 
					<!-- ${fn:substring(choice.cDate,0,19)} 19는 2017-06-05 15:20:35 의 전체 자릿수를 의미함.  -->
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
			<input type="button" value="삭제" onclick="remove()">

			<a href=coun.do><input type="button" value="목록"
				style="float: right; margin-right: 380px;"> </a>
		</div>
	</form>
</body>
</html>