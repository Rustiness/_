<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- coun_list.jsp --%>
<%@page import="java.util.List"%>
<%@page import="kr.hospi.beans.Counsel"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>온라인 상담 목록 조회</title>
</head>
<%-- counsel_list.jsp --%>
<body>
<h3>온라인 상담목록</h3>
<hr>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<form action="/JavaChefWeb/counsearch.do" name="frm" method="POST">
 <input type="hidden" name="action" value="writer"/>
<select name="field">
 <option value="writer">글쓴이</option>
 <option value="title">제목</option>
</select>
<input type="text" name="word" size="10">
<button type="submit">검색</button>
   </form>

    <table border="1" cellpadding="5" >
       <tr bgcolor="hotpink"><th>번호</th><th>관심분야</th><th>작성자</th><th>제목</th>
                             <th>공개여부</th><th>조회</th></tr>      
	
         <c:forEach items="${list }" var="bean">
	       <tr>
	           <td>${bean.cNO }</td>
	            <c:if test="${bean.pTypeNO eq 'EY'}"><td>눈성형</td></c:if>
	            <c:if test="${bean.pTypeNO eq 'NO'}"><td>코성형</td></c:if>
	            <c:if test="${bean.pTypeNO eq 'FA'}"><td>얼굴성형</td></c:if>
	            <c:if test="${bean.pTypeNO eq 'BO'}"><td>체형성형</td></c:if>
	            <c:if test="${bean.pTypeNO eq 'BR'}"><td>가슴성형</td></c:if>

	           <td>${bean.mNO }</td>
	            <td><a href="coun_info.do?action=select&cNO=${bean.cNO }">${bean.cTitle }</a></td>
	         <c:if test="${bean.state eq '1'}"><td>공개</td></c:if>
	         <c:if test="${bean.state eq '2'}"><td>비공개</td></c:if> 	
	   			<td>${bean.cCount }</td>
	       </tr>    
	            
       </c:forEach>    
  
   </table>
   
   <!-- 페이징 코드 작업 부분 -->
    <c:if test="${rCurrentPage>=rPageRange+1 }">
         <a href ="/JavaChefWeb/coun.do?rpage=${tPrev }">◀</a>
      </c:if>
      
      <c:forEach begin="${rStartPageRange }" end="${rStartPageRange+rPageRange-1 }" var="i">
         <c:if test="${i<=totalPage }">
            <c:if test="${rCurrentPage==i }">
               [${i }]
            </c:if>
            <c:if test="${rCurrentPage!=i }">
               <a href ="/JavaChefWeb/coun.do?rpage=${i }">[${i }]</a>
            </c:if>
         </c:if>
      </c:forEach>
         
      <fmt:parseNumber var="pages" integerOnly="true" value="${totalPage/rPageRange}" />
      <c:if test="${rPageRangeGroup-1 < pages }">
         <a href ="/JavaChefWeb/coun.do?rpage=${tNext }">▶</a>
      </c:if>
 
<a href="coun_con.do"><input type="button" value="쓰기"></a>

</body>
</html>
