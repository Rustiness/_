<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link href='admin/_css/common.css' rel='stylesheet' />
<%-- ad_reser_info.jsp(예약 상세페이지) --%>
   <center>
   	<h3 class="con_title">
		예약상세
		<!-- <img alt="예약신청" src="client/_images/title_reser.gif"> -->
	</h3>
         <table border="1" cellpadding="10" style="margin: 30px 20px 0 20px;">
           
            <tr bgcolor="#fcffb0">
            <th>예약번호</th>
            <th>예약자<br>(ID)</th>
            <th>전화번호</th>
            <th>Email</th>
            <th>예약날짜</th>
            <th>예약시간</th>
            <th>진료과목</th>
            <th>memo</th>
            <th>예약상태</th>
            </tr>
            
            <tr align=center >
            <td><html:link action="ad_reser_modify.do?reser=arInfo&rNO=re${reser.rNO}">${reser.rNO}</html:link></td>
            <td>${reser.name}(${reser.mID})</td>
            <td>${reser.tel}</td>
            <td>${reser.email}</td>
            <td>${reser.rDate}</td>
            <c:if test="${fn:substring(reser.rFTime,0,2)<12}">
	            <td>(오전예약) ${reser.rFTime}-${reser.rLTime}</td>
            </c:if>
            <c:if test="${fn:substring(reser.rFTime,0,2)>12}">
	            <td>(오후예약) ${reser.rFTime}-${reser.rLTime}</td>
            </c:if>
            <td>${reser.pTypeName}</td>
            <td>${reser.rContent}</td>
            <td>${reser.rState}</td>
            </tr>
         </table>
         
         <br><br>
         <button onclick="location.href='ad_reser.do'">전체목록보기</button>
         
   </center>