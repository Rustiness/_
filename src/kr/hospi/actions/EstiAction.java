package kr.hospi.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


import kr.hospi.beans.Estimate;

import kr.hospi.dao.EstimateDAO;


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
	
	EstimateDAO dao = new EstimateDAO();
	
	Estimate esti_result = dao.selectEstimate("PA00001");
	
	System.out.println("execute esti_result is"+ esti_result);
	
	return mapping.findForward("success");
	
}//execute


}
