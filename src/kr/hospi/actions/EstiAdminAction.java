package kr.hospi.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.ibatis.sqlmap.client.SqlMapClient;

import iba.conf.ChefSqlMapClient;
import kr.hospi.beans.Estimate;
import kr.hospi.dao.EstimateDAO;

public class EstiAdminAction extends Action{
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		EstimateDAO dao = new EstimateDAO();
		List<String> list= null;
		
		list = dao.selectpTypeName();
		request.setAttribute("pTypeName", list);
		
		
		String action= request.getParameter("pTypeName");
	//	System.out.println("pTypeName"+action);
		
	//	if(action.equals("pTypeName")){
			
	//	}else {
		//	String pTypeName = request.getParameter("action");
		//	System.out.println("pItemName"+action);
		//	list = dao.selectpItemName(pTypeName);
		//	request.setAttribute("pItemName", list);
	//	}
	/*		
		for(int i =0; i< list.size(); i++){
			out.print("<option>"+list.get(i)+"</option>");
			}
		 System.out.println("list222:"+list.get(1));
		*/
		return mapping.findForward("success");
		
	}//execute

}
