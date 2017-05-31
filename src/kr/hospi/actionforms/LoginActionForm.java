package kr.hospi.actionforms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class LoginActionForm extends ActionForm{
	
	private String mID;//�α����Ϸ��� ���̵�
	private String pass;//�α����Ϸ��� �н�����
	
	public String getmID() {
		return mID;
	}

	public void setmID(String mID) {
		this.mID = mID;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		System.out.println("validate()");
		ActionErrors errors = new ActionErrors();//�����ٱ��� ����(�����߻��� �����޼��� ��´�.)
		
		if(mID==null || mID.length()<1){
		    errors.add("errorid", new ActionMessage("invalidid", "���̵��Է�!!"));//�����ٱ��Ͽ� ������´�.
		   // new ActionMessage("key", param1 {0}, param2 {1}, param3 {2}, param4 {3})
		   
		}else if(mID.indexOf(" ") > -1 ||
				 mID.indexOf("\t") >= 0 ||
				 mID.indexOf("\n") > -1){//����,��,���� ����
			errors.add("errorid", new ActionMessage("invalidid", "������ ������ �� �����ϴ�!!"));//�����ٱ��Ͽ� ������´�.
		}
		
		if(pass==null || pass.length() == 0){
		    errors.add("errorpass", new ActionMessage("invalidpass"));
		}
		  
		return errors;//�� �ٱ��ϳ� return null�� ������ ������ ǥ����!!
	}
}
