<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link href='client/_css/common.css' rel='stylesheet' />
<%-- reser_info.jsp(회원(ID)당 예약목록 확인하는 페이지) --%>
   <center>
   	<h3 class="con_title">
		예약목록
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
            
            <c:forEach items="${reser}" var="info">
            <tr align=center >
            <td><html:link action="reser_modify.do?reser=rInfo&rNO=${info.rNO}">${info.rNO}</html:link></td>
            <td>${info.name}(${info.mID})</td>
            <td>${info.tel}</td>
            <td>${info.email}</td>
            <td>${info.rDate}</td>
            <c:if test="${fn:substring(info.rFTime,0,2)<12}">
	            <td>(오전예약) ${info.rFTime}-${info.rLTime}</td>
            </c:if>
            <c:if test="${fn:substring(info.rFTime,0,2)>12}">
	            <td>(오후예약) ${info.rFTime}-${info.rLTime}</td>
            </c:if>
            <td>${info.pTypeName}</td>
            <td>${info.rContent}</td>
            <td>${info.rState}</td>
            </tr>
            </c:forEach>
         </table>
         
         <br><br>
         
      <c:forEach begin="1" end="5" var="i">
         [${i }]
      </c:forEach>
   </center>