package kr.hospi.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import iba.conf.ChefSqlMapClient;
import kr.hospi.beans.AdMember;
import kr.hospi.beans.Member;

/**
 * Created by ${Kosta} on ${2017-05-15}.
 */
public class MemberDAO {
	SqlMapClient sqlMap;

	public MemberDAO() {
		sqlMap = new ChefSqlMapClient().getSqlMapInstance();
	}

	public boolean insert(Member mem) {// 계정추가
		try {
			sqlMap.insert("member.insert", mem);// sql문실행.
			return true;
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return false;// 수정실패
	}

	public boolean update(Member mem) {// 회원정보수정, 패러미터는 회원가입정보가 저장된 빈(joinInfo)
		try {

			int t = sqlMap.update("member.update", mem);//// sql문실행
			if (t == 1)
				return true;// 성공하면 true,
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return false;// 실패하면 false리턴.
	}

	public boolean delete(String mID) {// 회원정보 삭제
		try {

			int t = sqlMap.delete("member.delete", mID);// sql명령문 실행.
			if (t == 1)
				return true;// 성공하면 true,
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return false;// 실패하면 false리턴.
	}

	public Member select(Member mem) {// 한명의 회원가입정보(회원가입 페이지에 뿌릴 것) 조회

		Member mem_result = null;
		try {

			mem_result = (Member) sqlMap.queryForObject("member.select", mem);
			// sql명령문 실행.

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return mem_result;// 회원가입정보(joinInfo) 리턴
	}

	//관리자
	/* 전체 회원 목록 */
	public List<AdMember> selectAll() {
		List<AdMember> list = null;
		try {
			list = sqlMap.queryForList("ad_member.selectAll");
			// sql문 실행 + 모든 회원 정보를 list 리스트에 저장.
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;// 회원정보가 저장된 list 리턴.
	}//selectAll

	/* 회원 정보 표시*/
	public List<AdMember> selMemInfo(String mNO) {
		List<AdMember> list = null;
		try {
			list = (List<AdMember>) sqlMap.queryForList("ad_member.selMemInfo",mNO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//selMemInfo

	/* 회원 정보 수정 */
	public boolean updMemInfo(AdMember member) {
		try {
			int t = sqlMap.update("ad_member.updMemInfo",member);
			if(t==1) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}//updMemInfo
}
