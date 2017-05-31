package kr.hospi.actions;

import kr.hospi.beans.Employee;
import kr.hospi.dao.EmployeeDAO;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created
 * User: KJK
 * Date: 2017-05-27
 * Time: 오후 4:12
 */
public class EmpAction extends Action {
	//컨트롤 객체

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
		System.out.println("발생한 action : " + action);
		EmployeeDAO dao = new EmployeeDAO();
		ActionForward forward = null; //이동할 페이지 저장
		List<Employee> list = null;

		switch (action) {
			case "list"://직원목록  if(action==null || action.equals("list"))
				list = dao.selectAll();
				//(뷰와) 데이터 공유 - request(forward 이동 시), session(forward 이동, redirect 이동 시)
				request.setAttribute("emplist", list);
				forward = mapping.findForward("selAll");
				break;
			case "info":// 직원 정보
				String eNO = (String) request.getParameter("eNO");
			System.out.println(eNO);
				list = dao.selEmpInfo(eNO);
				request.setAttribute("emplist", list);
				forward = mapping.findForward("selInfo");
				System.out.println("매핑진행!");
				break;
			case "upform": //수정폼요청
				break;
			case "update": //수정요청
				break;
		}//switch

		return forward;
	}//execute
}
