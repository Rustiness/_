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
 * Time: ���� 09:20
 */
public class EmployeeDAO {
	SqlMapClient sqlMap;

	public EmployeeDAO() {
		sqlMap = ChefSqlMapClient.getSqlMapInstance();
	}//������

	public List<Employee> selectAll() {//��ü ���� ����Ʈ
		List<Employee> list = null;
		try {
			list = sqlMap.queryForList("emp.selectAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//selectAll

}
