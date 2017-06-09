package kr.hospi.actions;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


import kr.hospi.beans.Estimate;
import kr.hospi.beans.PlasticItem;
import kr.hospi.dao.EstimateDAO;
import kr.hospi.dao.PlasticItemDAO;


/**
 * Created
 * User: minhaskim
 * Date: 2017-05-27
 * Time: 05.25 
 * admin에서 input 새로운 정보 입력
 * Struts EstiAction  insert(estimate)를 select를 통해서 값을 불러옴
 */
public class EstiResultAction extends Action {
	
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List<PlasticItem> list = new ArrayList<>();
		
		
		PlasticItem pitem;
		String pNO;
		EstimateDAO dao = new EstimateDAO();
		ActionForward forward = null; //이동할 페이지 저장
		PlasticItemDAO plaDAO = new PlasticItemDAO();
		
		
		
		// 각 환자에 대한 성형시술 상세 기술
	
			pNO = (String) request.getParameter("pNO");
			Estimate esti_result = dao.selectEstimate("PA00070");//pNO집어넣어야 함
			request.setAttribute("estimate", esti_result); //estimate 견적  창
			
			// EyeSurgery ptypeCode
			if(!esti_result.getpEyeItem().equals("0")){
		String[] eyelist = esti_result.getpEyeItem().split(",");
		
		if (eyelist != null) {// if it has a value of eyelist,
			for (int i = 0; i < eyelist.length; i++) {
				System.out.println("눈");
				String pItemNO = eyelist[i];

				pitem = plaDAO.selectpItemNO(pItemNO);
				System.out.println("pitem" + pitem.getpItemName());
				list.add(pitem);
			} // for
		} // if
			}//if
		// NoseSurgery ptypeCode
		if(!esti_result.getpNoseItem().equals("0")){
		String[] noselist = esti_result.getpNoseItem().split(",");
		if (noselist != null) {// if it has a value of noselist,
			for (int i = 0; i < noselist.length; i++) {
				System.out.println("코");
				String pItemNO = noselist[i];

				pitem = plaDAO.selectpItemNO(pItemNO);
				System.out.println("pitem" + pitem.getpItemName());
				list.add(pitem);
			} // for
		}//if
		}//if
		// FaceSurgery ptypeCode
		if(!esti_result.getpFaceItem().equals("0")){
		String[] facelist = esti_result.getpFaceItem().split(",");
		if (facelist != null) {// if it has a value of facelist,
			for (int i = 0; i < facelist.length; i++) {
				System.out.println("얼굴");
				String pItemNO = facelist[i];

				pitem = plaDAO.selectpItemNO(pItemNO);
				System.out.println("pitem" + pitem.getpItemName());
				list.add(pitem);
			} // for
		} // if
		}//if
		// BodySurgery ptypeCode
		if(!esti_result.getpBodyItem().equals("0")){
		String[] bodylist = esti_result.getpBodyItem().split(",");
		if (bodylist != null) {// if it has a value of bodylist,
			for (int i = 0; i < bodylist.length; i++) {
				System.out.println("체형");
				String pItemNO = bodylist[i];
				System.out.println(pItemNO);

				pitem = plaDAO.selectpItemNO(pItemNO);
				System.out.println("pitem" + pitem.getpItemName());
				list.add(pitem);
			} // for
		} // if
		}//if
		// BreastSurgery ptypeCode
		if(!esti_result.getpBreastItem().equals("0")){
		String[] breastlist = esti_result.getpBreastItem().split(",");
		if (breastlist != null) {// if it has a value of bodylist,
			for (int i = 0; i < breastlist.length; i++) {
				String pItemNO = breastlist[i];
				System.out.println("pItemNO:"+pItemNO+":::");

				pitem = plaDAO.selectpItemNO(pItemNO);
				System.out.println("pitem" + pitem.getpItemName());
				list.add(pitem);
			} // for
		} // if
		}//if
		request.setAttribute("list", list);
		forward = mapping.findForward("success");
		

		
		return forward;

	}// execute
		

}
