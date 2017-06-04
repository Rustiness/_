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

	public List<Employee> selectAll() {//전체 직원 리스트
		List<Employee> list = null;
		try {
			list = (List<Employee>) sqlMap.queryForList("emp.selectAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//selectAll

	public List<Employee> selEmpInfo(String eNO) {//직원 정보
		List<Employee> list = null;
		try {
			list = (List<Employee>) sqlMap.queryForList("emp.selEmpInfo",eNO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//selEmpInfo

	public List<Employee> updEmpInfo(Employee employee) {//직원 정보 수정
		List<Employee> list = null;
		try {
			list = (List<Employee>) sqlMap.queryForList("emp.updEmpInfo",employee);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//updEmpInfo
}