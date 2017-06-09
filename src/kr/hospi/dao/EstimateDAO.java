/*Writer : minhaskim 
 * Date : 20170527
 *sqlMap DB
 *selectAll() , insert()
 * 
 * */
package kr.hospi.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;


import iba.conf.ChefSqlMapClient;
import kr.hospi.beans.Estimate;
import kr.hospi.beans.PlasticItem;
import kr.hospi.forms.EstiClientActionForm;

public class EstimateDAO {// 
	
	
	SqlMapClient sqlMap;
		
	
	public EstimateDAO() {
		sqlMap=ChefSqlMapClient.getSqlMapInstance();
	}
	
	public boolean insert(Estimate estimate) {//insert data
		try {
			sqlMap.insert("estimate.insertEstimate", estimate);
			
			
			return true;
		} catch (SQLException e) {
			
			e.printStackTrace();
		}//try-catch
		return false;
	}//insert
	
/*
*/	
	public boolean update(Estimate estimate) {//update data
		try {
			sqlMap.insert("estimate.update", estimate);
			System.out.println("successUpdate");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}//try-catch
		return false;
	}//update
	
	public Estimate selectEstimate(String pNO ){
		Estimate esti= null;
		try {
			esti=(Estimate) sqlMap.queryForObject("estimate.selectEstimate", pNO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return esti;
		
	}//selectEstimate
	
	public String selectpNO (String mID){
		String pNO= null;
		try {
			pNO=(String) sqlMap.queryForObject("estimate.selectpNO", mID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pNO;
	}//mid
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
	

	public ArrayList<PlasticItem> selectType(String pTypeNO){
		ArrayList<PlasticItem> list= null;
		try {
		 list= (ArrayList<PlasticItem>) sqlMap.queryForList("estimate.selectType", pTypeNO);
			System.out.println("selectType:"+list.get(0));
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		  return list;
	}//selectType fixed
	
	public List<String> selectpTypeName(){
	List<String> list= null;
	try {
		list= sqlMap.queryForList("estimate.selectpTypeName");
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	
	return list;
	}//selectpTypeName
	public List<String> selectpItemName(String pTypeName){
		List<String> list= null;
		
	try {
		list =sqlMap.queryForList("estimate.selectpItemName", pTypeName);
	} catch (SQLException e) {
		
		e.printStackTrace();
	}	
	return list;
	}//selectpItemName
	
	public List<Estimate> selectPage(int page, int recordCount){//list
	    int end = page*recordCount;//page = 1, recordCount() = 5 ==> int end = 5;
	    int start = end-(recordCount-1);// end=5, recordCount = 5 ==> int start = 5-(5-1) = 1;
	   
	   /*    page    start     end
	      1page :    1       10
	      2page  :   11       20
	      3page  :   21       30
	      4page  :   31       40
	               end-9    page*10	      */
	    
	   List<Estimate> list=null;
	   try {
		   Map<String, Integer> map = new HashMap<>();
		      map.put("start", start); //start = 1
		      map.put("end", end); // end = 5      
		      
		   list = sqlMap.queryForList("estimate.selectPage", map);
	   } catch (SQLException e) {
		   e.printStackTrace();
	   }	  
	   return list;
   }//selectPage
   
   public int selectCount(){
	  int count=0; 
	   try {
		count = (Integer)sqlMap.queryForObject("estimate.selectCount");
	} catch (SQLException e) {
		e.printStackTrace();
	}
	  return count;
   
   }
}
