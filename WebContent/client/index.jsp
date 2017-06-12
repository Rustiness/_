<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>JAVACHEF성형외과</title>
	<link href='client/_css/common.css' rel='stylesheet'/>
	<script src="admin/_js/index.js" rel="script" type="text/javascript"></script>
</head>
<%-- client/index.jsp --%>
<body>
<center>
	<table id="cl_view_table">
		<tr>
			<td id="cl_view_header" colspan="2"><tiles:insert attribute="menu_header"/></td>
		</tr>
		<tr>
			<td id="cl_view_left"><tiles:insert attribute="menu_left"/></td>
			<td id="cl_view_main"><tiles:insert attribute="main_body"/></td>
		</tr>
		<tr>
			<td id="cl_view_footer" colspan="2"><tiles:insert attribute="menu_footer"/></td>
		</tr>
	</table>
</center>
</body>
</html>