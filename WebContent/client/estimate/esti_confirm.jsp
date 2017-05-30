<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- esti_confirm.jsp --%>

	<h3>나의 성형예상비용</h3>
<script type="text/javascript" src="../_js/jquery-3.2.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $("#su").click(function(){
        $("#div").toggle();
    });
});
  	
 </script>
 	
 									
                                                    <a href="#1">눈성형</a>
                                                    <a href="#2">코성형</a>
                                                    <a href="#3">안면윤곽성형</a>
                                                    <a href="#4">체형성형</a>
                                                    <a href="#5">가슴성형</a>
                                                   

<br>
<hr>
<form action="esti_res.do" method="post">

<a name='1'></a>
	<button id="su">Toggle between hide() and show()</button>	
	<h4 class="title_01_s pat30">
		<img alt="눈성형 " />
	</h4>
		
	<div id="div">
	<table cellspacing='0' cellpadding='2' width=605 border="0">
		<tr>
			<td bgcolor='#D5C4E1' colspan='4' height='2'></td>
		</tr>
		<tr>
			<td colspan='4' height='1' bgcolor='#A29D9A'></td>
		</tr>
		<c:forEach items="${list1 }" var="eye">
		 <tr>
								
				<td align='middle' width='30' bgcolor='#F5F0F9' height='30'><input
					type='checkbox' value='${eye.pTypeNO }|${eye.pItemName }|${eye.pItemValue }' name='chkList'></td>
				<td width='246'>${eye.pItemName }</td>
				<td width='246'>${eye.pItemValue }</td>
						
		
			<tr>
				<td bgcolor='#D5C4E1' colspan='4' height='2'></td>
			
		</c:forEach>
	</table>
</div>

	<a name='2'></a>

	<h4 class="title_01_s pat30">
		<img alt="코성형 " />
	</h4>
	<div >
	<table cellspacing='0' cellpadding='2' width=605 border="0">
		<tr>
			<td bgcolor='#D5C4E1' colspan='4' height='2'></td>
		</tr>
		<tr>
			<td colspan='4' height='1' bgcolor='#A29D9A'></td>
		</tr>
		<c:forEach items="${list2 }" var="nose">
		 <tr>
								
				<td align='middle' width='30' bgcolor='#F5F0F9' height='30'><input
					type='checkbox' value='${nose.pTypeNO }|${nose.pItemName }|${nose.pItemValue }' name='chkList'></td>
				<td width='246'>${nose.pItemName }</td>
				<td width='246'>${nose.pItemValue }</td>
						
		
			<tr>
				<td bgcolor='#D5C4E1' colspan='4' height='2'></td>
			
		</c:forEach>
	</table>
</div>	
	<a name='3'></a>

	<h4 class="title_01_s pat30">
		<img alt="안면윤곽성형 " />
	</h4>
	
	<table cellspacing='0' cellpadding='2' width=605 border="0">
		<tr>
			<td bgcolor='#D5C4E1' colspan='4' height='2'></td>
		</tr>
		<tr>
			<td colspan='4' height='1' bgcolor='#A29D9A'></td>
		</tr>
		<c:forEach items="${list3 }" var="face">
		 <tr>
								
				<td align='middle' width='30' bgcolor='#F5F0F9' height='30'><input
					type='checkbox' value='${face.pTypeNO }|${face.pItemName }|${face.pItemValue }' name='chkList'></td>
				<td width='246'>${face.pItemName }</td>
				<td width='246'>${face.pItemValue }</td>
						
		
			<tr>
				<td bgcolor='#D5C4E1' colspan='4' height='2'></td>
			
		</c:forEach>
	</table>
	
	<a name='4'></a>

	<h4 class="title_01_s pat30">
		<img alt="체형성형 " />
	</h4>
	
	<table cellspacing='0' cellpadding='2' width=605 border="0">
		<tr>
			<td bgcolor='#D5C4E1' colspan='4' height='2'></td>
		</tr>
		<tr>
			<td colspan='4' height='1' bgcolor='#A29D9A'></td>
		</tr>
		<c:forEach items="${list4 }" var="body">
		 <tr>
								
				<td align='middle' width='30' bgcolor='#F5F0F9' height='30'><input
					type='checkbox' value='${body.pTypeNO }|${body.pItemName }|${body.pItemValue }' name='chkList'></td>
				<td width='246'>${body.pItemName }</td>
				<td width='246'>${body.pItemValue }</td>
						
		
			<tr>
				<td bgcolor='#D5C4E1' colspan='4' height='2'></td>
			
		</c:forEach>
	</table>
	
	<a name='5'></a>

	<h4 class="title_01_s pat30">
		<img alt="가슴성형 " />
	</h4>
	
	<table cellspacing='0' cellpadding='2' width=605 border="0">
		<tr>
			<td bgcolor='#D5C4E1' colspan='4' height='2'></td>
		</tr>
		<tr>
			<td colspan='4' height='1' bgcolor='#A29D9A'></td>
		</tr>
		<c:forEach items="${list5 }" var="breast">
		 <tr>
								
				<td align='middle' width='30' bgcolor='#F5F0F9' height='30'><input
					type='checkbox' value='${breast.pTypeNO }|${breast.pItemName }|${breast.pItemValue }' name='chkList'></td>
				<td width='246'>${breast.pItemName }</td>
				<td width='246'>${breast.pItemValue }</td>
						
		
			<tr>
				<td bgcolor='#D5C4E1' colspan='4' height='2'></td>
			
		</c:forEach>
	</table>
	<input type="submit" value="나의 성형예상비용"> 
	<input type="reset" value="선택항목 모두 취소">
			
</form>


