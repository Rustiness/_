package kr.hospi.actionforms;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;


import kr.hospi.beans.Member;
import kr.hospi.dao.MemberDAO;

public class LoginActionForm extends ActionForm{
	
	private String mID;//로그인하려한 아이디
	private String pass;//로그인하려한 패스워드
	
	public String getmID() {
		return mID;
	}

	public void setmID(String mID) {
		this.mID = mID;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		System.out.println("validate()");
		ActionErrors errors = new ActionErrors();//에러바구니 생성(에러발생시 에러메세지 담는다.)
		
		MemberDAO dao = new MemberDAO();
		List<Member> list = dao.selectAll();
		
		boolean result_id = false;//아이디 존재 여부를 알려주는 boolean값 result_id.
		boolean result_pass = false;//비밀번호 존재 여부를 알려주는 boolean값 result.
		
		if(list!=null){
		    for(int i=0;i<list.size();i++){
		    	String mID_check=list.get(i).getmID();//데이터베이스에 존재하는 아이디
		    	String pass_check=list.get(i).getPass();//데이터베이스에 존재하는 비밀번호
		    	
		    	if(mID.equals(mID_check)){//데이터베이스에 아이디가 존재할 경우
		    		result_id = true;
		    		if(pass.equals(pass_check)){//데이터베이스의 아이디와 비밀번호가 일치할 경우
		    			result_pass=true;
		    		}
		    		break;
		    	}
		    }
		}
		
		if(mID==null || mID.length()<1){
		    errors.add("errorid", new ActionMessage("invalidid", "아이디를 입력하십시오."));//에러바구니에 에러담는다.
		   // new ActionMessage("key", param1 {0}, param2 {1}, param3 {2}, param4 {3})
		   
		}else if(mID.indexOf(" ") > -1 ||
				 mID.indexOf("\t") >= 0 ||
				 mID.indexOf("\n") > -1){//공백,탭,엔터 배제
			errors.add("errorid", new ActionMessage("invalidid", "공백을 포함할 수 없습니다!!"));//에러바구니에 에러담는다.
		}else if(!result_id){//아이디가 존재하지 않을 경우
			errors.add("errorid", new ActionMessage("invalidlogin"));
		}else if(result_id&&!result_pass){
			errors.add("errorpass", new ActionMessage("invalidlogin"));
		}
			
		if(pass==null || pass.length() == 0){
		    errors.add("errorpass", new ActionMessage("invalidpass"));
		}
		  
		return errors;//빈 바구니나 return null은 에러가 없음을 표시함!!
	}
}
