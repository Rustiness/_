package kr.hospi.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
			//System.out.println("successInsertpItem");
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
			//System.out.println("It has succeeded to download");
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
			//System.out.println("It has succeeded to update");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pitem;
	}//PlasticItem
	
	 public List<PlasticItem> selectPage(int page, int recordCount){//list에 출력할 데이터
		    int end = page*recordCount;//page = 1, recordCount(한 페이지 행 갯수) = 5 ==> int end = 5;
		    int start = end-(recordCount-1);// end=5, recordCount = 5 ==> int start = 5-(5-1) = 1;
		   
		   /*    page    start     end
		      1페이지 :    1       10
		      2페이지 :   11       20
		      3페이지 :   21       30
		      4페이지 :   31       40
		               end-9    page*10	      */
		    
		   List<PlasticItem> list=null;
		   try {
			   Map<String, Integer> map = new HashMap<>();
			      map.put("start", start); //start = 1
			      map.put("end", end); // end = 5      
			      
			   list = sqlMap.queryForList("plastic.selectPage", map);
		   } catch (SQLException e) {
			   e.printStackTrace();
		   }	  
		   return list;
	   }//selectPage
	   
	   public int selectCount(){
		  int count=0; 
		   try {
			count = (Integer)sqlMap.queryForObject("plastic.selectCount");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		  return count;
	   
	   }
}
