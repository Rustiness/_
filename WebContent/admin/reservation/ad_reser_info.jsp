<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link href='admin/_css/common.css' rel='stylesheet' />
<link href='admin/_css/reservation.css' rel='stylesheet' />
<script src="admin/_js/jquery-3.2.1.min.js" rel="script" type="text/javascript"></script>
<script src="admin/_js/reservation.js" rel="script" type="text/javascript"></script>
<style>
	hr{
		width: 90%;
	}	
</style>
<%-- ad_reser_info.jsp(예약 상세페이지) --%>
<c:if test="${admin==null}">
	<script>
		alert("관리자 로그인 후 이용가능합니다.");
		location.href='admin.do';
	</script>
</c:if>
<c:if test="${admin!=null}">
   <center>
   	<h3 class="con_title">
		<p><img alt="예약상세" src="admin/_images/ad_reser_info.PNG"></p>
	</h3><br>
	<p><b>1. 예약자 정보</b></p>
	<hr size="2" color="#747474">
	<p style="padding-left: 40px;">
		예약자(ID)&nbsp;&nbsp;:&nbsp;&nbsp;${reser.name}(${reser.mID})<br><br>
		전화번호&nbsp;&nbsp;:&nbsp;&nbsp;${reser.tel}<br><br>
		Email&nbsp;&nbsp;:&nbsp;&nbsp;${reser.email}
	</p>
	<hr size="0.5" color="#D5D5D5" style="margin-bottom: 50px;">
	
	<p><b>2. 예약정보</b></p>
	<hr size="2" color="#747474">
	<table id="reserList" border="1" cellpadding="10" style="margin: 25px 0px 25px 0px;">
		<tr bgcolor="#fcffb0">
            <th>예약번호</th>
            <th>예약날짜</th>
            <th>예약시간</th>
            <th>진료과목</th>
            <th>memo</th>
            <th>예약상태</th>
        </tr>
            
        <tr id="tableData" align=center>
            <td>${reser.rNO}</td>
            <td>${reser.rDate}</td>
            <c:if test="${fn:substring(reser.rFTime,0,2)<12}">
	            <td>(오전예약) ${reser.rFTime}-${reser.rLTime}</td>
            </c:if>
            <c:if test="${fn:substring(reser.rFTime,0,2)>12}">
	            <td>(오후예약) ${reser.rFTime}-${reser.rLTime}</td>
            </c:if>
            <td>${reser.pTypeName}</td>
            <td>${reser.rContent}</td>
           	<td>
           		<c:choose>
					<c:when test="${reser.rState eq '1'}">예약대기</c:when>
					<c:when test="${reser.rState eq '2'}"><font color="blue"><b>예약완료</b></font></c:when>
					<c:when test="${reser.rState eq '3'}"><font color="red"><b>예약취소</b></font></c:when>
					<c:when test="${reser.rState eq '4'}"><font color="purple"><b>진료완료</b></font></c:when>
					<c:otherwise>???</c:otherwise>
				</c:choose>
           	</td>
        </tr>
	 </table>
	 <hr size="0.5" color="#D5D5D5" style="margin-bottom: 50px;">
         
     <button onclick="location.href='ad_reser.do'" class="btSty" style="margin-bottom: 20px;">전체목록보기</button>
         
   </center>
   </c:if>