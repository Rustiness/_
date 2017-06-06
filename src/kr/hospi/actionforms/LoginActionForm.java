package kr.hospi.actionforms;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import kr.hospi.beans.Member;
import kr.hospi.dao.MemberDAO;

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
		
		MemberDAO dao = new MemberDAO();
		List<Member> list = dao.selectAll();
		
		boolean result_id = false;//���̵� ���� ���θ� �˷��ִ� boolean�� result_id.
		boolean result_pass = false;//��й�ȣ ���� ���θ� �˷��ִ� boolean�� result.
		
		if(list!=null){
		    for(int i=0;i<list.size();i++){
		    	String mID_check=list.get(i).getmID();//�����ͺ��̽��� �����ϴ� ���̵�
		    	String pass_check=list.get(i).getPass();//�����ͺ��̽��� �����ϴ� ��й�ȣ
		    	
		    	if(mID.equals(mID_check)){//�����ͺ��̽��� ���̵� ������ ���
		    		result_id = true;
		    		if(pass.equals(pass_check)){//�����ͺ��̽��� ���̵�� ��й�ȣ�� ��ġ�� ���
		    			result_pass=true;
		    		}
		    		break;
		    	}
		    }
		}
		
		if(mID==null || mID.length()<1){
		    errors.add("errorid", new ActionMessage("invalidid", "���̵� �Է��Ͻʽÿ�."));//�����ٱ��Ͽ� ������´�.
		   // new ActionMessage("key", param1 {0}, param2 {1}, param3 {2}, param4 {3})
		   
		}else if(mID.indexOf(" ") > -1 ||
				 mID.indexOf("\t") >= 0 ||
				 mID.indexOf("\n") > -1){//����,��,���� ����
			errors.add("errorid", new ActionMessage("invalidid", "������ ������ �� �����ϴ�!!"));//�����ٱ��Ͽ� ������´�.
		}else if(!result_id){//���̵� �������� ���� ���
			errors.add("errorid", new ActionMessage("invalidlogin"));
		}else if(result_id&&!result_pass){
			errors.add("errorpass", new ActionMessage("invalidlogin"));
		}
			
		if(pass==null || pass.length() == 0){
		    errors.add("errorpass", new ActionMessage("invalidpass"));
		}
		  
		return errors;//�� �ٱ��ϳ� return null�� ������ ������ ǥ����!!
	}
}
