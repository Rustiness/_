<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- reser_confirm 스타일 -->
<link href='client/_css/reservation.css' rel='stylesheet' />
<link href='client/_css/common.css' rel='stylesheet' />
<!-- datepicker관련 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//code.jquery.com/jquery-2.2.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Calendar불러오는 Script -->
<script src="client/_js/reserCalendar.js"></script>

<script type="text/javascript"> 
	//원래 예약정보를 선택 해 놓기위한 jQuery
	$(function(){
		$('.'+'${reser.pTypeName}').attr('selected','selected');
		$('.'+'${fn:substring(reser.rFTime, 0,2)}').attr('selected','selected');
		$('#datepicker').datepicker('setDate', '${reser.rDate}');
	});
</script>

<%-- reser_modify.jsp(예약(rNO)당 수정 페이지) --%>
<div class="reser_content">
	<h3>예약수정</h3>
	<form action="reserUAction.do?st=2" method="POST">
		<table border="1" cellpadding="10">
	    	<tr bgcolor="#FFB4B4" align=center>
	        	<th>예약번호</th>
	        	<th>예약자<br>(ID)</th>
	            <th>전화번호</th>
	            <th>Email</th>
	            <!-- <th>예약날짜</th>
	            <th>예약시간</th>
	            <th>진료과목</th>
	            <th>memo</th>
	            <th>예약상태</th> -->
	        </tr>
	        <tr align="center">
	            <td>${reser.rNO}</td>
	            <td>${reser.name}(${reser.mID})</td>
	            <td>${reser.tel}</td>
	            <td>${reser.email}</td>
	         </tr>
	    </table><br>
	    <input type="hidden" name="rNO" value="${reser.rNO}">
	    <input type="hidden" name="rState" value="${reser.rState}">
		<p>
			<b>1. 진료과목 선택</b>
		</p>
		<hr size="2" color="#747474">
		<p style="padding-left: 40px;">
			진료과목 <select name="rCate" id="rCate">
				<option>=== 진료과목 선택 ===</option>
				<option value="1" class="눈성형">눈성형</option>
				<option value="2" class="코성형">코성형</option>
				<option value="3" class="안면윤곽성형">안면윤곽성형</option>
				<option value="4" class="가슴성형">가슴성형</option>
				<option value="5" class="체형성형">체형성형</option>
			</select>
		</p>
		<hr size="0.5" color="#D5D5D5" style="margin-bottom: 50px;">

		<p>
			<b>2. 예약일 및 시간 선택</b>
		</p>
		<hr size="2" color="#747474">
		
		<div id="timepicker">
			<!-- 날짜 선택시만 보이기 -->
			<input type="hidden" id="rDate" name="rDate">
			<p style="margin-left: 20px;">
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
		
		<p>
			<b>3. 메모</b>
			<hr size="2" color="#747474">
			<textarea name="rContent" rows="10" cols="35" style="margin-left: 20px; margin-top: 15px;">${reser.rContent}</textarea>
		</p>
		
		<p id="btn">
			<input type="submit" value="수정하기" class="btSty"/>
			<input type="reset" value="취소하기" class="btSty"/>
		</p>
	</form>
</div>