package kr.hospi.forms;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 * Created
 * User: kosta
 * Date: 2017-05-27
 * Time: 오후 4:13
 */
public class CounActionForm extends ActionForm{
	
	  private String mNO;//회원아이디
	  private String pTypeNO;//회원이 선택한 관심분야
	  private String cTitle;//회원이 작성한 글 제목
	  private String cContent;//회원이 작성한 글 내용
	  private String state;//글의 활성화 유무??
	
	  @Override
		public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
			ActionErrors errors = new ActionErrors();
			
			if(mNO.length()==0) //상담분야 선택 안 할 경우
				errors.add("mNO", new ActionMessage("mNO"));
		/*	else if(rDate.length()==0) //예약날짜를 선택안할 시
				errors.add("rDateTime", new ActionMessage("rDateTime", "예약일"));
			else if(rTime.equals("=== 예약시간 선택 ===")) //예약시간을 선택안할 시
				errors.add("rDateTime", new ActionMessage("rDateTime", "예약시간"));*/
			
			return errors;
		}
	  
	  public String getmNO() {
		return mNO;
	}
	public void setmNO(String mNO) {
		this.mNO = mNO;
	}
	public String getpTypeNO() {
		return pTypeNO;
	}
	public void setpTypeNO(String pTypeNO) {
		this.pTypeNO = pTypeNO;
	}
	public String getcTitle() {
		return cTitle;
	}
	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
	}
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}
