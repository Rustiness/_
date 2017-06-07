<%@page import="kr.hospi.dao.EstimateDAO"%>
<%@page import="kr.hospi.beans.Estimate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	request.setCharacterEncoding("UTF-8");
	Estimate estimate = (Estimate) session.getAttribute("estimate");
%>
<title>나의 성형 견적서</title>

</head>
<body>
	<h3>나의 성형 견적서</h3>
	<hr>
	<table cellspacing='0' cellpadding='2' width="70%" border="0">
		<tr>
			<td bgcolor='#D5C4E1' colspan='4' height='2'></td>
		</tr>
		<tr>
		<tr><!-- TODO  --> 
			<td colspan='4' height='40'>
				<table border=0 cellpadding='2' cellspacing='0' width="70%"
					style='color: #0164b4'>
					<%
						double totalPrice = 0;
						String price;
						//These variables in this estimate are from the page of esti_confirm.jsp.
						//1.EyeSurgery, 2.NoseSurgery, 3.FaceSurgery, 4.BodySurgery, 5.BreastSurgery

						if (estimate.getpEyeItem() != null) {

							String chkEye[] = estimate.getpEyeItem().split("\\,");
							for (int i = 0; i < chkEye.length; i++) {
								//eg)NO, 코높이기, 500
								String surgeryTypes = chkEye[i].split("\\|")[0];
								String surgeryNames = chkEye[i].split("\\|")[1];
								price = chkEye[i].split("\\|")[2];

								//String[] chkFace = request.getParameterValues("chkFace");
								String[] chkBody = request.getParameterValues("chkBody");
								String[] chkBreast = request.getParameterValues("chkBreast");
					%>
					<tr>
						<td id="line_l"><%=surgeryTypes%></td>
						<td id="line_l"><%=surgeryNames%></td>
						<td id="line_r"><%=price%></td>
					</tr>
					<tr>
						<td height='1' bgcolor='#dadada' colspan='4'></td>
					</tr>
					<%
						double price_eye = Double.parseDouble(price);
								totalPrice += price_eye;
							} //for
						} //if
						if (estimate.getpNoseItem() != null) {
							String[] chkNose = estimate.getpNoseItem().split("\\,");
							for (int i = 0; i < chkNose.length; i++) {
								//eg)NO, 코높이기, 500
								String surgeryTypes = chkNose[i].split("\\|")[0];
								String surgeryNames = chkNose[i].split("\\|")[1];
								price = chkNose[i].split("\\|")[2];
					%>
					<tr>
						<td id="line_l"><%=surgeryTypes%></td>
						<td id="line_l"><%=surgeryNames%></td>
						<td id="line_r"><%=price%></td>
					</tr>
					<tr>
						<td height='1' bgcolor='#dadada' colspan='4'></td>
					</tr>
					<%
						double price_nose = Double.parseDouble(price);
								totalPrice += price_nose;
							} //for
						} //if
						if (estimate.getpFaceItem() != null) {//한개 이상의 성형시술을 선택했을 때
							String[] chkFace = estimate.getpFaceItem().split("\\,");

							for (int i = 0; i < chkFace.length; i++) {
								//eg)NO, 코높이기, 500
								String surgeryTypes = chkFace[i].split("\\|")[0];
								String surgeryNames = chkFace[i].split("\\|")[1];
								price = chkFace[i].split("\\|")[2];
					%>
					<tr>
						<td id="line_l"><%=surgeryTypes%></td>
						<td id="line_l"><%=surgeryNames%></td>
						<td id="line_r""><%=price%></td>
					</tr>
					<tr>
						<td height='1' bgcolor='#dadada' colspan='4'></td>
					</tr>
					<%
						double price_face = Double.parseDouble(price);
								totalPrice += price_face;
							} //for
						} //if
						if (estimate.getpBodyItem() != null) {
							String[] chkBody = estimate.getpBodyItem().split("\\,");
							//한개 이상의 성형시술을 선택했을 때
							for (int i = 0; i < chkBody.length; i++) {
								//eg)NO, 코높이기, 500
								String surgeryTypes = chkBody[i].split("\\|")[0];
								String surgeryNames = chkBody[i].split("\\|")[1];
								price = chkBody[i].split("\\|")[2];
					%>
					<tr>
						<td id="line_l"><%=surgeryTypes%></td>
						<td id="line_l"><%=surgeryNames%></td>
						<td id="line_r"><%=price%></td>
					</tr>
					<tr>
						<td height='1' bgcolor='#dadada' colspan='4'></td>
					</tr>
					<%
						double price_body = Double.parseDouble(price);
								totalPrice += price_body;
							} //for
						} //if
						if (estimate.getpBreastItem() != null) {//한개 이상의 성형시술을 선택했을 때
							String[] chkBreast = estimate.getpBreastItem().split("\\,");
							for (int i = 0; i < chkBreast.length; i++) {
								//eg)NO, 코높이기, 500
								String surgeryTypes = chkBreast[i].split("\\|")[0];
								String surgeryNames = chkBreast[i].split("\\|")[1];
								price = chkBreast[i].split("\\|")[2];
					%>
					<tr>
						<td id="line_l"><%=surgeryTypes%></td>
						<td id="line_l"><%=surgeryNames%></td>
						<td id="line_r"><%=price%></td>
					</tr>
					<tr>
						<td height='1' bgcolor='#dadada' colspan='4'></td>
					</tr>
					<%
						double price_breast = Double.parseDouble(price);
								totalPrice += price_breast;
							}

						}
					%>
					<tr>
						<td style="color: #0164b4; padding: 6px 10px 5px">합계(단위:만원)</td>
						<td style="color: #0164b4; padding: 6px 10px 5px"></td>
						<td width='50' align='right'
							style="color: #0164b4; padding: 6px 10px 5px"><b><%=totalPrice%></b></td>
					</tr>
				</table> <br>
			</td>
		</tr>
		<tr>
			<td bgcolor='#D5C4E1' colspan='4' height='2'></td>
		</tr>
	</table>
	<br>
	<input type="submit" id="doc">의사선생님께 견적을 보내시겠습니까?</input>


</body>
</html>