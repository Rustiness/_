package kr.hospi.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


import kr.hospi.beans.Member;
import kr.hospi.dao.MemberDAO;

public class LostAction extends Action{
	ActionForward forward;
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email1")+"@"+request.getParameter("email2");
		
		System.out.println("name :"+name+", email: "+email);
		MemberDAO dao=new MemberDAO();
		List<Member> list=dao.selectAll();
		
		for(int i=0;i<list.size();i++){
			Member mem = list.get(i);
			if(name.equals(mem.getName())&&email.equals(mem.getEmail())){
				System.out.println("아이디가 존재!");
				request.getSession().setAttribute("mID", mem.getmID());
				forward = mapping.findForward("success");
				return forward;
			}
		}
		forward = mapping.findForward("fail");
		return forward;
	}

}
