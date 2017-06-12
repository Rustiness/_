package kr.hospi.beans;

/**
 * Created
 * User: KJK
 * Date: 2017-06-09
 * Time: 오후 1:51
 */
public class Grade {
	private String gNO; //멤버 식별번호
	private String gName;//아이디
	private String gMemo;//비밀번호

	public Grade() {
	}

	public Grade(String gNO, String gName, String gMemo) {
		this.gNO = gNO;
		this.gName = gName;
		this.gMemo = gMemo;
	}

	public String getgNO() {
		return gNO;
	}

	public void setgNO(String gNO) {
		this.gNO = gNO;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	public String getgMemo() {
		return gMemo;
	}

	public void setgMemo(String gMemo) {
		this.gMemo = gMemo;
	}
}
