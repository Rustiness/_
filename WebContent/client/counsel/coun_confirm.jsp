<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- coun_confirm.jsp --%>

<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<h3>온라인 상담등록</h3>
<hr>
<form action="/JavaChefWeb/coun.do" method="POST" name="form">
	<input type="hidden" name="action" value="insert"/>
<table border="1" cellpadding="5">
  <tr>
   <td>상담분야</td>
   <td>
    <select name="pTypeNO">
     <option>==선택==</option>
     <option value="EY">눈성형</option> <!-- EY -->
     <option value="NO">코성형</option>
     <option value="FA">얼굴성형</option>
     <option value="BO">체형성형</option>
     <option value="BR">가슴성형</option>
    </select>
   </td>
  </tr>
                        
  <tr>
   <td>작성자</td>
   <td><input type="text" size="10" name="mNO"></td>
  </tr>
  
   <tr>
   <td>글제목</td>
   <td><input type="text" size="50" name="cTitle" maxlength="16"><br>
   (글 제목은 16자내로 입력하십시오.)</td>
  </tr>
  
  <tr>
 <td>공개여부</td>
  <td><select name="state">
       <option value="1" <c:if test="${bean.state eq '1'}">selected</c:if>>공개</option>
       <option value="2" <c:if test="${bean.state eq '2'}">selected</c:if>>비공개</option>
       <option value="3" <c:if test="${bean.state eq '3'}">selected</c:if>>유저 비공개</option>
     </select>
   </td>
  </tr>

  
  
  
  <tr>
  <td>내용</td>
     <td colspan="2"><textarea rows="5" cols="50" name="cContent" maxlength="160"></textarea><br>
     (내용은 160자내로 입력하십시오.)</td>
  </tr>

</table>

<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="등록" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" value="초기화">
<a href="coun.do"><input type="button" value="나가기"/></a>
</form>
</body>
</html>