package kr.hospi.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import kr.hospi.beans.AdMember;
import kr.hospi.beans.Member;
import kr.hospi.dao.MemberDAO;

public class LostActionPass extends Action{
	//질문과 답변을 입력 받아 패스워드를 찾아주는 액션
	ActionForward forward;
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		String qNO=request.getParameter("qNO");
		String answer=request.getParameter("answer");
		
		System.out.println("qNO= "+qNO+", answer= "+answer);
		MemberDAO dao=new MemberDAO();
		List<AdMember> list=dao.selectAll();
		
		if(list!=null){
			for(int i=0;i<list.size();i++){
				AdMember mem=list.get(i);
				
				if(qNO.equals(mem.getqNO())&&answer.equals(mem.getAnswer())){
					System.out.println("패스워드가 존재!");
					request.getSession().setAttribute("pass", mem.getPass());
					request.getSession().setAttribute("mID", mem.getmID());
					forward=mapping.findForward("success");
					return forward;
			    }//inner if
				
			}//for
		}//outer if
		
		forward=mapping.findForward("fail");
		System.out.println("패스워드 조회 실패!");
		return forward;
	}
}//class비번찾기
