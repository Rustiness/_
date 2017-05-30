<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%-- menu_left.jsp --%>

<div id="left_menu">
	<div class="sub_menu font_style">
		<h3><html:link action="/intro">병원소개</html:link></h3></p>
		<h3><html:link action="/plaSur">성형정보</html:link></h3></p>

		<h3><html:link action="/esti">성형견적</html:link></h3>
		<ul class="left_ul">
			<li><html:link action="/esti">견적등록</html:link></li>
			<li><html:link action="/esti">견적보기</html:link></li>
		</ul>

		<h3><html:link action="/reser">진료예약</html:link></h3>
		<ul class="left_ul">
			<li><html:link action="/reser">예약신청</html:link></li>
			<li><html:link action="/reser_info.do?reser=mInfo">예약목록</html:link></li>
		</ul>

		<h3><html:link action="/coun">온라인상담</html:link></h3></p>
	</div>
</div>