package kr.hospi.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import kr.hospi.beans.Estimate;
import kr.hospi.dao.EstimateDAO;
import kr.hospi.forms.EstiClientActionForm;

public class EstiClientAction extends Action{//Controller: EstiClientAction

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		Estimate estimate = new Estimate();//받아온 정보를Estiamte(beans)에 입력
		String[] pEyeItem = request.getParameterValues("pEyeItem");
		if(pEyeItem != null){
		String pEyeItem_str="";
		for(int i=0;i<pEyeItem.length;i++){
			if(i<pEyeItem.length-1){
				pEyeItem_str = pEyeItem_str + pEyeItem[i]+",";
			}else{
				pEyeItem_str = pEyeItem_str + pEyeItem[i];
			}
		}//for
		estimate.setpEyeItem(pEyeItem_str);
		}else//if EyeItem
			estimate.setpEyeItem("0");
	
		
		String[] pNoseItem = request.getParameterValues("pNoseItem");
		if(pNoseItem != null){
		String pNoseItem_str="";
		for(int i=0;i<pNoseItem.length;i++){
			if(i<pNoseItem.length-1){
				pNoseItem_str = pNoseItem_str + pNoseItem[i]+",";
			}else{
				pNoseItem_str = pNoseItem_str + pNoseItem[i];
			}
		}//for
		estimate.setpNoseItem(pNoseItem_str);
		}else//if EyeItem
			estimate.setpNoseItem("0");
		
		String[] pFaceItem = request.getParameterValues("pFaceItem");
		if(pFaceItem != null){
		String pFaceItem_str="";
		for(int i=0;i<pFaceItem.length;i++){
			if(i<pFaceItem.length-1){
				pFaceItem_str = pFaceItem_str + pFaceItem[i]+",";
			}else{
				pFaceItem_str = pFaceItem_str + pFaceItem[i];
			}
		}//for
		estimate.setpFaceItem(pFaceItem_str);
		}else//if EyeItem
			estimate.setpFaceItem("0");
		String[] pBodyItem = request.getParameterValues("pBodyItem");
		if(pBodyItem != null){
		String pBodyItem_str="";
		for(int i=0;i<pBodyItem.length;i++){
			if(i<pBodyItem.length-1){
				pBodyItem_str = pBodyItem_str + pBodyItem[i]+",";
			}else{
				pBodyItem_str = pBodyItem_str + pBodyItem[i];
			}
		}//for
		estimate.setpBodyItem(pBodyItem_str);
		}else//if EyeItem
			estimate.setpBodyItem("0");
		String[] pBreastItem = request.getParameterValues("pBreastItem");
		if(pBreastItem!=null){
		String pBreastItem_str="";
		for(int i=0;i<pBreastItem.length;i++){
			if(i<pBreastItem.length-1){
				pBreastItem_str = pBreastItem_str + pBreastItem[i]+",";
			}else{
				pBreastItem_str = pBreastItem_str + pBreastItem[i];
			}
		}//for
		estimate.setpBreastItem(pBreastItem_str);
		}else//if EyeItem
			estimate.setpBreastItem("0");
		//견적결과_고객용 esti_res.do session을 통해서 결과값 전달
		request.getSession().setAttribute("estimate", estimate);
		EstimateDAO dao = new EstimateDAO();
		//estimate.setPrice(totalPrice);
		Boolean insertCheck = dao.insert(estimate);
		System.out.println("t="+insertCheck);
		
		if(insertCheck){
			return mapping.findForward("success")	;
		}else{
			return mapping.findForward("fail");
		}
				
	}//execute

}
