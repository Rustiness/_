package kr.hospi.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import iba.conf.ChefSqlMapClient;
import kr.hospi.beans.Reservation;
import kr.hospi.beans.Reservation2;

public class ReservationDAO {
	SqlMapClient sqlMap;
	
	public ReservationDAO() {
		sqlMap = ChefSqlMapClient.getSqlMapInstance();
	}
	
	public boolean insert(Reservation reser){//고객용: 예약정보 입력
		try {
			sqlMap.insert("reser.insert", reser);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}//insert
	
	public boolean insertAd(Reservation reser){//관리자용: 예약정보 입력
		try {
			sqlMap.insert("ad_reser.insert", reser);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}//insert

	public List<Reservation2> selectAll(){//관리자용: 전체 예약목록 출력
		List<Reservation2> list=null;
		try {
			list = sqlMap.queryForList("ad_reser.selectAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//selectAll
	
	public List<Reservation2> selectCate(String cate){//관리자용: 카테고리별 예약목록 출력
		List<Reservation2> list=null;
		try {
			list = sqlMap.queryForList("ad_reser.selectCate",cate);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//selectCate
	
	public List<Reservation2> selectState(String State){//관리자용: 예약상태별 예약목록 출력
		List<Reservation2> list=null;
		try {
			list = sqlMap.queryForList("ad_reser.selectState",State);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//selectState
	
	public List<Reservation2> selectTime(String rFTime){//관리자용: 시간별 예약목록 출력
		List<Reservation2> list=null;
		try {
			list = sqlMap.queryForList("ad_reser.selectTime",rFTime);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//selectTime
	
	public Reservation2 selectAdrNO(String rNO){//관리자용: 예약정보 출력 (rNO)
		Reservation2 reser=null;
		try {
			reser = (Reservation2)sqlMap.queryForObject("ad_reser.selectrNO", rNO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return reser;
	}//selectrNO
	
	public List<Reservation2> selectmNO(String mNO){//고객용: 예약정보 출력 (mNO)
		List<Reservation2> list=null;
		try {
			list = sqlMap.queryForList("reser.selectmNO", mNO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//selectmNO
	
	public Reservation2 selectrNO(String rNO){//고객용: 예약정보 출력 (rNO)
		Reservation2 reser=null;
		try {
			reser = (Reservation2)sqlMap.queryForObject("reser.selectrNO", rNO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return reser;
	}//selectrNO
	
	public List<String> selectDate(String date){//고객용: 날짜별 예약불가 시간 출력
		List<String> timeList=null;
		try {
			timeList = (List<String>)sqlMap.queryForList("reser.selectDate", date);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return timeList;
	}//selectrNO
	
	public boolean update(Reservation reser){//고객용: 예약정보 수정
	    try {
	        int t = sqlMap.update("reser.update", reser);
	        if(t==1) return true;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return false;
	}//update
	
	public boolean updateAd(Reservation reser){//관리자용: 예약정보 수정
		try {
			int t = sqlMap.update("ad_reser.update", reser);
			if(t==1) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}//update
}
