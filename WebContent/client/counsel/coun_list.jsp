<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- coun_list.jsp --%>
<%@page import="java.util.List"%>
<%@page import="kr.hospi.beans.Counsel"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link href="client/_css/counsel.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
 function search(){
	if(document.frm.word.value=='')
		{
			alert('검색어를 입력하세요!!');
			location.href='coun.do'
		}	
	else
		document.frm.submit(); 
 }
</script>

<title>온라인 상담 목록 조회</title>
</head>
<%-- counsel_list.jsp --%>
<body>
	<h3>온라인 상담목록</h3>
	<hr>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	<form action="coun_search.do" name="frm" method="POST">
		<input type="hidden" name="action" value="writer" /> 
		<select	name="field">
			<option value="writer">글쓴이</option>
			<option value="title">제목</option>
		</select> <input type="text" name="word" size="10">
		<input type="button" onclick="search()" value="검색">
	</form>

	<table border="1" cellpadding="5" id="listtable">
		<tr bgcolor="hotpink" id="tableHead">
			<th>번호</th>
			<th>관심분야</th>
			<th>작성자</th>
			<th>제목</th>
			<th>공개여부</th>
			<th>조회</th>
		</tr>

		<c:forEach items="${list }" var="bean">
			<tr>
				<td>${bean.cNO }</td>
				<c:if test="${bean.pTypeNO eq 'EY'}">
					<td align="center">눈성형</td>
				</c:if>
				<c:if test="${bean.pTypeNO eq 'NO'}">
					<td align="center">코성형</td>
				</c:if>
				<c:if test="${bean.pTypeNO eq 'FA'}">
					<td align="center">얼굴성형</td>
				</c:if>
				<c:if test="${bean.pTypeNO eq 'BO'}">
					<td align="center">체형성형</td>
				</c:if>
				<c:if test="${bean.pTypeNO eq 'BR'}">
					<td align="center">가슴성형</td>
				</c:if>

				<td align="center">${bean.mNO }</td>
				<td><a href="coun_info.do?action=select&cNO=${bean.cNO }">${bean.cTitle }</a></td>
				<c:if test="${bean.state eq '1'}">
					<td align="center">공개</td>
				</c:if>
				<c:if test="${bean.state eq '2'}">
					<td align="center">비공개</td>
				</c:if>
				<td align="center">${bean.cCount }</td>
				<input type="hidden" id="mID" value="${user.mID}">
			</tr>

		</c:forEach>

	</table>

	 <!-- ================================페이징 코드 시작 ============================================== --> 
    <!-- switch == choose , when == case, otherwise == default 이렇게 같다고 생각하면 됨. -->
    <c:forEach begin="${startPage }" end="${endPage }" var="i"> <!-- totalPage = 전체 리스트 행의 갯수 / 한 페이지에 보여질 행의 갯수  == 32;-->
      <c:if test="${i<=totalPage }"> <!--  -->
      	[<a href="coun.do?page=${i}" >${i }</a>] <!-- [1] 누르면 1페이지로 이동하고 [2] 누르면 2페이지로 이동 이런식으로 쭉~ -->
      </c:if>
    </c:forEach>
    
    <br>
      <c:choose>  
        <c:when test="${page==1 }"> <!-- page값이 1일때  '이전'이라는 문자는 나오지만 클릭이 되지 않게 비활성화 되는거고-->
                이전
        </c:when>
        <c:otherwise>
         <a href="coun.do?page=${page-1 }">이전</a> <!-- '이전'버튼이 클릭된다는건 page값이 2이상이라는거. -->
        </c:otherwise>
      </c:choose>
            
      <c:if test="${page==totalPage }"><!-- 만약 page값이 totalPage와 같다면 '다음' 문자열이 생기고 -->
              다음
      </c:if>
      
      <c:if test="${page<totalPage }"> <!-- page값보다 totalPage값이 크다면 -->
        <a href="coun.do?page=${page+1 }">다음</a> <!-- '다음 '문자열을 눌러서 다음 페이지로 이동할 수 있음. -->
      </c:if>
	
  <!-- ================================페이징 코드 시작 ============================================== -->      
	

	<a href="coun_con.do"><input type="button" value="쓰기"></a>

</body>
</html>
