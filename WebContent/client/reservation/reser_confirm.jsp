<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='client/_css/common.css' rel='stylesheet' />
<link href='client/_css/reservation.css' rel='stylesheet' />
<link href='client/_css/reservation_error.css' rel='stylesheet' />
<!-- datepicker관련 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//code.jquery.com/jquery-2.2.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="client/_js/reservation_Datepicker.js" rel="script" type="text/javascript"></script>

<%-- reser_confirm.jsp(예약신청페이지) --%>
<%-- <%if (session.getAttribute("user")==null) {
	
}%> --%>
<c:if test="${user==null}">
	<script>
		alert("로그인 후 이용가능합니다.");
		location.href='login.do';
	</script>
</c:if>
<c:if test="${user!=null}">
<div class="reser_content">
	<h3 class="con_title">
		<img alt="예약신청" src="client/_images/reser_confirm.PNG">
	</h3>
	<form action="reserIAction.do?st=2" method="POST">
	
	 <!-- ###############################진료과목 선택공간################################# -->
		<p>
			<b>1. 진료과목 선택</b>
			<html:messages id="rCate" property="rCate">
				<span id="error"> <bean:write name="rCate" />
				</span>
				<br>
			</html:messages>
		</p>
		<hr size="2" color="#747474">
		<p style="padding-left: 40px;">
			진료과목 <select name="rCate" id="rCate">
				<option>=== 진료과목 선택 ===</option>
				<option value="1">눈성형</option>
				<option value="2">코성형</option>
				<option value="3">안면윤곽성형</option>
				<option value="4">가슴성형</option>
				<option value="5">체형성형</option>
			</select>
		</p>
		<hr size="0.5" color="#D5D5D5" style="margin-bottom: 50px;">
	 <!-- ###############################진료과목 선택공간################################# -->

	 <!-- ###############################예약일 및 시간 선택공간################################# -->
		<p>
			<b>2. 예약일 및 시간 선택</b>
			<html:messages id="rDateTime" property="rDateTime">
				<span id="error"> <bean:write name="rDateTime" />
				</span>
				<br>
			</html:messages>
		</p>
		<hr size="2" color="#747474">
		
		<div id="timepicker" style="display: none;">
			<!-- 날짜 선택시만 보이기 -->
			<input type="hidden" id="rDate" name="rDate">
			<p style="margin-left: 29px;">
				예약시간 <select name="rTime" id="rTime">
					<!-- disabled="disabled" -->
					<!-- DB에 예약된 시간 있는지 확인후 출력 
										 javascript랑 DB랑 연결시 쓰는거 Ajax-->
					<option>=== 예약시간 선택 ===</option>
					<option value="09:30-10:00" class="09">(오전예약) 09:30-10:00</option>
					<option value="10:30-11:00" class="10">(오전예약) 10:30-11:00</option>
					<option value="11:30-12:00" class="11">(오전예약) 11:30-12:00</option>
					<option value="13:30-14:00" class="13">(오후예약) 13:30-14:00</option>
					<option value="14:30-15:00" class="14">(오후예약) 14:30-15:00</option>
					<option value="15:30-16:00" class="15">(오후예약) 15:30-16:00</option>
					<option value="16:30-17:00" class="16">(오후예약) 16:30-17:00</option>
					<option value="17:30-18:00" class="17">(오후예약) 17:30-18:00</option>
				</select>
			</p>
		</div>
		
		<div id="datepicker">
		</div>
	 <!-- ###############################예약일 및 시간 선택공간################################# -->
		
		<p id="btn">
			<input type="submit" value="예약하기" class="btSty"/>
			<input type="reset" value="취소하기" class="btSty"/>
		</p>
	</form>
</div>
</c:if>
