package kr.hospi.forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 * Created
 * User: minhaskim
 * Date: 2017-05-27
 * Time: 05.30
 */
public class EstiActionForm extends ActionForm{
	
	private int num;
	private String pTypeNO;
	private String pTypeName;
	

	private String pItemNO;
	private String pItemName;
	private String pItemValue;
	private String state;
	
	
	
	public int getNum() {
		return num;
	}



	public void setNum(int num) {
		this.num = num;
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

	public String getpItemNO() {
		return pItemNO;
	}



	public void setpItemNO(String pItemNO) {
		this.pItemNO = pItemNO;
	}



	public String getpItemName() {
		return pItemName;
	}



	public void setpItemName(String pItemName) {
		this.pItemName = pItemName;
	}



	public String getpItemValue() {
		return pItemValue;
	}



	public void setpItemValue(String pItemValue) {
		this.pItemValue = pItemValue;
	}



	public String getState() {
		return state;
	}



	public void setState(String state) {
		this.state = state;
	}

// ActionForms�� ���� ��ȿ�� �˻�

	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		System.out.println("validate()");
		ActionErrors errors = new ActionErrors();//
		
		if(pTypeNO.equals("") || pTypeNO.length()==0){
			errors.add("errorno1", new ActionMessage("msg","EY"));
			//new ActionMessage("key", param1 {0}, param2 {1}, param3 {2}, param4 {3})
		}else if(pTypeNO.indexOf(" ") >-1 ||
				pTypeNO.indexOf("/t") >=0 ||
						pTypeNO.indexOf("\n") >-1){
			errors.add("errorno2", new ActionMessage("msg","주석"));	
			}//if
		
		if(pItemNO.equals("") || pItemNO.length()==0){
			errors.add("errorno1", new ActionMessage("msg","EY0001"));
			//new ActionMessage("key", param1 {0}, param2 {1}, param3 {2}, param4 {3})
		}else if(pItemNO.indexOf(" ") >-1 ||
				pItemNO.indexOf("/t") >=0 ||
						pItemNO.indexOf("\n") >-1){
			errors.add("errorno2", new ActionMessage("msg","!!"));
		}
		if(!state.matches("[0-1]")){
			errors.add("errorchar", new ActionMessage("invalidchar","0 or 1 �� �Է��ϼ���"));
			
		}
		return errors;
		
		}//validate
}//ActionForms

