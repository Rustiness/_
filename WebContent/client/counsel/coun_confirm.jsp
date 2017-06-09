<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- coun_confirm.jsp --%>

<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<c:if test="${user==null}">
	<script>
		alert("로그인 후 이용가능합니다.");
		location.href='login.do';
	</script>
</c:if>
<c:if test="${user!=null}">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
 function validcheck(){
	var f = document.form;
	
	 if(f.pTypeNO.value=='==선택=='){
		alert('상담분야를 선택하세요~!');
		f.pTypeNO.focus();
		return false;
	}else if(f.mNO.value==''){
		alert('작성자를 입력하세요~!');
		f.mNO.focus();
		return false;
	}else if(f.cTitle.value==''){
		alert('글 제목을 입력하세요~!');
	}else if(f.state.value=='==선택=='){
		alert('공개여부를 선택하세요~!');
	}else if(f.cContent.value==''){
		alert('내용을 입력하세요~!');
		f.cContent.focus(); 
	}
	f.submit();
	
} 

</script>
<h3>온라인 상담등록</h3>
<hr>
<form action="coun.do?page=1"  method="POST" name="form">
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
  	   <option>==선택==</option>
       <option value="1" >공개</option>
       <option value="2" >비공개</option>
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
<input type="button" value="등록" onclick="validcheck()">
<input type="reset" value="초기화">
<a href="coun.do"><input type="button" value="나가기"/></a>
</form>
</c:if>
