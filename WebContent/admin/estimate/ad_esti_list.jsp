<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="admin/_css/employee.css" rel="stylesheet" type="text/css" />
<script src="admin/_js/estimate.js" rel="script" type="text/javascript"></script>

<%-- ad_plasIt_list.jsp --%>
&nbsp;
<h3>::환자성형시술정보 목록::</h3>
<hr style="color: green">
<center>
	<table border="1" cellpadding="5" id="plasEsTable">
		<tr id="tableHead">
			<th>환자번호</th>
			<th>신청날짜</th>
			<th>눈성형</th>
			<th>코성형</th>
			<th>얼굴윤곽성형</th>
			<th>체형성형</th>
			<th>가슴성형</th>


		</tr>
		<c:forEach items="${listAll }" var="estimate">
			<tr id="tableData">
				<td>${estimate.pNO}</td>
				<td>${estimate.pDate}</td>
				<td>${estimate.pEyeItem }</td>
				<td>${estimate.pNoseItem }</td>
				<td>${estimate.pFaceItem }</td>
				<td>${estimate.pBodyItem }</td>
				<td>${estimate.pBreastItem }</td>

			</tr>
		</c:forEach>
	</table>
	<!-- switch == choose , when == case, otherwise == default 이렇게 같다고 생각하면 됨. -->
	<c:forEach begin="${startPage }" end="${endPage }" var="i">
		<!-- totalPage = 전체 리스트 행의 갯수 / 한 페이지에 보여질 행의 갯수  == 32;-->
      [<a href="ad_esti.do?page=${i}">${i }</a>] <!-- [1] 누르면 1페이지로 이동하고 [2] 누르면 2페이지로 이동 이런식으로 쭉~ -->
	</c:forEach>

	<br>
	<c:choose>
		<c:when test="${page==1 }">
			<!-- page값이 1일때  '이전'이라는 문자는 나오지만 클릭이 되지 않게 비활성화 되는거고-->
                이전
        </c:when>
		<c:otherwise>
			<a href="ad_esti.do?page=${page-1 }">이전</a>
			<!-- '이전'버튼이 클릭된다는건 page값이 2이상이라는거. -->
		</c:otherwise>
	</c:choose>

	<c:if test="${page==totalPage }">
		<!-- 만약 page값이 totalPage와 같다면 '다음' 문자열이 생기고 -->
              다음
      </c:if>

	<c:if test="${page<totalPage }">
		<!-- page값보다 totalPage값이 크다면 -->
		<a href="ad_esti.do?page=${page+1 }">다음</a>
		<!-- '다음 '문자열을 눌러서 다음 페이지로 이동할 수 있음. -->
	</c:if>

</center>