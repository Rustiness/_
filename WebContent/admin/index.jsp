<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>JAVACHEF성형외과 :: ADMIN</title>
	<link href="admin/_css/common.css" rel="stylesheet" type="text/css"/>
	<script src="admin/_js/jquery-3.2.1.min.js" rel="script" type="text/javascript"></script>
	<script src="admin/_js/ajax2.js" rel="script" type="text/javascript"></script>
	<script src="admin/_js/index.js" rel="script" type="text/javascript"></script>
</head>
<%-- admin/index.jsp --%>
<body>
<center>
	<table id="ad_view_table">
		<tr>
			<td id="ad_view_left"><tiles:insert attribute="a_menu_left"/></td>
			<td id="ad_view_main"><tiles:insert attribute="a_main_body"/></td>
		</tr>
	</table>
</center>
</body>
</html>