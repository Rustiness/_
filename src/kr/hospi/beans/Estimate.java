package kr.hospi.beans;

/**
 * Created by ${minhaskim} on ${2017-05-27}.
 * Estiamte Beans
 */
public class Estimate {
	
	private int num;
	private String pTypeNO;
	private String pTypeName;
	private String pItemNO;
	private String pItemName;
	private String pItemValue;
	private String state;
	public Estimate() {
		
	}//basic constructor
	public Estimate(int num, String pTypeNO,String pTypeName, String pItemNO, String pItemName, String pItemValue, String state) {
		super();
		this.num = num;
		this.pTypeNO = pTypeNO;
		this.setpTypeName(pTypeName);
		this.pItemNO = pItemNO;
		this.pItemName = pItemName;
		this.pItemValue = pItemValue;
		this.state = state;
	}//overriding constructor
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
	public String getpTypeName() {
		return pTypeName;
	}
	public void setpTypeName(String pTypeName) {
		this.pTypeName = pTypeName;
	}
	
	
}
