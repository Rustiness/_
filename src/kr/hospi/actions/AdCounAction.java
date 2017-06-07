package kr.hospi.actions;

import kr.hospi.beans.Counsel;
import kr.hospi.dao.CounselDAO;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

/**
 * Created
 * User: KJK
 * Date: 2017-06-07
 * Time: 오후 3:48
 */
public class AdCounAction extends Action {
	/*private static final DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");*/

	@Override
	public ActionForward execute(ActionMapping mapping,
	                             ActionForm form,
	                             HttpServletRequest request,
	                             HttpServletResponse response) throws Exception {
		String action = request.getParameter("action");

		if (action == null) {
			action = "list";
		}

		CounselDAO dao = new CounselDAO();
		ActionForward forward = null; // 이동할 페이지 저장
		List<Counsel> list = null;
		String cNO = null; // 상담 식별번호
		Counsel counsel; // 상담 정보

		switch (action) {
			case "list":
				list = dao.selCounAll();
				request.setAttribute("counlist", list);
				forward = mapping.findForward("selAll");
				break;
			case "info":
			case "updInfoForm":
			case "updComentForm":
				cNO = request.getParameter("cNO");
				list = dao.selCounInfo(cNO);
				request.setAttribute("counlist", list);
				if (action.equals("info")) {
					forward = mapping.findForward("selInfo");
				} else if (action.equals("updInfoForm")) {
					forward = mapping.findForward("selModify");
				} else if (action.equals("updComentForm")) {
					forward = mapping.findForward("selComent");
				}
				break;
			case "updInfo":
				cNO = request.getParameter("cNO");
				counsel = new Counsel();
				counsel.setcNO(cNO);
				counsel.setpTypeNO(request.getParameter("pTypeNO"));
				counsel.setcTitle(request.getParameter("cTitle"));
				counsel.setcContent(request.getParameter("cContent"));
				counsel.setImageURL(request.getParameter("imageURL"));
				counsel.setState(request.getParameter("state"));

				if (dao.updCounInfo(counsel)) {
					forward = mapping.findForward("selInfo");
				} else {
					forward = mapping.findForward("fail");
				}
				break;
			case "updComent":
				cNO = request.getParameter("cNO");
				counsel = new Counsel();
				counsel.setcNO(cNO);

//				System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()));
//
//				String curTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date().getTime());
//				System.out.println(curTime);
				Date date = new Date(Calendar.getInstance().getTimeInMillis());
				Time time = new Time(Calendar.getInstance().getTimeInMillis());
				Timestamp timestamp = new Timestamp(Calendar.getInstance().getTimeInMillis());
				counsel.seteDate(timestamp);
				counsel.seteNO(request.getParameter("eNO"));
				counsel.seteComent(request.getParameter("eComent"));
				counsel.setState(request.getParameter("state"));

				if (dao.updCounComent(counsel)) {
					forward = mapping.findForward("selInfo");
				} else {
					forward = mapping.findForward("fail");
				}
				break;
		}//switch
		return forward;
	}//execute
}