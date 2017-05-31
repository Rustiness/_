package kr.hospi.actions;

import kr.hospi.actionforms.LoginActionForm;
import kr.hospi.beans.Member;
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
				
		//��ȿ���˻簡 ���� ������ ������
		String mID = laf.getmID();
		String pass = laf.getPass();

		Member mem = new Member();//Member�� mem ����
			mem.setmID(mID);
			mem.setPass(pass);
		
		MemberDAO dao = new MemberDAO();//DAO ��ü ����
		
		Member user = dao.select(mem);//DAO���� ȸ�� ��ü������ ������ user�� ����.
		
		ActionForward forward;	
		if(user==null){//���̵�X �Ǵ� ���X
			ActionMessages msgs = new ActionMessages();	
			msgs.add(ActionMessages.GLOBAL_MESSAGE, 
					 new ActionMessage("invalidlogin"));
			saveMessages(request, msgs);
			forward = mapping.getInputForward();//input�Ӽ��� ���ǵ� ������ �̵�
		}else{
			request.getSession().setAttribute("user",user);			
			forward = mapping.findForward("success");
			//<forward name="success">�� ���ǵ� ������ �̵�
		}
				
		return forward;//�̵��� ������
	}//execute
}