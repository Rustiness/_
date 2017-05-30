<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- ad_estimate_list_body.jsp --%>
	<center>
		<form action="" method="POST">
		<input  type="submit" value="수정" />
		<input  type="reset" value="취소"/>
		<input  type="button" value="삭제"/>
			<table border="1" cellpadding="10" width="1200">
				<tr bgcolor="#fcffb0">
				<th width="70">타입번호</th>
				<th>성형타입명</th>
				<th>성형시술번호</th>
				<th>성형시술명</th>
				<th>성형시술가격</th>
				</tr>
				
				<tr align=center >
			
				<!--<td><html:link action="/webProject2/ad_reservation_result">gildong10</html:link></td>  -->
				<td>1</td>
				<td>눈성형</td>
				<td>1001</td>
				<td>매몰법쌍꺼풀</td>
				<td>1,200,000</td>
					
				</tr>
			</table>
			<br><br>
		<c:forEach begin="1" end="5" var="i">
			[${i }]
		</c:forEach>
		</form>
	</center>