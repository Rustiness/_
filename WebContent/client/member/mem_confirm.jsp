<%@page import="kr.hospi.beans.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/JavaChefWeb/client/_css/join_modify.css" />
<title>회원정보</title>
<%-- 
	mem_info.jsp
	[회원정보]
--%>
</head>

<%-- 회원정보창에선   이창을 모티브로 한 회원정보수정 입력부: 이 위는 회원정보수정 스타일 --%>
<body onload="maskingPass()">
<% request.setCharacterEncoding("UTF-8");%>

<%-- 함수를 정의하는 스크립트 --%>
<script type="text/javascript">
	function maskingPass() {//비밀번호 뒤 3자리를 가리는 함수
		var pass=document.getElementById("pass").value;
		var pattern = /.{3}$/; // 정규식
		document.getElementById("pass").value=pass.replace(pattern, "***");//비밀번호 뒤의 3자리는 ***로 가림.
	}

	function openPassCheck(){//비밀번호 확인 창(passcheck.jsp)을 새로 띄움
		window.open("/JavaChefWeb/client/member/passcheck.jsp","passCheck","left=900,top=100,width=400,height=200,resizable=yes");
	}

	function back(){//로그인 페이지로 이동
		location.href="/JavaChefWeb/login_res.do";
	}
</script>

<%-- 회원정보 입력폼(join)--%>
  <form name=info method="POST">
   <div class="contents">
      <div class="con_title">
         <h3> 회원정보수정 </h3>
         <p class="mt35 taR">
            Home &gt; <strong>회원정보</strong>
         </p>
      </div>
      <div class="con_h">
         <h4>회원정보 입력</h4>
      </div>
      
      <table cellpadding="0" cellspacing="0" width="100%" border="1">
        <!-- 아이디 -->
        <tr>
           <td>
                              아이디
           </td>
           <td class="line">
           	 <%-- 아이디(mID) 입력 필드, 읽기만 가능하며 수정은 불가. --%>
             <input name="mID" id="mID" type="text" value="${user.mID }" readonly/>
           </td>
        </tr>
       
        <!-- 비밀번호 -->
        <tr>
           <td>
                              비밀번호  <span class="c_red">*</span>
           </td>
           <td class="line">
           	   <%-- 비밀번호(pass) 입력 필드 --%>
               <input name="pass" id="pass" type="text" class="input_text_half" maxlength="30" size="35" value="${user.pass }" readonly> 
               
           </td>
        </tr>
        <!-- 비밀번호 확인 -->
        
      
        <!-- 비밀번호찾기질문 -->
        <tr>
           <td>
                               비밀번호찾기질문  <span class="c_red">*</span>
           </td>
              <td class="line"><!--비밀번호 찾기  질문항목들  -->
              	 <input type="text" name="qNO" value="${user.qNO }" size="40" readonly>
              	 
              	       
              </td>
        </tr>
       
        <!-- 비밀번호찾기답변 -->
        <tr>
           <td>
                               비밀번호찾기답변  <span class="c_red">*</span>
           </td>
              <td class="line">
              	 <%--비밀번호찾기답변 입력 --%>
                 <input type="text" name="answer" value="${user.answer}" class="input_text_half" maxlength="10" readonly>
              </td>
        </tr>
      
        <!-- 이름 -->
        <tr>
           <td>
                               이름  <span class="c_red">*</span>
           </td>
              <td class="line">
              	 <%--이름(name) 입력 필드 --%>
                 <input type="text" name="name" value="${user.name }" class="input_text_half" maxlength="20" readonly>
              </td>
        </tr>
 
         <!-- 생일 -->
         <tr>
           <td>
                 생년월일  <span class="c_red">*</span>
           </td>
           <td class="line">
           	   <%-- 생일(birth) 입력 필드. birth1,2,3은 JoinAction.java(회원가입 액션)에서 합쳐져 birth가 된다. --%>
           	
               
              <input type="text" name="birth" value="${user.birth }" class="input_text_half"  size="4" readonly>
           </td>
         </tr>
       
         <!-- 성별 -->
         <tr>
           <td>성별</td>
           <td class="line">
           	   <%-- 성별(sex)을 체크하는 라디오 버튼 --%>
               <input type="text" name="sex" value="${user.sex }" class="input_text_half"  size="4" readonly>
           </td>
         </tr>
        
         <!-- 핸드폰 -->
         <tr>
           <td>휴대폰</td>
           <%-- 휴대폰 번호(tel)를 입력하는 부분.
           		tel1은 옵션, tel2, tel3는 필드에 입력.
           		JoinAction.java(회원가입 액션)에서 합쳐져 tel이 된다.
           --%>
           <td class="line">
           	  
               <input type="text" name="tel" value="${user.tel }" class="input_text_half"  size="10" readonly>
             
             <%-- SMS 수신동의 여부 체크박스(작업 중) --%> 
             
           </td>
         </tr>
        
          <!-- 이메일 -->
          <tr>
            <td>
                                 이메일  <span class="c_red">*</span>
            </td>
            <%-- 
            	이메일(email) 입력 필드.
            	email1, select_email, email2가 존재하며, email1 + email2, email1 + select_email로 조합.
            	JoinAction.java(회원가입 액션)에서 합쳐져 email이 된다.
            --%>
            <td class="line">
            
               <input type="text" name="email" value="${user.email }" class="input_text_half"  size="20" readonly>
               
               <%-- 이메일 중복체크와 수신동의(작업 중) --%>
               <a href="#" id="chk_email_exist">
               
               </a>
              
            </td>
         </tr>
       
         <!-- 관심사 -->
         <tr>
            <td>관심사</td>
            <td class="line">
            	<%-- 관심사(pTypeNO)를 선택하는 체크박스 --%>
               <input type="text" name="pTypeNO" value="${user.pTypeNO }" class="input_text_half"  size="4" readonly>
            </td>
         </tr>
       </table>

      <div class="taC mt40">
      	  <%-- 회원정보수정 버튼. 유효한 정보가 입력되면 JoinAction.java으로 정보를 전송하여 회원정보를 수정함.--%>
          <input type="button" id="btn_user_join" style="cursor: pointer;" value="수정" onclick="openPassCheck()"/>
          <%-- 취소버튼. 정보를 리셋하고 로그인(login_confirm.jsp) 페이지로 돌아감 --%>
          <input type="reset" id="btn_reload" style="cursor: pointer;" value="취소" onclick="back()"/>
       </div>
   </div>
  </form>
</body>
</html>