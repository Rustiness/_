package kr.hospi.beans;

import java.sql.Date;

/**
 * Created by ${minhaskim} on ${2017-05-27}.
 * Estiamte Beans
 */
public class Estimate {
	
	private String pNO;
	private String mNO;
	private Date pDate;
	
	private String pEyeItem; 
	private String pNoseItem; 
	private String pFaceItem; 
	private String pBodyItem ;
	private String pBreastItem ;
	private double price;
	public Estimate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Estimate(String pNO, String mNO, Date pDate, String pEyeItem, String pNoseItem, String pFaceItem,
			String pBodyItem, String pBreastItem, double price) {
		super();
		this.pNO = pNO;
		this.mNO = mNO;
		this.pDate = pDate;
		this.pEyeItem = pEyeItem;
		this.pNoseItem = pNoseItem;
		this.pFaceItem = pFaceItem;
		this.pBodyItem = pBodyItem;
		this.pBreastItem = pBreastItem;
		this.price = price;
	}
	public String getpNO() {
		return pNO;
	}
	public void setpNO(String pNO) {
		this.pNO = pNO;
	}
	public String getmNO() {
		return mNO;
	}
	public void setmNO(String mNO) {
		this.mNO = mNO;
	}
	public Date getpDate() {
		return pDate;
	}
	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}
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
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	

	
}
