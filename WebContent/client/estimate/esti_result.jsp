<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	request.setCharacterEncoding("UTF-8");
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
		<tr><!-- TODO  --> 
			<td colspan='4' height='40'>
				<table border=0 cellpadding='2' cellspacing='0' width="70%"
					style='color: #0164b4'>
					<%	double totalPrice=0;
					String price;
						String[] chkList = request.getParameterValues("chkList");
						if (chkList != null) {//한개 이상의 성형시술을 선택했을 때
							for (int i = 0; i < chkList.length; i++) {
							/*This page is from esti_confirm.jsp 
							when customers click on options(ComboBox),
							the array of chklist get the values. 
							Then, split 3 different values(pTypeNO, pItemName, pItemValue)
							eg)NO, 코높이기, 500
							*/
							String surgeryTypes=chkList[i].split("\\|")[0];
							String surgeryNames=chkList[i].split("\\|")[1];
							price=chkList[i].split("\\|")[2];
							double price_d= Double.parseDouble(price);
							totalPrice+=price_d;
							
					%>
					<tr>
						<td width='50' align='left'style="color: #666666; padding: 6px 10px 5px"><%=surgeryTypes %></td>
						<td width='50' align='left' style="color: #666666; padding: 6px 10px 5px"><%=surgeryNames %></td>
						<td width='50' align='right'
							style="color: #666666; padding: 6px 10px 5px"><%=price %></td>
					</tr>
					<tr>
						<td height='1' bgcolor='#dadada' colspan='4'></td>
					</tr>
					<%
						}
							
						}
						
					%>
					<tr>
						<td style="color: #0164b4; padding: 6px 10px 5px">합계(단위:만원)</td>
						<td style="color: #0164b4; padding: 6px 10px 5px"></td>
						<td width='50' align='right'
							style="color: #0164b4; padding: 6px 10px 5px"><b><%=totalPrice --%></b></td>
					</tr>
				</table> <br>
			</td>
		</tr>
		<tr>
			<td bgcolor='#D5C4E1' colspan='4' height='2'></td>
		</tr>
	</table>
	<br> <input type="submit" value="전송" /> <input type="reset"
			value="취소" />
</body>
</html>