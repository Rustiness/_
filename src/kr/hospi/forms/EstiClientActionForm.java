package kr.hospi.forms;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class EstiClientActionForm extends ActionForm{

		private int pNO;
		private Date pDate;
		private String[] pEyeItem;
		private String[] pNoseItem;
		private String[] pFaceItem;
		private String[] pBodyItem;
		private String[] pBreastItem;
		

		//ActionForm
		
		public int getpNO() {
			return pNO;
		}





		public void setpNO(int pNO) {
			this.pNO = pNO;
		}





		public Date getpDate() {
			return pDate;
		}





		public void setpDate(Date pDate) {
			this.pDate = pDate;
		}





		public String[] getpEyeItem() {
			return pEyeItem;
		}





		public void setpEyeItem(String[] pEyeItem) {
			this.pEyeItem = pEyeItem;
		}





		public String[] getpNoseItem() {
			return pNoseItem;
		}





		public void setpNoseItem(String[] pNoseItem) {
			this.pNoseItem = pNoseItem;
		}





		public String[] getpFaceItem() {
			return pFaceItem;
		}





		public void setpFaceItem(String[] pFaceItem) {
			this.pFaceItem = pFaceItem;
		}





		public String[] getpBodyItem() {
			return pBodyItem;
		}





		public void setpBodyItem(String[] pBodyItem) {
			this.pBodyItem = pBodyItem;
		}





		public String[] getpBreastItem() {
			return pBreastItem;
		}





		public void setpBreastItem(String[] pBreastItem) {
			this.pBreastItem = pBreastItem;
		}





		@Override
		public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		
			System.out.println("validate()");
				ActionErrors errors = new ActionErrors();
			/*if(pEyeItem.equals("") && pNoseItem.equals("") && 
					pFaceItem.equals("") &&pBodyItem.equals("") && pBreastItem.equals("")){
				errors.add("errorno1", new ActionMessage("msg","Please, click on items that you are interested in."));
						}*/
		return errors;
		}
		
}
