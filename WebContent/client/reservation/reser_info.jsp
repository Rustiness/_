<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link href='client/_css/common.css' rel='stylesheet' />
<link href='client/_css/reservation.css' rel='stylesheet' />
<script src="client/_js/jquery-3.2.1.js" rel="script" type="text/javascript"></script>
<script src="client/_js/reservation.js" rel="script" type="text/javascript"></script>

<%-- reser_info.jsp(회원(ID)당 예약목록 확인하는 페이지) --%>
<c:if test="${user==null}">
	<script>
		alert("로그인 후 이용가능합니다.");
		location.href='login.do';
	</script>
</c:if>
<c:if test="${reser!=null}">  
<div class="reser_content">
   	<h3 class="con_title">
		<img alt="예약목록" src="client/_images/reser_info.PNG">
	</h3>
	<p><b>1. 예약자 정보</b></p>
	<hr size="2" color="#747474">
	<p style="padding-left: 40px;">
		예약자(ID)&nbsp;&nbsp;:&nbsp;&nbsp;${user.name}(${user.mID})<br><br>
		전화번호&nbsp;&nbsp;:&nbsp;&nbsp;${user.tel}<br><br>
		Email&nbsp;&nbsp;:&nbsp;&nbsp;${user.email}
	</p>
	<hr size="0.5" color="#D5D5D5" style="margin-bottom: 50px;">
	
	<p><b>2. 예약목록</b></p>
	<hr size="2" color="#747474">
	<table id="reserList" border="1" cellpadding="10" style="margin: 25px 0px 10px 40px;">
		<tr bgcolor="#fcffb0">
	       	<th>예약날짜</th>
	        <th>예약시간</th>
	   	   	<th>진료과목</th>
	       	<th>memo</th>
	        <th>예약상태</th>
	    </tr>
	         
	   <c:forEach items="${reser}" var="info">
	    <tr id="tableData" align="center">
	    	<td style="display:none;">${info.rNO}</td>
	        <td>${info.rDate}</td>
	       <c:if test="${fn:substring(info.rFTime,0,2)<12}">
		    <td>(오전예약) ${info.rFTime}-${info.rLTime}</td>
	       </c:if>
	       <c:if test="${fn:substring(info.rFTime,0,2)>12}">
		    <td>(오후예약) ${info.rFTime}-${info.rLTime}</td>
	       </c:if>
	        <td>${info.pTypeName}</td>
	        <td>${info.rContent}</td>
	        <td>
	        	<c:choose>
					<c:when test="${info.rState eq '1'}">예약대기</c:when>
					<c:when test="${info.rState eq '2'}"><font color="blue"><b>예약완료</b></font></c:when>
					<c:when test="${info.rState eq '3'}"><font color="red"><b>예약취소</b></font></c:when>
					<c:when test="${info.rState eq '4'}"><font color="purple"><b>진료완료</b></font></c:when>
					<c:otherwise>???</c:otherwise>
				</c:choose>
	        </td>
	    </tr>
	   </c:forEach>
	  
	</table>
	
	<div align="center" style="margin-bottom: 25px;">
	<c:if test="${rCurrentPage>=rPageRange+1 }">
         <a href ="/JavaChefWeb/reser_info.do?reser=mInfo&rpage=${tPrev }">◀</a>
      </c:if>
      
      <c:forEach begin="${rStartPageRange }" end="${rStartPageRange+rPageRange-1 }" var="i">
         <c:if test="${i<=totalPage }">
            <c:if test="${rCurrentPage==i }">
               [${i }]
            </c:if>
            <c:if test="${rCurrentPage!=i }">
               <a href ="/JavaChefWeb/reser_info.do?reser=mInfo&rpage=${i }">[${i }]</a>
            </c:if>
         </c:if>
      </c:forEach>
         
      <fmt:parseNumber var="pages" integerOnly="true" value="${totalPage/rPageRange}" />
      <c:if test="${rPageRangeGroup-1 < pages }">
         <a href ="/JavaChefWeb/reser_info.do?reser=mInfo&rpage=${tNext }">▶</a>
      </c:if>
	  </div>
	<hr size="0.5" color="#D5D5D5" style="margin-bottom: 50px;">
</div>

</c:if>