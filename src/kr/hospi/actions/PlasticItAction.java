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

public class PlasticItAction extends Action {
		//Action은 모든 pItem정보를 보여주기 위한 page
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//요청(파라미터)분석, 사용자 입력 데이터 얻기, 모델호출(결과를 영역저장), 페이지이동
				String action = request.getParameter("action");//요청 분석

				if (action == null) {
						action = "list"; //액션이 NULL 이었을때 기본값을 리스트 지정.
				}
		//System.out.println("executeItAction()");
		
		PlasticItemDAO dao = new PlasticItemDAO();
		ActionForward forward = null; //이동할 페이지 저장
		//Print-out pItem info 
		List<PlasticItem> list = null;
		PlasticItem pitem = new PlasticItem();
		String pItemNO = null; //pItemNO 기준
		
		switch (action) {
		case "list"://직원목록  if(action==null || action.equals("list"))
			list = dao.selectAll();
			//(뷰와) 데이터 공유 - request(forward 이동 시), session(forward 이동, redirect 이동 시)
		request.setAttribute("listpItem", list);
		//System.out.println("list 성공"+list);
		
		forward= mapping.findForward("selectAll");
		break;
		case "info": //수정폼 이전 정보 페이지
			pItemNO = (String) request.getParameter("pItemNO");
			//System.out.println(pItemNO);
			pitem = dao.selectpItemNO(pItemNO);
			//System.out.println("pitem"+ pitem);
			request.setAttribute("pItemInfolist", pitem);
			forward = mapping.findForward("selectInfo");
			break;
		case "modify": //수정폼
			pItemNO = (String) request.getParameter("pItemNO");
			//System.out.println("update:"+pItemNO);
			pitem = dao.selectpItemNO(pItemNO);
			//System.out.println("update 성공 확인여부:"+pitem);
			request.setAttribute("pItemInfolist", pitem);
			
				forward = mapping.findForward("selectModify");
			
			break;
		case "update": //수정요청
			
			pItemNO = (String) request.getParameter("pItemNO");
			
			
			String pItemName = request.getParameter("pItemName");
			String pItemValue = request.getParameter("pItemValue");
			String state = request.getParameter("state");
			//System.out.println("pItemName:"+pItemName);
			//System.out.println("pItemValue:"+pItemValue);
			//System.out.println("state:"+state);
			
			pitem.setpItemNO(pItemNO);
			pitem.setpItemName(pItemName);
			pitem.setpItemValue(pItemValue);
			pitem.setState(state);
			if(dao.update(pitem)){//update에 성공한다면
				pitem=dao.selectpItemNO(pItemNO);
				request.setAttribute("pItemInfolist", pitem);
				
				forward = mapping.findForward("selectInfo");
			}//if
			break;
	}//switch

	return forward;
				
	}//execute
}
