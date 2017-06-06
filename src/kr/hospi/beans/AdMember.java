package kr.hospi.beans;

import java.sql.Date;

/**
 * Created
 * User: KJK
 * Date: 2017-06-07
 * Time: 오전 12:29
 */
public class AdMember {
	private String mNO; //식별번호
	private String mID;//아이디
	private String pass;//비밀번호
	private String qNO;//회원가입 질문
	private String answer;//회원가입 답변
	private String name;//이름
	private Date birth;//생일
	private String sex;//성별
	private String tel;//전화번호
	private String email;//이메일
	private String pTypeNO;//관심
	private Date latestDate;//최근접속일
	private Date joinDate;//가입일
	private String mMemo;//회원메모
	private Date mMdate;//회원메모수정일
	private String rNO;//예약정보
	private String pNO;//견적정보
	private String state;//계정상태

	public AdMember() {
	}

	public AdMember(String mNO, String mID, String pass, String qNO, String answer, String name, Date birth, String sex, String tel, String email, String pTypeNO, Date latestDate, Date joinDate, String mMemo, Date mMdate, String rNO, String pNO, String state) {
		this.mNO = mNO;
		this.mID = mID;
		this.pass = pass;
		this.qNO = qNO;
		this.answer = answer;
		this.name = name;
		this.birth = birth;
		this.sex = sex;
		this.tel = tel;
		this.email = email;
		this.pTypeNO = pTypeNO;
		this.latestDate = latestDate;
		this.joinDate = joinDate;
		this.mMemo = mMemo;
		this.mMdate = mMdate;
		this.rNO = rNO;
		this.pNO = pNO;
		this.state = state;
	}

	public String getmNO() {
		return mNO;
	}

	public void setmNO(String mNO) {
		this.mNO = mNO;
	}

	public String getmID() {
		return mID;
	}

	public void setmID(String mID) {
		this.mID = mID;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getqNO() {
		return qNO;
	}

	public void setqNO(String qNO) {
		this.qNO = qNO;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
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

	public String getpTypeNO() {
		return pTypeNO;
	}

	public void setpTypeNO(String pTypeNO) {
		this.pTypeNO = pTypeNO;
	}

	public Date getlatestDate() {
		return latestDate;
	}

	public void setlatestDate(Date latestDate) {
		this.latestDate = latestDate;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getmMemo() {
		return mMemo;
	}

	public void setmMemo(String mMemo) {
		this.mMemo = mMemo;
	}

	public Date getmMdate() {
		return mMdate;
	}

	public void setmMdate(Date mMdate) {
		this.mMdate = mMdate;
	}

	public String getrNO() {
		return rNO;
	}

	public void setrNO(String rNO) {
		this.rNO = rNO;
	}

	public String getpNO() {
		return pNO;
	}

	public void setpNO(String pNO) {
		this.pNO = pNO;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
}