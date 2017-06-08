package kr.hospi.forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class PtypeForm extends ActionForm{

	private String pTypeNO;
	private String pTypeName;
	private String state;
	
	
	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		if(pTypeNO.length()==0) //진료과목을 선택안할 시
			errors.add("pTypeNO", new ActionMessage("pTypeNO"));
		else if(pTypeName.length()==0) //진료과목를 선택안할 시
			errors.add("pTypeName", new ActionMessage("pTypeName", "진료과목명을 입력"));
		else if(state.equals("=== 상태 선택 ===")) //상태을 선택안할 시
			errors.add("state", new ActionMessage("state", "Active=1,InActive=0"));
		
		return errors;
		
		
	}
	
	public String getpTypeNO() {
		return pTypeNO;
	}


	public void setpTypeNO(String pTypeNO) {
		this.pTypeNO = pTypeNO;
	}


	public String getpTypeName() {
		return pTypeName;
	}


	public void setpTypeName(String pTypeName) {
		this.pTypeName = pTypeName;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}
	
	
	
}
