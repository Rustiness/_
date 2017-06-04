package kr.hospi.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import iba.conf.ChefSqlMapClient;
import kr.hospi.beans.Counsel;

public class CounselDAO {
	
	   SqlMapClient sqlMap;	
		
	   public CounselDAO() {
		   sqlMap = ChefSqlMapClient.getSqlMapInstance();
	   }
	   
	   public boolean insert(Counsel bean){
		 try {
			sqlMap.insert("counsel.insert",bean);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return false;
	   }//insert
	   
	   public boolean update(Counsel bean){
		 try {
			int t = sqlMap.update("counsel.update",bean);
			 if(t==1)return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return false;  
	   }//update
	   
	   public boolean delete(String cNO){
		 try {
			int t = sqlMap.delete("counsel.delete",cNO);
			 if(t==1) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return false;  
	   }//delete
	  
	   
	   public Counsel select(String cNO){
		 Counsel bean=null;
		try {
             bean = (Counsel) sqlMap.queryForObject("counsel.select",cNO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return bean;
	   }//select
	   
	   public List<Counsel> selectAll(){//list에 출력할 데이터
		  List<Counsel> list=null;
		try {
			list = sqlMap.queryForList("counsel.selectAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}	  
		  return list;
	   }//selectAll
	   
	   public boolean hitUpdate(Counsel bean){//조회수 수정
		   try {
			   int t = sqlMap.update("counsel.hitUpdate",bean);
			   if(t==1)return true;
		   } catch (SQLException e) {
			   e.printStackTrace();
		   }
		   return false;  
	   }//update
	   
	   public List<Counsel> selectName(String search_name){//특정 행 이름 검색 행 출력
	         List<Counsel> list2 = null;
	            
	            try {
	               list2 = (List<Counsel>)sqlMap.queryForList("counsel.selectName",search_name);
	            } catch (SQLException e) {
	               e.printStackTrace();
	            }
	            return list2;
	      }

	   //=====================페이징작업 시작
	   public List<Counsel> counPage(int rCurrentPage, int rPageSize){
	         int end = rCurrentPage*rPageSize;
	         int start = end-(rPageSize-1);
	         List<Counsel> list = null;
	         try {
	            Map<String, Integer> map = new HashMap<>();
	               map.put("start", start);
	               map.put("end", end);
	            list = (List<Counsel>)sqlMap.queryForList("counsel.counPage",map);
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	         return list;
	      }//reserPage
	         
	      public int counCount(){
	         int rcount=0;
	         try {
	            rcount = (Integer)sqlMap.queryForObject("counsel.counCount");
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	         return rcount;
	      }//reserCount
	   
		   //=====================페이징작업 끝    
}
