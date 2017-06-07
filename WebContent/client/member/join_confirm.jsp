<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/JavaChefWeb/client/_css/join_modify.css" />
<title>회원가입</title>

<%-- 
	join_confirm.jsp
	[회원가입 - 정보입력]
 --%>
 
</head>

<%-- 회원정보 입력부 --%>
<body>
<% request.setCharacterEncoding("UTF-8"); %>

<%-- 함수를 정의하는 스크립트 --%>
<script type="text/javascript">

	function validCheck(){//유효성검사
       
       var f = document.join; //form을 f로 치환한다.
       
       var mID = f.mID.value;
       var mID_verified = f.mID_verified.value;
    
       var tel2Exp =/^[\d]{3,4}$/g;
       var tel3Exp =/^[\d]{4}$/g;
       var email1Exp = /^[a-zA-Z0-9]{6,15}$/;
       var email2Exp = /^[a-zA-Z]+\.[a-zA-Z]$/g;
	   var birth1Exp=/^[\d]{4}$/g;
	   var birth2Exp=/^[\d]{2}$/g;
	   var birth3Exp=/^[\d]{2}$/g;
	   var id=f.mID.value;
		/*
		 telExmp=번호칸에 숫자만들어갈수있게.
		 email1=숫자영어조합가능
		 email2=영어만가능
		 birth1=숫자만 4자리가능
		 birth2=숫자만 2자리가능
		 birth3=숫자만 2자리가능
		*/
	   if(f.mID.value==''){//아이디체크
		   alert('아이디를 입력!!');
		   
	   }else if(f.mID.value.length < 6 || f.mID.value.length > 12){//id길이체크
          	alert('아이디는 6~12자리!!');
          	f.mID.focus();
       }else if(mID!=mID_verified){
    	   alert('아이디 중복 체크를 하십시오!');
		}else if(f.pass.value == ''){//데이터내용 비교
       	alert('비번입력!!');
       	f.pass.focus();
       }else if(f.pass_check.value === ''){//자료형 비교후 내용 비교
       	alert('비번입력!!');
       	f.pass2.focus();
       }else if(f.qNO.value == "1"){
    	   alert('질문선택!!');   
       }else if(f.answer.value == ""){
       	alert('답변 입력!');
       }else if(f.pass.value!=f.pass_check.value){//비밀번호 ,비밀번호확인 체크
           alert('비번이 일치하지 않습니다!!');
           f.pass.value=''; f.pass2.value='';
           f.pass.focus();
       }else if(f.name.value==''){//이름값체크
       	alert('이름입력!!');
       	f.name.focus();
       
       }else if( !birth1Exp.test(f.birth1.value)){//생년체크
       	alert('생년에 4자리 수를 입력!!');
       	
       	f.birth1.focus();
       	
       }else if(!birth2Exp.test(f.birth2.value)){//월수 값체크
    		alert('월에 2자리 수를 입력!!');
           	
           	f.birth2.focus();
    	   
    	   
       }else if(!birth3Exp.test(f.birth3.value)){//일수 값 체크
    	   
    	   alert('일에 2자리 수를 입력!!');
          	
          	f.birth3.focus();
   	   
    	   
       }else if((!tel2Exp.test(f.tel2.value))||(!tel3Exp.test(f.tel3.value))){
    	   
    	   alert('핸드폰 번호 확인!!');
    	   
       
       
       
       }else if(!email1Exp.test(f.email1.value)){
    	   
       	alert('첫번째칸 형식 오류');
       	f.email1.focus();
    	   
       
       
       
       }else if (email1Exp.test(f.email1.value)){
    	   
    	     	if(f.email2.value=='' && f.select_email.value=='직접입력'){
    	    	 
             	alert('둘다 null값안됨');
    	    	 
    	       }else if(!(f.email2.value=='')&&!(f.select_email.value=='직접입력')){
             	alert('email2,select둘다 적으면 오류! ');
    	    	 
    	       }else if((f.email2.value=='')&&!(f.select_email.value=='직접입력')){
    	    	 f.submit();
    	       }else if(!f.email2.value==''&&f.select_email.value=='직접입력'){
       	    	//폼내에 유효한 데이터가 입력 되었다면
      	    	 f.submit();//<form>태그내의 action속성의 URL로 폼데이터 전송!!
      	       }
    	      	 
       }
      
	}//validCheck

	function openIdCheck(){//ID 중복확인 창(idcheck.jsp)을 새로 띄움
		var mID=document.getElementById("mID").value;
		var mIDExp=/^[a-zA-Z0-9]{3,16}$/;
		
		if(!mID){
        	alert("아이디를 입력하십시오!");
        	return false;
   		}else if(!mIDExp.test(mID)){ 
        	alert("영문과 숫자의 조합으로 3~16자리의 아이디를 만드십시오!");
        	return false;
   		}
	
		window.open("/JavaChefWeb/client/member/idcheck.jsp?mID="+mID,"idCheck","left=900,top=100,width=400,height=200,resizable=yes");
	}
	
	function back(){//로그인 페이지로 이동
		location.href="/JavaChefWeb/login.do";
	}
</script>

<%-- 회원정보 입력폼(join) 
	<입력되는 정보>
	mID(아이디), pass(비밀번호),
--%>
  <form name=join method="POST" action="/JavaChefWeb/join_process.do">
   <div class="contents">
      <div class="con_title">
         <h3> 회원가입 </h3>
         <p class="mt35 taR">
            Home &gt; 회원가입 &gt; <strong>회원정보 입력</strong>
         </p>
      </div>
      
      <div class="title_txt">
          	아래 해당 사항을 입력해 주세요. <span class="c_red">*</span>는 필수 입력 사항입니다.
      </div>
      <div class="con_h">
         <h4>회원정보 입력</h4>
      </div>
      
      <table cellpadding="0" cellspacing="0" width="100%">
        <!-- 아이디 -->
        <tr>
           <td>
                              아이디 <span class="c_red">*</span>
           </td>
           <td class="line">
           	 <%-- 아이디(mID) 입력 필드, 읽기만 가능. 중복확인을 해야만 입력된다.  --%>
             <input name="mID" id="mID" type="text"/>
             <input name="mID_verified" id="mID_verified" type="hidden"/>
             <%-- 중복확인(idcheck.jsp) 창을 새로 띄우는 버튼 --%>
             <input type="button" id="chk_id_exist2" value="중복확인" onclick="openIdCheck()"/>
           </td>
        </tr>
      
        <!-- 비밀번호 -->
        <tr>
           <td>
                              비밀번호  <span class="c_red">*</span>
           </td>
           <td class="line">
           	   <%-- 비밀번호(pass) 입력 필드 --%>
               <input name="pass" type="password" class="input_text_half" maxlength="20" /> 
               <span class="gray_font_11">비밀번호 항목은 4 ~ 20자 이내로 입력해 주세요</span>
           </td>
        </tr>
        <!-- 비밀번호 확인 -->
        <tr>
           <td>
                               비밀번호확인  <span class="c_red">*</span>
           </td>
           <td class="line">
           		<%-- 비밀번호 확인(pass_check) 필드 --%>
                <input name="pass_check" type="password" id="join_user_passwd_check" class="input_text_half" maxlength="20" />
           </td>
        </tr>
      
        <!-- 비밀번호찾기질문 -->
        <tr>
           <td>
                               비밀번호찾기질문  <span class="c_red">*</span>
           </td>
              <td class="line"><!--비밀번호 찾기  질문항목들  -->
              	 <select name="qNO">
              	 		<option value="1" selected>선택</option>
              	 		<option value="2">기억에 남는 추억의 장소는?</option>
              	 		<option value="3">자신의 인생 좌우명은?</option>
              	 		<option value="4">가장 기억에 남는 선생님 성함은?</option>
              	 		<option value="5">타인이 모르는 자신만의 신체비밀이 있다면?</option>
              	 		<option value="6">추억하고 싶은 날짜가 있다면?</option>
              	 		<option value="7">받았던 선물 중 기억에 남는 독특한 선물은?</option>
              	 		<option value="8">유년시절 가장 생각나는 친구 이름은?</option>
              	 		<option value="9">인상 깊게 읽은 책 이름은?</option>
              	 		<option value="10">자신이제일 존경하는 인물은?</option>
              	 		<option value="11">친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
              	 		<option value="12">초등학교때 기억에 남는 짝꿍 이름은?</option>
              	 		<option value="13">다시 태어나면 되고 싶은 것은?</option>
              	 		<option value="14">내가 좋아하는 캐릭터는?</option>
              	 </select>
              	       
              </td>
        </tr>
      
        <!-- 비밀번호찾기답변 -->
        <tr>
           <td>
                               비밀번호찾기답변  <span class="c_red">*</span>
           </td>
              <td class="line">
              	 <%--비밀번호찾기답변 입력 --%>
                 <input type="text" name="answer" value="" class="input_text_half" maxlength="10">
              </td>
        </tr>
      
        <!-- 이름 -->
        <tr>
           <td>
                               이름  <span class="c_red">*</span>
           </td>
              <td class="line">
              	 <%--이름(name) 입력 필드 --%>
                 <input type="text" name="name" value="" class="input_text_half" maxlength="6">
              </td>
        </tr>
      
         <!-- 생일 -->
         <tr>
           <td>
                 생년월일  <span class="c_red">*</span>
           </td>
           <td class="line">
           	   <%-- 생일(birth) 입력 필드. birth1,2,3은 JoinAction.java(회원가입 액션)에서 합쳐져 birth가 된다. --%>
               <input type="text1" name="birth1" value="" class="input_text_number" style="width: 40px;" maxlength="4">년 
               <input type="text2" name="birth2" value="" class="input_text_number" style="width: 20px;" maxlength="2">월
             <input type="text3" name="birth3" value="" class="input_text_number" style="width: 20px;" maxlength="2">일
             &nbsp; 
           </td>
         </tr>
       
         <!-- 성별 -->
         <tr>
           <td>성별</td>
           <td class="line">
           	   <%-- 성별(sex)을 체크하는 라디오 버튼 --%>
               <input type="radio" name="sex" value="남자" checked>남자 
               <input type="radio" name="sex" value="여자">여자
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
               <select name="tel1">
               <option value="" selected>선택</option>
               <option value="010">010</option>
               <option value="011">011</option>
               <option value="016">016</option>
               <option value="017">017</option>
               <option value="018">018</option>
               <option value="019">019</option>
             </select> - 
             <input type="text" name="tel2" class="input_text_number" maxlength="4"/>
              - <input type="text" name="tel3" class="input_text_number" maxlength="4"/> 
             <%-- SMS 수신동의 여부 체크박스(작업 중) --%> 
             <input type="checkbox" name="user_sms_allow" value="1">
             <span class="gray_font_11">SMS 수신 동의</span>
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
               <input name="email1" type="text" id="email1" value="" style="ime-mode: disabled" class="input_text_half" maxlength="20" />
                @ <input name="email2" type="text" id="email2" value="" style="ime-mode: disabled" class="input_text_half" maxlength="20" />
               <%-- 선택창(select_email)에서 '직접입력'을 선택하면 email은 email1 + email2이 된다. --%>
               <select name="select_email">
                  <option value="" selected>직접입력</option>
                  <option value="hanmail.net">hanmail.net</option>
                  <option value="naver.com">naver.com</option>
                  <option value="nate.com">nate.com</option>
                  <option value="chol.com">chol.com</option>
                  <option value="dreamwiz.com">dreamwiz.com</option>
                  <option value="empal.com">empal.com</option>
                  <option value="freechal.com">freechal.com</option>
                  <option value="gmail.com">gmail.com</option>
                  <option value="hanafos.com">hanafos.com</option>
                  <option value="hanmir.com">hanmir.com</option>
                  <option value="hitel.net">hitel.net</option>
                  <option value="hotmail.com">hotmail.com</option>
                  <option value="korea.com">korea.com</option>
                  <option value="lycos.co.kr">lycos.co.kr</option>
                  <option value="netian.com">netian.com</option>
                  <option value="paran.com">paran.com</option>
                  <option value="whois.co.kr">whois.co.kr</option>
                  <option value="yahoo.com">yahoo.com</option>
                  <option value="yahoo.co.kr">yahoo.co.kr</option>
               </select>
               <%-- 이메일 중복체크와 수신동의(작업 중) --%>
               <a href="#" id="chk_email_exist">
               <input type="button" id="chk_id_exist2" value="중복확인"/>
               </a>
               <input type="checkbox" name="user_email_allow" value="1">
               <span class="gray_font_11">메일수신동의</span>
            </td>
         </tr>
       
         <!-- 관심사 -->
         <tr>
            <td>관심사</td>
            <td class="line">
            	<%-- 관심사(pTypeNO)를 선택하는 체크박스 --%>
               <input type="checkbox" name="pTypeNO" value="눈" checked>눈<input type="checkbox" name="pTypeNO" value="코">코
            </td>
         </tr>
       </table>

      <div class="taC mt40">
      	  <%-- 회원가입 버튼. 유효한 정보가 입력되면 JoinAction.java으로 정보를 전송하여 회원가입을 함.--%>
          <input type="button" id="btn_user_join" style="cursor: pointer;" value="가입" onclick="validCheck()"/>
          <%-- 취소버튼. 정보를 리셋하고 로그인(login_confirm.jsp) 페이지로 돌아감 --%>
          <input type="reset" id="btn_reload" style="cursor: pointer;" value="취소" onclick="back()"/>
       </div>
   </div>
  </form>
</body>
</html>