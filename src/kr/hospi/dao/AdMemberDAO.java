package kr.hospi.dao;

import com.ibatis.sqlmap.client.SqlMapClient;
import iba.conf.ChefSqlMapClient;
import kr.hospi.beans.Member;

import java.sql.SQLException;
import java.util.List;

/**
 * Created
 * User: KJK
 * Date: 2017-06-09
 * Time: 오전 5:56
 * Page: 관리자 DAO
 */
public class AdMemberDAO {
	SqlMapClient sqlMap;

	public AdMemberDAO() {
		sqlMap = ChefSqlMapClient.getSqlMapInstance();
	}

	/* 전체 회원 목록 */
	public List<Member> selectAll() {
		List<Member> list = null;
		try {
			list = (List<Member>) sqlMap.queryForList("ad_member.selectAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//selectAll

	/* 회원 정보 표시*/
	public List<Member> selMemInfo(String mNO) {
		List<Member> list = null;
		try {
			list = (List<Member>) sqlMap.queryForList("ad_member.selMemInfo", mNO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//selMemInfo

	/* 회원 정보 수정 */
	public boolean updMemInfo(Member member) {
		try {
			int t = sqlMap.update("ad_member.updMemInfo", member);
			if (t == 1) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}//updMemInfo


}
