package kr.hospi.beans;

public class Reservation2 { //member와 plasticType과 natural join한 결과를 얻어오기위한  Reservation2 Beans
	private String rNO;
	private String mID;
	private String name;
	private String tel;
	private String email;
	private String rDate;
	private String rFTime;
	private String rLTime;
	private String pTypeName;
	private String rContent;
	private String rState;
	
	public Reservation2() {
	
	}

	public String getrNO() {
		return rNO;
	}

	public void setrNO(String rNO) {
		this.rNO = rNO;
	}

	public String getmID() {
		return mID;
	}

	public void setmID(String mID) {
		this.mID = mID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getrDate() {
		return rDate;
	}

	public void setrDate(String rDate) {
		this.rDate = rDate;
	}

	public String getrFTime() {
		return rFTime;
	}

	public void setrFTime(String rFTime) {
		this.rFTime = rFTime;
	}

	public String getrLTime() {
		return rLTime;
	}

	public void setrLTime(String rLTime) {
		this.rLTime = rLTime;
	}

	public String getpTypeName() {
		return pTypeName;
	}

	public void setpTypeName(String pTypeName) {
		this.pTypeName = pTypeName;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public String getrState() {
		return rState;
	}

	public void setrState(String rState) {
		this.rState = rState;
	}
}
