package kr.hospi.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import iba.conf.ChefSqlMapClient;
import kr.hospi.beans.PlasticItem;
import kr.hospi.beans.PlasticType;
import kr.hospi.beans.Reservation;

/**
 * Created by ${Kosta} on ${2017-05-15}.
 */
public class PlasticTypeDAO {
		SqlMapClient sqlMap;
	
	public PlasticTypeDAO() {
		sqlMap = ChefSqlMapClient.getSqlMapInstance();
	}
	
	public boolean insert(PlasticType ptype){//관리자용: 성형과목정보 입력
		try {
			sqlMap.insert("plastic.insertTy", ptype);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}//insert
	public boolean update(PlasticType ptype){//관리자용: 성형과목정보 수정
	    try {
	        int t = sqlMap.update("plastic.updateTy", ptype);
	        if(t==1) return true;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return false;
	}//update
	
	public List<PlasticType> selectAll(){//관리자용: 성형시술정보 출력 (ALL)
		List<PlasticType> list=null;
		try {
			list = sqlMap.queryForList("plastic.selectpType");
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//List<PlasticType>
	
	public PlasticType selectTyInfo(String pTypeNO){//관리자용: 성형시술정보 출력 (queryforObject는 한 줄만 출력)
		PlasticType list=null;
		try {
			list = (PlasticType) sqlMap.queryForObject("plastic.selectpTypeInfo", pTypeNO);
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//PlasticType
	

}
