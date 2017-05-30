<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- ad_estimate_list_category.jsp --%>
<center>
	<form action="" method="POST">


		<table border="1" cellpadding="10" width="1200">
			<tr bgcolor="#fcffb0">
				<th width="70">성형분류번호</th>
				<th>성형분류명</th>
				<th>비고</th>
			</tr>

			<tr align=center>

				<!--<td><html:link action="/webProject2/ad_reservation_result">gildong10</html:link></td>  -->
				<td>1</td>
				<td>눈성형</td>
				<td><input type="submit" value="수정" onclick="location.href='ad_estimate_input.jsp'" /></td>
			</tr>
			
			<tr align=center>

				<!--<td><html:link action="/webProject2/ad_reservation_result">gildong10</html:link></td>  -->
				<td>2</td>
				<td>코성형</td>
				<td><input type="submit" value="수정"  /></td>
			</tr>
			
			<tr align=center>

				<!--<td><html:link action="/webProject2/ad_reservation_result">gildong10</html:link></td>  -->
				<td>3</td>
				<td>안면윤곽성형</td>
				<td><input type="submit" value="수정" /></td>
			</tr>
			
			<tr align=center>

				<!--<td><html:link action="/webProject2/ad_reservation_result">gildong10</html:link></td>  -->
				<td>4</td>
				<td>체형성형</td>
				<td><input type="submit" value="수정" /></td>
			</tr>
			
			<tr align=center>

				<!--<td><html:link action="/webProject2/ad_reservation_result">gildong10</html:link></td>  -->
				<td>5</td>
				<td>가슴성형</td>
				<td><input type="submit" value="수정" /></td>
			</tr>
		</table>
		<br>
		<br>
		<c:forEach begin="1" end="5" var="i">
			[${i }]
		</c:forEach>
		<br> <input type="submit" value="생성" /> <input type="reset"
			value="취소" />
	</form>
</center>