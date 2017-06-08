<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- reser_confirm ��Ÿ�� -->
<link href='admin/_css/common.css' rel='stylesheet' />
<link href='admin/_css/reservation.css' rel='stylesheet' />
<link href='admin/_css/reservation_error.css' rel='stylesheet' />
<!-- datepicker���� -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//code.jquery.com/jquery-2.2.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- datepicker���� Script -->
<script src="admin/_js/reservation_Datepicker.js" rel="script" type="text/javascript"></script>
<script>
	function openIdCheck(){//ID ���翩�� Ȯ��
		var mID=document.getElementById("mID").value;
		window.open("/JavaChefWeb/admin/member/ad_idcheck.jsp?mID="+mID,"idCheck","left=400,top=200,width=300,height=100,resizable=yes");
	}
</script>

<%-- reser_confirm.jsp(�����û������) --%>
<div class="reser_content">
	<h3 class="con_title">
		<img alt="������" src="admin/_images/ad_reser_confirm.PNG">
	</h3>
	<form action="reserIAction.do?st=1" method="POST">
	
	 <!-- ###############################ȸ�� ���ð���################################# -->
		<p>
			<b>1. ȸ������</b>
		</p>
		<hr size="2" color="#747474">
		<p style="padding-left: 40px;">
			ȸ��ID <input type="text" name="mID" id="mID">
			<!-- <input name="mID_verified" id="mID_verified" type="hidden"/> -->
			 <input type="button" value="ȸ��Ȯ��" class="btSty" onclick="openIdCheck()">
		</p>
		<hr size="0.5" color="#D5D5D5" style="margin-bottom: 50px;">
	 <!-- ###############################ȸ�� ���ð���################################# -->

	 <!-- ###############################������� ���ð���################################# -->
		<p>
			<b>2. ������� ����</b>
		<hr size="2" color="#747474">
		<p style="padding-left: 40px;">
			������� <select name="rCate" id="rCate">
				<option>=== ������� ���� ===</option>
				<option value="1">������</option>
				<option value="2">�ڼ���</option>
				<option value="3">�ȸ���������</option>
				<option value="4">��������</option>
				<option value="5">ü������</option>
			</select>
		</p>
		<hr size="0.5" color="#D5D5D5" style="margin-bottom: 50px;">
	 <!-- ###############################������� ���ð���################################# -->

	 <!-- ###############################������ �� �ð� ���ð���################################# -->
		<p>
			<b>3. ������ �� �ð� ����</b>
		</p>
		<hr size="2" color="#747474">
		
		<div id="timepicker" style="display: none;">
			<!-- ��¥ ���ýø� ���̱� -->
			<input type="hidden" id="rDate" name="rDate">
			<p style="margin-left: 29px;">
				����ð� <select name="rTime" id="rTime">
					<!-- disabled="disabled" -->
					<!-- DB�� ����� �ð� �ִ��� Ȯ���� ��� 
										 javascript�� DB�� ����� ���°� Ajax-->
					<option>=== ����ð� ���� ===</option>
					<option value="09:30-10:00" class="09">(��������) 09:30-10:00</option>
					<option value="10:30-11:00" class="10">(��������) 10:30-11:00</option>
					<option value="11:30-12:00" class="11">(��������) 11:30-12:00</option>
					<option value="13:30-14:00" class="13">(���Ŀ���) 13:30-14:00</option>
					<option value="14:30-15:00" class="14">(���Ŀ���) 14:30-15:00</option>
					<option value="15:30-16:00" class="15">(���Ŀ���) 15:30-16:00</option>
					<option value="16:30-17:00" class="16">(���Ŀ���) 16:30-17:00</option>
					<option value="17:30-18:00" class="17">(���Ŀ���) 17:30-18:00</option>
				</select>
			</p>
		</div>
		
		<div id="datepicker">
		</div>
	 <!-- ###############################������ �� �ð� ���ð���################################# -->
		
		<p id="btn">
			<input type="submit" value="�����ϱ�" class="btSty"/>
			<input type="reset" value="����ϱ�" class="btSty"/>
		</p>
	</form>
</div>
