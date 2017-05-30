package kr.hospi.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import kr.hospi.beans.Estimate;
import kr.hospi.dao.EstimateDAO;

/**
 * When it clicks on "esti.do_견적등록", this goes on EstiUserAction.
 * 
 * Created
 * User: minhaskim
 * Date: 2017-05-27
 * Time: 05.22 
 */
public class EstiUserAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		EstimateDAO dao = new EstimateDAO();	
		
		//EYE 관련된 정보 출력 시작  --> list1
	      List<Estimate> list1 = dao.selectType("EY");
	    request.setAttribute("list1", list1);
		//NOSE 관련된 정보 출력  시작 --> list2
	    List<Estimate> list2 = dao.selectType("NO");
	    request.setAttribute("list2", list2);
	  //FACE 관련된 정보 출력  시작  --> list3
	    List<Estimate> list3 = dao.selectType("FA");
	    request.setAttribute("list3", list3);
	  //BODY 관련된 정보 출력   시작 --> list4
	    List<Estimate> list4 = dao.selectType("BO");
	    request.setAttribute("list4", list4);
	  //BREAST 관련된 정보 출력   시작  --> list5
	    List<Estimate> list5 = dao.selectType("BR");
	    request.setAttribute("list5", list5);
	    
		return mapping.findForward("success");
		//esti_confirm.jsp파일에서 각각 다른 테이블로 출력
	}//execute
		
	
	

}
