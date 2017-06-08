package kr.hospi.forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class EmpActionForm extends ActionForm{
	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {

		return super.validate(mapping, request);
	}
}
