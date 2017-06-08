<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- ad_plasTy_list.jsp --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>진료과목입력</title>
</head>
<%--ad_plasTy_add.jsp --%>
<body>
	<center>
		<form action="/JavaChefWeb/ad_plasTInsert.do" method="POST">
			<%-- <table cellpadding="1" cellspacing="0" width="100%">
				<tr>
					<th class="top">진료타입입력</th>
					<td class="top"><input type="text" name="user_id" value=""
						class="input_text" style="width: 120px;" maxlength="20" />
						<p class="gray_font_11">영문, 숫자 조합으로 4자 이상 20자 이내</p></td>
				</tr>
			</table>--%>

			진료타입:<input type="text" name="pTypeNO" /><br /> 진료시술명: <input
				type="text" name="pTypeName" /><br /> Active/Inactive: <input
				type="text" name="state" /><br /> <input type="submit" value="입력">
			<input type="reset" value="취소">

		</form>
	</center>
</body>
</html>