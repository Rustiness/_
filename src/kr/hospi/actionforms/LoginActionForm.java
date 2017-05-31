package kr.hospi.actionforms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

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
		
		if(mID==null || mID.length()<1){
		    errors.add("errorid", new ActionMessage("invalidid", "아이디입력!!"));//에러바구니에 에러담는다.
		   // new ActionMessage("key", param1 {0}, param2 {1}, param3 {2}, param4 {3})
		   
		}else if(mID.indexOf(" ") > -1 ||
				 mID.indexOf("\t") >= 0 ||
				 mID.indexOf("\n") > -1){//공백,탭,엔터 배제
			errors.add("errorid", new ActionMessage("invalidid", "공백을 포함할 수 없습니다!!"));//에러바구니에 에러담는다.
		}
		
		if(pass==null || pass.length() == 0){
		    errors.add("errorpass", new ActionMessage("invalidpass"));
		}
		  
		return errors;//빈 바구니나 return null은 에러가 없음을 표시함!!
	}
}
