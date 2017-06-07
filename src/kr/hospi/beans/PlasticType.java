package kr.hospi.beans;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 * Created by ${Kosta} on ${2017-05-15}.
 */
public class PlasticType {
	
	private int num;
	private String pTypeNO;
	private String pTypeName;
	private String state;
	
	
	public PlasticType() {
		super();
		// TODO Auto-generated constructor stub
	}


	public PlasticType(int num, String pTypeNO, String pTypeName, String state) {
		super();
		this.num = num;
		this.pTypeNO = pTypeNO;
		this.pTypeName = pTypeName;
		this.state = state;
	}


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


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	
	
}
