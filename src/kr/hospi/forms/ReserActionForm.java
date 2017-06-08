package kr.hospi.forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import kr.hospi.beans.Member;

public class ReserActionForm extends ActionForm{//예약신청페이지에서의 유효성 검사 form
	private String rCate;
	private String rTime;
	private String rDate;
	
	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		
		if(rCate.equals("=== 진료과목 선택 ===")) //진료과목을 선택안할 시
			errors.add("rCate", new ActionMessage("rCate"));
		else if(rDate.length()==0) //예약날짜를 선택안할 시
			errors.add("rDateTime", new ActionMessage("rDateTime", "예약일"));
		else if(rTime.equals("=== 예약시간 선택 ===")) //예약시간을 선택안할 시
			errors.add("rDateTime", new ActionMessage("rDateTime", "예약시간"));
		return errors;
	}
	
	public String getrCate() {
		return rCate;
	}
	public void setrCate(String rCate) {
		this.rCate = rCate;
	}
	public String getrTime() {
		return rTime;
	}
	public void setrTime(String rTime) {
		this.rTime = rTime;
	}
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
}
