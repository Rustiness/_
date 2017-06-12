<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<link href='client/_css/menu/menu.css' rel='stylesheet'/>
<%-- menu_header.jsp --%>
<table cellpadding="0" cellspacing="0">
	<tr>
		<td rowspan="2">
			<%-- 로고 이미지 시작 --%>
			<html:link action="/client">
				<div id="logo">
					<img class="main_logo" src="client/_images/main/main_javachef.png"">
				</div>
			</html:link>
			<%-- 로고 이미지 종료 --%>
		</td>

		<td>
			<%-- 로그인, 가입, 회원정보, 로그아웃 구역 시작 --%>
			<div id="header_login">
				<%if (session.getAttribute("user") == null) {%>
				<html:link action="/login">LOGIN</html:link>
				/
				<html:link action="/join_term">JOIN</html:link>
				<%} else {%>
				<html:link action="/mem_info">USERINFO</html:link>
				/
				<html:link action="/logout">LOGOUT</html:link>
				<%} %>
			</div>
			<%-- 로그인, 가입, 회원정보, 로그아웃 구역 종료 --%>
		</td>
	</tr>
	<tr>
		<td>
			<!-- 메뉴 구역 시작-->
			<div id="header_navi">
				<b><html:link action="/intro">
					<img class="menu_img" src="client/_images/menu/navi_1.gif"">
				</html:link></b>
				&nbsp;&nbsp;
				<b><html:link action="/plaSur">
					<img class="menu_img" src="client/_images/menu/navi_2.gif">
				</html:link></b>
				&nbsp;&nbsp;
				<b><html:link action="/reser">
					<img class="menu_img" src="client/_images/menu/navi_3.gif">
				</html:link></b>
				&nbsp;&nbsp;
				<b><html:link action="/coun">
					<img class="menu_img" src="client/_images/menu/navi_4.gif">
				</html:link></b>
			</div>
			<!-- 메뉴 구역 종료-->
		</td><!-- navi -->
	</tr>
</table>