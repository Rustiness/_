<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%-- ad_menu_left.jsp --%>
<center>
	<div id="left_menu">
		<div class="sub_menu font_style">

			<h2><html:link action="/admin">ADMIN HOME</html:link></h2>
			<hr>
			<h3>관리항목</h3>
			<ul class="left_ul">
				<li><html:link action="/ad_mem">회원목록</html:link></li>
				<li><html:link action="/ad_coun">상담목록</html:link></li>
				<li><html:link action="/ad_reser">예약목록</html:link></li>
				<li><html:link action="/ad_reser">예약등록</html:link></li>
				<li><html:link action="/ad_esti">견적목록</html:link></li>
			</ul>
			<hr>
			<h3>사원정보</h3>
			<ul class="left_ul">
				<li><html:link action="/ad_emp">사원목록</html:link></li>
				<li><html:link action="/ad_emp.do?action=insForm">사원등록</html:link></li>
			</ul>
			<h3>Define 설정</h3>
			<ul class="left_ul">
				<li><html:link action="/ad_plasTy">성형타입:기준</html:link></li>
				<li><html:link action="/ad_plasIt">성형시술:기준</html:link></li>
				<li><html:link action="/ad_grade">관리등급:기준</html:link></li>
			</ul>
		</div>
	</div>
</center>
