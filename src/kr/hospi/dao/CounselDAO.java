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
	   
	   public boolean removecNO(String cNO){
		   try {
			   int t = sqlMap.update("counsel.removecNO",cNO);
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
		   System.out.println("DAO::selectAll");
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
	         List<Counsel> searchlist = null;
	            
	            try {
	               searchlist = (List<Counsel>)sqlMap.queryForList("counsel.selectName",search_name);
	            } catch (SQLException e) {
	               e.printStackTrace();
	            }
	            return searchlist;
	      }

	   //=====================페이징작업 시작
	   public List<Counsel> selectPage(int page, int recordCount){//list에 출력할 데이터
		    int end = page*recordCount;//page = 1, recordCount(한 페이지 행 갯수) = 5 ==> int end = 5;
		    int start = end-(recordCount-1);// end=5, recordCount = 5 ==> int start = 5-(5-1) = 1;
		   
		   /*    page    start     end
		      1페이지 :    1       10
		      2페이지 :   11       20
		      3페이지 :   21       30
		      4페이지 :   31       40
		               end-9    page*10	      */
		    
		   List<Counsel> list=null;
		   try {
			   Map<String, Integer> map = new HashMap<>();
			      map.put("start", start); //start = 1
			      map.put("end", end); // end = 5      
			      
			   list = sqlMap.queryForList("counsel.selectPage", map);
		   } catch (SQLException e) {
			   e.printStackTrace();
		   }	  
		   return list;
	   }//selectPage
	   
	   public int selectCount(){
		  int count=0; 
		   try {
			count = (Integer)sqlMap.queryForObject("counsel.selectCount");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		  return count;
	   
	   }
	   
		   //=====================페이징작업 끝


	//========== 상담 관리자 시작 : KJK ==========
	/* 전체 상담 목록 */
	public List<Counsel> selCounAll() {
		List<Counsel> list = null;
		try {
			list = sqlMap.queryForList("ad_coun.selCounAll");
			//list.get("eDate").toString().replaceAll("\\.\\d+", "")); Time
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//selCounAll

	/* 상담 정보 표시 */
	public List<Counsel> selCounInfo(String cNO) {
		List<Counsel> list = null;
		try {
			list = (List<Counsel>) sqlMap.queryForList("ad_coun.selCounInfo",cNO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//selCounInfo

	/* 상담 정보 수정 */
	public boolean updCounInfo(Counsel counsel) {
		try {
			int t = sqlMap.update("ad_coun.updCounInfo",counsel);
			if(t==1) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}//updCounInfo

	/* 상담 답변 등록 */
	public boolean updCounComent(Counsel counsel) {
		try {
			int t = sqlMap.update("ad_coun.updCounComent",counsel);
			if(t==1) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}//updCounComent
	//========== 상담 관리자 종료 : KJK ==========
}
