package kr.hospi.beans;

/**
 * Created by ${Kosta} on ${2017-05-15}.
 */
//회원가입정보 및 회원정보수정 빈
public class Member {
	private String mID;//아이디
	private String pass;//비밀번호
	private String question;//회원가입 질문
	private String answer;//회원가입 답변
	private String name;//이름
	private String birth;//생일
	private String sex;//성별
	private String tel;//전화번호
	private String email;//이메일
	private String pTypeNO;//관심사
	
	public Member() {

	}

	public Member(String mID, String pass, String question, String answer, String name, String birth, String sex,
			String tel, String email, String pTypeNO) {
		super();
		this.mID = mID;
		this.pass = pass;
		this.question = question;
		this.answer = answer;
		this.name = name;
		this.birth = birth;
		this.sex = sex;
		this.tel = tel;
		this.email = email;
		this.pTypeNO = pTypeNO;
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

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
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

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
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
	
}
