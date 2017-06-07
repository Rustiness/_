package kr.hospi.actions;

import kr.hospi.beans.AdMember;
import kr.hospi.dao.MemberDAO;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Date;
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
		AdMember member; // 회원 정보

		switch (action) {
			case "list":
				list = dao.selectAll();
				request.setAttribute("memlist", list);
				forward = mapping.findForward("selAll");
				break;
			case "info":
			case "updForm":
				mNO = request.getParameter("mNO");
				list = dao.selMemInfo(mNO);
				request.setAttribute("memlist", list);
				if (action.equals("info")) {
					forward = mapping.findForward("selInfo");
				} else if (action.equals("updForm")) {
					forward = mapping.findForward("selModify");
				}
				break;
			case "update":
				mNO = request.getParameter("mNO");
				member = new AdMember();
				member.setmNO(mNO);
				member.setName(request.getParameter("name"));//이름
				member.setBirth(Date.valueOf(request.getParameter("birth")));//생일
				member.setSex(request.getParameter("sex"));//성별
				member.setTel(request.getParameter("tel"));//전화번호
				member.setEmail(request.getParameter("email"));//이메일
				member.setmMemo(request.getParameter("mMemo"));//회원메모
				member.setState(request.getParameter("state"));//계정상태

				if(dao.updMemInfo(member)){
					list = dao.selMemInfo(mNO);
					request.setAttribute("memlist", list);
					forward = mapping.findForward("selInfo");
				} else {
					forward = mapping.findForward("fail");
				}
				break;
		}//switch

		return forward;
	}//execute
}
