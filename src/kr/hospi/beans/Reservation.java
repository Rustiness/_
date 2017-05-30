package kr.hospi.beans;

public class Reservation { //예약을 위한 Reservation Beans
	private String rNO;
	private String mNO;
	private String pTypeNO;
	private String rDate;
	private String rFTime;
	private String rLTime;
	private String rContent;
	private String rState;
	
	public Reservation() {
	
	}
	
	public Reservation(String rNO, String mNO, String pTypeNO, String rDate, String rFTime, String rLTime, String rContent,
			String rState) {
		super();
		this.rNO = rNO;
		this.mNO = mNO;
		this.pTypeNO = pTypeNO;
		this.rDate = rDate;
		this.rFTime = rFTime;
		this.rLTime = rLTime;
		this.rContent = rContent;
		this.rState = rState;
	}

	public String getrNO() {
		return rNO;
	}

	public void setrNO(String rNO) {
		this.rNO = rNO;
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
