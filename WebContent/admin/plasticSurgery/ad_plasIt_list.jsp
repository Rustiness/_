<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="admin/_css/employee.css" rel="stylesheet" type="text/css"/>
<script src="admin/_js/plasticItem.js" rel="script" type="text/javascript"></script>
<script type="text/javascript">
 function addMedical() {
		var url = "admin/plasticSurgery/ad_plasIt_add.jsp";
		window.open(url, 'ad_plasIt_add', width = 300, height = 100);
	
	} //addMedical()
 	
 	
 	</script>
<%-- ad_plasIt_list.jsp --%>
&nbsp;<h3>::성형시술정보 목록::</h3>
<hr style="color: green">
<center>
	<table border="1" cellpadding="5" id="plasItTable">
		<tr id="tableHead">
			<th>번호</th>
			<th>성형타입</th>
			<th>성형타입명</th>
			<th>성형시술번호</th>
			<th>성형시술명</th>
			<th>가격</th>
			<th>상태</th>
			
		</tr>
		<c:forEach items="${list}" var="plasItInfo">
			<tr id="tableData">
				
				<td>${plasItInfo.num}</td>
				<td>${plasItInfo.pTypeNO}</td>
				<td>${plasItInfo.pTypeName}</td>
				<td>${plasItInfo.pItemNO}</td>
				<td>${plasItInfo.pItemName}</td>
				<td>${plasItInfo.pItemValue}</td>
				<td>${plasItInfo.state}</td>
			</tr>
		</c:forEach>
		<input type="button" value="추가 진료과목입력" onclick="addMedical()"> <font color="blue">(추가 정보입력)</font>
	</table>
	<!-- switch == choose , when == case, otherwise == default 이렇게 같다고 생각하면 됨. -->
	<c:forEach begin="${startPage }" end="${endPage }" var="i">
		<c:if test="${i<=totalPage }">
		<!-- totalPage = 전체 리스트 행의 갯수 / 한 페이지에 보여질 행의 갯수  == 32;-->
      [<a href="ad_plasIt.do?page=${i}">${i }</a>] <!-- [1] 누르면 1페이지로 이동하고 [2] 누르면 2페이지로 이동 이런식으로 쭉~ -->
	</c:if>
	</c:forEach>

	<br>
	<c:choose>
		<c:when test="${page==1 }">
			<!-- page값이 1일때  '이전'이라는 문자는 나오지만 클릭이 되지 않게 비활성화 되는거고-->
                이전
        </c:when>
		<c:otherwise>
			<a href="ad_plasIt.do?page=${page-1 }">이전</a>
			<!-- '이전'버튼이 클릭된다는건 page값이 2이상이라는거. -->
		</c:otherwise>
	</c:choose>

	<c:if test="${page==totalPage }">
		<!-- 만약 page값이 totalPage와 같다면 '다음' 문자열이 생기고 -->
              다음
      </c:if>

	<c:if test="${page<totalPage }">
		<!-- page값보다 totalPage값이 크다면 -->
		<a href="ad_plasIt.do?page=${page+1 }">다음</a>
		<!-- '다음 '문자열을 눌러서 다음 페이지로 이동할 수 있음. -->
	</c:if>
</center>