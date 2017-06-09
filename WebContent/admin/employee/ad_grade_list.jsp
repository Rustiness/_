<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- ad_emp_list.jsp --%>
<c:if test="${admin==null}">
	<script>
		alert("관리자 로그인 후 이용가능합니다.");
		location.href='admin.do';
	</script>
</c:if>
<c:if test="${admin!=null}">
직원관리 목록 시작
</c:if>