package kr.hospi.dao;

import com.ibatis.sqlmap.client.SqlMapClient;
import iba.conf.ChefSqlMapClient;
import kr.hospi.beans.Employee;

import java.sql.SQLException;
import java.util.List;

/**
 * Created
 * User: KJK
 * Date: 2017-05-30
 * Time: 오전 09:20
 */
public class EmployeeDAO {
	SqlMapClient sqlMap;

	public EmployeeDAO() {
		sqlMap = ChefSqlMapClient.getSqlMapInstance();
	}//생성자

	public List<Employee> selectAll() {//전체 사원 리스트
		List<Employee> list = null;
		try {
			list = (List<Employee>) sqlMap.queryForList("emp.selectAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//selectAll

	public List<Employee> selEmpInfo(String eNO) {//사원 정보
		List<Employee> list = null;
		try {
			list = (List<Employee>) sqlMap.queryForList("emp.selEmpInfo",eNO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//selEmpInfo

	public boolean updEmpInfo(Employee employee) {//사원 정보 수정
		try {
			int t = sqlMap.update("emp.updEmpInfo",employee);
			if(t==1) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}//updEmpInfo

	public boolean insEmpInfo(Employee employee) {//사원 정보 등록
		try {
			sqlMap.insert("emp.insEmpInfo",employee);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}//updEmpInfo
}