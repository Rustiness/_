package kr.hospi.beans;

import java.sql.Date;

/**
 * Created
 * User: KJK
 * Date: 2017-05-29
 * Time: ¿ÀÀü 11:49
 */
public class Employee {
	private String eNO;
	private String eID;
	private String pass;
	private String name;
	private Date birth;
	private String sex;
	private String tel;
	private String email;
	private String position;
	private int gNO;
	private Date hireDate;
	private Date latestDate;
	private Date retireDate;
	private String state;

	public Employee() {
	}

	public Employee(String eNO, String eID, String pass, String name, Date birth, String sex, String tel, String email, String position, int gNO, Date hireDate, Date latestDate, Date retireDate, String state) {
		this.eNO = eNO;
		this.eID = eID;
		this.pass = pass;
		this.name = name;
		this.birth = birth;
		this.sex = sex;
		this.tel = tel;
		this.email = email;
		this.position = position;
		this.gNO = gNO;
		this.hireDate = hireDate;
		this.latestDate = latestDate;
		this.retireDate = retireDate;
		this.state = state;
	}

	public String geteNO() {
		return eNO;
	}

	public void seteNO(String eNO) {
		this.eNO = eNO;
	}

	public String geteID() {
		return eID;
	}

	public void seteID(String eID) {
		this.eID = eID;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public int getgNO() {
		return gNO;
	}

	public void setgNO(int gNO) {
		this.gNO = gNO;
	}

	public Date getHireDate() {
		return hireDate;
	}

	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}

	public Date getLatestDate() {
		return latestDate;
	}

	public void setLatestDate(Date latestDate) {
		this.latestDate = latestDate;
	}

	public Date getRetireDate() {
		return retireDate;
	}

	public void setRetireDate(Date retireDate) {
		this.retireDate = retireDate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
}
