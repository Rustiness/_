package kr.hospi.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import kr.hospi.beans.PlasticItem;

import kr.hospi.dao.PlasticItemDAO;
import kr.hospi.forms.EstiActionForm;
import kr.hospi.forms.PitemForm;



public class PlasticItemInsertAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		System.out.println("execute()");
			/*PitemForm eaf= (PitemForm)form;
			 * String pTypeNO= eaf.getpTypeNO();
	String pTypeName = eaf.getpItemName();
	String pItemNO= eaf.getpItemNO();
	String pItemName = eaf.getpItemName();
	String pItemValue= eaf.getpItemValue();
	String state =eaf.getState();
		*/
				//insert할  정보들 받아오기
				
				String pTypeNO = request.getParameter("pTypeNO");
				String pTypeName = request.getParameter("pTypeName");
				String pItemNO = request.getParameter("pItemNO");
				String pItemName = request.getParameter("pItemName");
				String pItemValue = request.getParameter("pItemValue");
				String state = request.getParameter("state");

				//plasticTypeDAO 객체생성
				PlasticItemDAO dao = new PlasticItemDAO();
				//받아온 정보를 PlasticType(beans)에 입력
				PlasticItem pitem = new PlasticItem();
				pitem.setpTypeNO(pTypeNO);
				pitem.setpTypeName(pTypeName);
				pitem.setpItemName(pItemName);
				pitem.setpItemNO(pItemNO);
				pitem.setpItemValue(pItemValue);
				pitem.setState(state);
				
				//insert실행
				if(dao.insert(pitem)){			
					//성공시 성형시술 리스트 목록으로 이동
					return mapping.findForward("success");
				}
				
				//실패시 페이지로 이동
				return mapping.findForward("fail");
					
				
	}
}
