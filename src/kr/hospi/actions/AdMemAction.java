package kr.hospi.actions;

import kr.hospi.beans.AdMember;
import kr.hospi.dao.MemberDAO;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created
 * User: kosta
 * Date: 2017-06-07
 * Time: 오전 12:13
 */
public class AdMemAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping,
	                             ActionForm form,
	                             HttpServletRequest request,
	                             HttpServletResponse response) throws Exception {
		String action = request.getParameter("action");

		if (action == null) {
			action = "list";
		}
		MemberDAO dao = new MemberDAO();
		ActionForward forward = null; // 이동할 페이지 저장
		List<AdMember> list = null;
		String mNO = null; // 회원 식별번호
		AdMember Member; // 회원 정보

		switch (action) {
			case "list":
				list = dao.selectAll();
				System.out.println("진입");
				request.setAttribute("memlist", list);
				forward = mapping.findForward("selAll");
				System.out.println("결과");
				break;
			case "info":
			case "updForm":
				break;
			case "update":
				break;
		}//switch

		return forward;
	}//execute
}
