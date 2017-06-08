package kr.hospi.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import kr.hospi.beans.PlasticType;

import kr.hospi.dao.PlasticTypeDAO;


public class PlasticTInsertAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		System.out.println("executeTy()");
		
				//insert할 예약 정보들 받아오기
				String pTypeNO = request.getParameter("pTypeNO");
				String pTypeName = request.getParameter("pTypeName");
				String state = request.getParameter("state");

				//plasticTypeDAO 객체생성
				PlasticTypeDAO dao = new PlasticTypeDAO();
				//받아온 정보를 PlasticType(beans)에 입력
				PlasticType ptype = new PlasticType();
				ptype.setpTypeNO(pTypeNO);
				ptype.setpTypeName(pTypeName);
				ptype.setState(state);
				
				//insert실행
				if(dao.insert(ptype)){			
					//성공시 성형과목 리스트 목록으로 이동
					return mapping.findForward("success");
				}
				
				//실패시 페이지로 이동
				return mapping.findForward("fail");
					
				
	}
}
