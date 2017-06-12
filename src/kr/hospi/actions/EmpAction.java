package kr.hospi.actions;

import kr.hospi.beans.Employee;
import kr.hospi.beans.Grade;
import kr.hospi.dao.EmployeeDAO;
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
		ActionForward forward = null; // 이동할 페이지 저장
		List<Employee> list = null;
		List<Grade> glist = null;
		String eNO = null; // 사원 식별번호
		Employee employee; // 사원 정보

		switch (action) {
			case "list":// 사원 목록  if(action==null || action.equals("list"))
				list = dao.selectAll();
				//(뷰와) 데이터 공유 - request(forward 이동 시), session(forward 이동, redirect 이동 시)
				request.setAttribute("emplist", list);
				forward = mapping.findForward("selAll");
				break;
			case "info":// 사원 상세정보폼
			case "updForm": // 사원 정보 수정폼
				eNO = (String) request.getParameter("eNO");
				System.out.println(eNO);
				list = dao.selEmpInfo(eNO);
				request.setAttribute("emplist", list);
				if (action.equals("info")) {
					forward = mapping.findForward("selInfo");
				} else if (action.equals("updForm")) {
					forward = mapping.findForward("selModify");
				}
				break;
			case "update": //수정요청
				eNO = request.getParameter("eNO");

				String name = request.getParameter("name");//이름
				Date birth = Date.valueOf(request.getParameter("birth"));//생일
				String sex = request.getParameter("sex");//성별
				String tel = request.getParameter("tel");//전화번호
				String email = request.getParameter("email");//이메일
				String position = request.getParameter("position");//직책
				Date hireDate = Date.valueOf(request.getParameter("hireDate"));//입사일

				Date retireDate = null;
				String strRetireDate = request.getParameter("retireDate");
				if (!(strRetireDate == null || strRetireDate.length() == 0)) {
					retireDate = Date.valueOf(request.getParameter("retireDate"));//퇴사일
				}

				String state = request.getParameter("state");//계정상태

				employee = new Employee();
				employee.seteNO(eNO);
				employee.setName(name);
				employee.setBirth(birth);
				employee.setSex(sex);
				employee.setTel(tel);
				employee.setEmail(email);
				employee.setPosition(position);
				employee.setHireDate(hireDate);
				employee.setRetireDate(retireDate);
				employee.setState(state);

				; //TODO 업데이트작업!!
				if (dao.updEmpInfo(employee)) {
					list = dao.selEmpInfo(eNO);
					request.setAttribute("emplist", list);
					forward = mapping.findForward("selInfo");
				} else {
					forward = mapping.findForward("fail");
				}
				break;
			case "insForm": //추가요청
				forward = mapping.findForward("selConfirm");
				break;
			case "insert": //추가요청
				employee = new Employee();
				employee.seteID(request.getParameter("eID"));//아이디
				employee.setPass(request.getParameter("pass"));//비밀번호
				employee.setName(request.getParameter("name"));//이름
				employee.setBirth(Date.valueOf(request.getParameter("birth")));//생일
				employee.setSex(request.getParameter("sex"));//성별
				employee.setTel(request.getParameter("tel"));//전화번호
				employee.setEmail(request.getParameter("email"));//이메일
				employee.setPosition(request.getParameter("position"));//직책
				employee.setHireDate(Date.valueOf(request.getParameter("hireDate")));//입사일
				employee.setState(request.getParameter("state"));//계정상태
				if (dao.insEmpInfo(employee)) {
					list = dao.selEmpInfo(eNO);
					request.setAttribute("emplist", list);
					forward = mapping.findForward("selInfo");
				} else {
					forward = mapping.findForward("fail");
				}
				break;
			case "glist":
				glist = dao.selGradeAll();
				request.setAttribute("gradelist", glist);
				forward = mapping.findForward("selGradeAll");
				break;
		}//switch

		return forward;
	}//execute
}
