package kr.hospi.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import iba.conf.ChefSqlMapClient;
import kr.hospi.beans.PlasticItem;
import kr.hospi.beans.Reservation2;


/**
 * Created by ${minhaskim} on ${2017-05-15}.
 */
public class PlasticItemDAO {
SqlMapClient sqlMap;
	
	public PlasticItemDAO() {
		sqlMap = ChefSqlMapClient.getSqlMapInstance();
	}
	
	public boolean insert(PlasticItem pitem){//관리자용: 성형과목정보 입력
		try {
			sqlMap.insert("plastic.insertIt", pitem);
			System.out.println("successInsertpItem");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}//insert
	public boolean update(PlasticItem pitem){//관리자용: 성형과목정보 수정
	    try {
	        int t = sqlMap.update("plastic.updateIt", pitem);
	        if(t==1) return true;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return false;
	}//update
	
	public List<PlasticItem> selectAll(){//관리자용: 성형시술정보 출력 (ALL)
		List<PlasticItem> list=null;
		try {
			list = sqlMap.queryForList("plastic.selectpItem");
			System.out.println("It has succeeded to download");
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//List<PlasticItem>
	
	public PlasticItem selectpItemNO(String pItemNO){//관리자용: 성형 시술정보 출력 (pItemNO)
		PlasticItem pitem=null;
		try {
			pitem = (PlasticItem)sqlMap.queryForObject("plastic.selectpItemNO", pItemNO);
			//return pitem;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pitem;
	}//PlasticItem
	
}
