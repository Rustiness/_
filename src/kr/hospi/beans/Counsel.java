package kr.hospi.beans;

import java.sql.Date;
import java.sql.Timestamp;

public class Counsel {
	  private String cNO;//���ǿ� ���� �ĺ���ȣ
	  private String mNO;//ȸ�����̵�
	  private String pTypeNO;//ȸ���� ������ ���ɺо�
	  private Date cDate;//�� �ۼ� ��¥
	  private String cTitle;//ȸ���� �ۼ��� �� ����
	  private String cContent;//ȸ���� �ۼ��� �� ����
	  private int cCount;//���� ���� ��ȸ��
	  private String imageURL;//�ۼ��ۿ� ÷�ε� �̹��� �ּ�
	  private Timestamp eDate;//�亯 �ۼ� ��¥
	  private String eNO;//�亯 �ۼ��� �������̵�
	  private String eComent;//�亯 ����
	  private String state;//���� Ȱ��ȭ ����
	  

	public String getcNO() {
		return cNO;
	}

	public void setcNO(String cNO) {
		this.cNO = cNO;
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
