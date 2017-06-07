package kr.hospi.actions;

import kr.hospi.actionforms.LoginActionForm;
import kr.hospi.beans.AdMember;
import kr.hospi.dao.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

public class LoginAction extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		LoginActionForm laf = (LoginActionForm) form;
				
		//유효성검사가 끝난 데이터 얻어오기
		String mID = laf.getmID();
		String pass = laf.getPass();

		AdMember mem = new AdMember();//Member빈 mem 생성
			mem.setmID(mID);
			mem.setPass(pass);
		
		MemberDAO dao = new MemberDAO();//DAO 객체 생성
		
		AdMember user = dao.select(mem);//DAO에서 회원 전체정보를 가져와 user에 저장.
		
		ActionForward forward;	
		if(user==null){//아이디X 또는 비번X
			ActionMessages msgs = new ActionMessages();	
			msgs.add(ActionMessages.GLOBAL_MESSAGE, 
					 new ActionMessage("invalidlogin"));
			saveMessages(request, msgs);
			forward = mapping.getInputForward();//input속성의 정의된 페이지 이동
		}else{
			request.getSession().setAttribute("user",user);			
			forward = mapping.findForward("success");
			//<forward name="success">에 정의된 페이지 이동
		}
				
		return forward;//이동할 페이지
	}//execute
}