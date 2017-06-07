package kr.hospi.beans;

import java.sql.Date;
import java.sql.Timestamp;

public class Counsel {
	  private String cNO;//상담건에 대한 식별번호
	  private String mNO;//회원아이디
	  private String pTypeNO;//회원이 선택한 관심분야
	  private Date cDate;//글 작성 날짜
	  private String cTitle;//회원이 작성한 글 제목
	  private String cContent;//회원이 작성한 글 내용
	  private int cCount;//글을 읽은 조회수
	  private String imageURL;//작성글에 첨부된 이미지 주소
	  private Timestamp eDate;//답변 작성 날짜
	  private String eNO;//답변 작성한 직원아이디
	  private String eComent;//답변 내용
	  private String state;//글의 활성화 유무
	  

	public String getcNO() {
		return cNO;
	}

	public void setcNO(String cNO) {
		this.cNO = cNO;
	}

	public String getmNO() {
		return mNO;
	}

	public void setmID(String mNO) {
		this.mNO = mNO;
	}

	public String getpTypeNO() {
		return pTypeNO;
	}

	public void setpTypeNO(String pTypeNO) {
		this.pTypeNO = pTypeNO;
	}

	public Date getcDate() {
		return cDate;
	}

	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}

	public String getcTitle() {
		return cTitle;
	}

	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public int getcCount() {
		return cCount;
	}

	public void setcCount(int cCount) {
		this.cCount = cCount;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public Timestamp geteDate() {
		return eDate;
	}

	public void seteDate(Timestamp eDate) {
		this.eDate = eDate;
	}

	public String geteNO() {
		return eNO;
	}

	public void seteNO(String eNO) {
		this.eNO = eNO;
	}

	public String geteComent() {
		return eComent;
	}

	public void seteComent(String eComent) {
		this.eComent = eComent;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
}
