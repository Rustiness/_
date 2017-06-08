package kr.hospi.forms;

import java.sql.Date;

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
	private String pNO;
	private Date pDate;
	private String pEyeItem; 
	private String pNoseItem; 
	private String pFaceItem; 
	private String pBodyItem ;
	private String pBreastItem ;
	private double price;
	public String getpEyeItem() {
		return pEyeItem;
	}

	public void setpEyeItem(String pEyeItem) {
		this.pEyeItem = pEyeItem;
	}

	public String getpNoseItem() {
		return pNoseItem;
	}

	public void setpNoseItem(String pNoseItem) {
		this.pNoseItem = pNoseItem;
	}

	public String getpFaceItem() {
		return pFaceItem;
	}

	public void setpFaceItem(String pFaceItem) {
		this.pFaceItem = pFaceItem;
	}

	public String getpBodyItem() {
		return pBodyItem;
	}

	public void setpBodyItem(String pBodyItem) {
		this.pBodyItem = pBodyItem;
	}

	public String getpBreastItem() {
		return pBreastItem;
	}

	public void setpBreastItem(String pBreastItem) {
		this.pBreastItem = pBreastItem;
	}
	
	
	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
		return super.validate(mapping, request);
	}
	
	public String getpNO() {
		return pNO;
	}
	public void setpNO(String pNO) {
		this.pNO = pNO;
	}
	public Date getpDate() {
		return pDate;
	}
	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}
	
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	
}//ActionForms

