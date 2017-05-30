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

	public List<Reservation2> selectmNO(String mNO){//고객용: 예약정보 출력 (mNO)
		List<Reservation2> list=null;
		try {
			list = sqlMap.queryForList("reser.selectmNO", mNO);
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//insert
	
	public Reservation2 selectrNO(String rNO){//고객&관리자용: 예약정보 출력 (rNO)
		Reservation2 reser=null;
		try {
			reser = (Reservation2)sqlMap.queryForObject("reser.selectrNO", rNO);
			return reser;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return reser;
	}//insert
	
	public boolean update(Reservation reser){//고객용: 예약정보 수정
	    try {
	        int t = sqlMap.update("reser.update", reser);
	        if(t==1) return true;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return false;
	}//update
}
