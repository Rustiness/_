<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<link href='client/_css/menu.css' rel='stylesheet'/>
<%-- menu_left.jsp --%>

<div id="left_menu">
	<div class="sub_menu font_style">
		<h3><html:link action="/intro">
			<img class="left_menu_img" alt="병원안내" src="client/_images/menu/menu01_tle.gif">
		</html:link></h3></p>
		<h3><html:link action="/plaSur">
			<img class="left_menu_img" alt="성형정보" src="client/_images/menu/menu02_tle.gif">
		</html:link></h3></p>

		<h3><html:link action="/esti">성형견적</html:link></h3>
		<ul class="left_ul">
			<li><html:link action="/esti">견적등록</html:link></li>
			<li><html:link action="/esti">견적보기</html:link></li>
		</ul>
		<h3><html:link action="/reser">
			<img class="left_menu_img" alt="진료예약" src="client/_images/menu/menu03_tle.gif">
		</html:link></h3>
		<ul class="left_ul">
			<li><html:link action="/reser">예약신청</html:link></li>
			<li><html:link action="/reser_info.do?reser=mInfo">예약목록</html:link></li>
		</ul>
		<h3><html:link action="/coun">
			<img class="left_menu_img" alt="온라인상담" src="client/_images/menu/menu04_tle.gif">
		</html:link></h3></p>
	</div>
</div>