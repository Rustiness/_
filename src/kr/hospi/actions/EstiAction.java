package kr.hospi.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import kr.hospi.beans.Estimate;
import kr.hospi.dao.EstimateDAO;
import kr.hospi.forms.EstiActionForm;

/**
 * Created
 * User: minhaskim
 * Date: 2017-05-27
 * Time: 05.25 
 * admin에서 input 새로운 정보 입력
 * Struts EstiAction ActionForm을 통해 유효성 검사후 action으로 값이 들어옴
 */
public class EstiAction extends Action {

@Override
public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
	
	System.out.println("execute()");
	EstiActionForm eaf= (EstiActionForm)form;
	int num = eaf.getNum();
	String pTypeNO= eaf.getpTypeNO();
	String pTypeName = eaf.getpItemName();
	String pItemNO= eaf.getpItemNO();
	String pItemName = eaf.getpItemName();
	String pItemValue= eaf.getpItemValue();
	String state =eaf.getState();
	
	Estimate estvo= new Estimate(num, pTypeNO,pTypeName, pItemNO, pItemName ,pItemValue, state);
	EstimateDAO dao = new EstimateDAO();
	
	ActionForward forward;
	if(estvo == null){//����� ���� ��
		ActionMessages msgs = new ActionMessages();
			msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("msg"));	
		saveMessages(request, msgs);
		forward = mapping.getInputForward();
		// ActionMapping mapping:
		System.out.println("fail");									
	} else {
		// ��������(����� ����)==> �̵��ϴ� �ο� ������ ����
		HttpSession session = request.getSession();
		session.setAttribute("esti", dao.insert(estvo));
		// �α��� ����
		forward = mapping.findForward("success");
		System.out.println("success");
	}

	return forward;
		
	
}//execute
}
