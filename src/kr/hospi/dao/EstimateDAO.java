/*Writer : minhaskim 
 * Date : 20170527
 *sqlMap DB
 *selectAll() , insert()
 * 
 * */
package kr.hospi.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.ibatis.sqlmap.client.SqlMapClient;


import iba.conf.ChefSqlMapClient;
import kr.hospi.beans.Estimate;

public class EstimateDAO {// 
	
	
	SqlMapClient sqlMap;
		
	
	public EstimateDAO() {
		sqlMap=ChefSqlMapClient.getSqlMapInstance();
	}
	
	public boolean insert(Estimate estivo) {//insert data
		try {
			sqlMap.insert("insertEsti", estivo);
			System.out.println("success");
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//try-catch
		return false;
	}//insert
	public ArrayList<Estimate> selectAll(){
		ArrayList<Estimate> list= null;
		try {
		 list= (ArrayList<Estimate>) sqlMap.queryForList("estimate.selectAll");
			System.out.println("listvalue:"+list.get(0));
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		  return list;
	}//selectAll
	public ArrayList<Estimate> selectType(String pTypeNO){
		ArrayList<Estimate> list= null;
		try {
		 list= (ArrayList<Estimate>) sqlMap.queryForList("estimate.selectType", pTypeNO);
			System.out.println("selectType:"+list.get(0));
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		  return list;
	}//selectType
}
