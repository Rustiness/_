package kr.hospi.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import kr.hospi.beans.PlasticItem;
import kr.hospi.beans.PlasticType;
import kr.hospi.dao.PlasticItemDAO;
import kr.hospi.dao.PlasticTypeDAO;
import kr.hospi.forms.EstiActionForm;
import kr.hospi.forms.PitemForm;



public class PlasticTyAction extends Action {
		//Action은 모든 pTYpe정보를 보여주기 위한 page
	@Override
	public ActionForward execute(ActionMapping mapping,
								ActionForm form,
								HttpServletRequest request,
								HttpServletResponse response) throws Exception {
		//요청(파라미터)분석, 사용자 입력 데이터 얻기, 모델호출(결과를 영역저장), 페이지이동
		String action = request.getParameter("action");//요청 분석

		if (action == null) {
				action = "list"; //액션이 NULL 이었을때 기본값을 리스트 지정.
		}
		System.out.println("executeTy()");
		
		PlasticTypeDAO dao = new PlasticTypeDAO();
		ActionForward forward = null; //이동할 페이지 저장
		//Print-out pType info 
		List<PlasticType> list = null;
		PlasticType ptype = new PlasticType();
		String pTypeNO = null; //pTypeNO 기준
		
		switch (action) {
		case "list"://직원목록  if(action==null || action.equals("list"))
			list = dao.selectAll();
			//(뷰와) 데이터 공유 - request(forward 이동 시), session(forward 이동, redirect 이동 시)
			request.setAttribute("listpType", list);
			forward = mapping.findForward("selectAll");
			break;
		case "info": //수정폼
			pTypeNO = (String) request.getParameter("pTypeNO");
			
			ptype = dao.selectTyInfo(pTypeNO);
			
			request.setAttribute("pTypeInfolist", ptype); //pTypeInfolist
			
			if (action.equals("info")) {
				forward = mapping.findForward("selectInfo");
			} break;
		case "modify": //else if (action.equals("modify")) {
			pTypeNO = (String) request.getParameter("pTypeNO");
			
			ptype = dao.selectTyInfo(pTypeNO);
			
			request.setAttribute("pTypeInfolist", ptype); //pTypeInfolist
				forward = mapping.findForward("selectModify");
			
			break;
		case "update": //수정요청
			pTypeNO = (String) request.getParameter("pTypeNO");
			//request.setAttribute("emplist", list);
			System.out.println("pTypeNO:"+pTypeNO);
			String pTypeName = request.getParameter("pTypeName");
			String state = request.getParameter("state");
			System.out.println("pTypeName:"+pTypeName);
			System.out.println("state:"+state);
			ptype.setpTypeNO(pTypeNO);
			ptype.setpTypeName(pTypeName); 
			ptype.setState(state);
			//update작업
			if(dao.update(ptype)){//update에 성공한다면
				ptype = dao.selectTyInfo(pTypeNO);
				System.out.println("pTypeNO :"+pTypeNO);
				request.setAttribute("pTypeInfolist", ptype); //pTypeInfolist
				
			forward = mapping.findForward("selectInfo");
			}//if
			break;
	}//switch

	return forward;
				
	}//execute
}
