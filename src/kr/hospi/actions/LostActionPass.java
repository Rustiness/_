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

public class LostActionPass extends Action{
	//������ �亯�� �Է� �޾� �н����带 ã���ִ� �׼�
	ActionForward forward;
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		String question=request.getParameter("question");
		String answer=request.getParameter("answer");
		
		System.out.println("question= "+question+", answer= "+answer);
		MemberDAO dao=new MemberDAO();
		List<Member> list=dao.selectAll();
		
		if(list!=null){
			for(int i=0;i<list.size();i++){
				Member mem=list.get(i);
				
				if(question.equals(mem.getQuestion())&&answer.equals(mem.getAnswer())){
					System.out.println("�н����尡 ����!");
					request.getSession().setAttribute("pass", mem.getPass());
					request.getSession().setAttribute("mID", mem.getmID());
					forward=mapping.findForward("success");
					return forward;
			    }//inner if
				
			}//for
		}//outer if
		
		forward=mapping.findForward("fail");
		System.out.println("�н����� ��ȸ ����!");
		return forward;
	}
}//class���ã��
