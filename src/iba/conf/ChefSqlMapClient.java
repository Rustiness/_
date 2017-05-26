package iba.conf;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

/**
 * Created by ${Kosta} on ${2017-05-23}.
 */
public class ChefSqlMapClient {
	/*
	   sqlMapConfig.xml(sql문을 포함한 XML등록)문서를 객체화 시켜주는 클래스

		   ★SqlMapClient클래스: XML에 작성된 sql문을 호출.
	 */
	private static final SqlMapClient sqlMap;
	static{
		try {
			String resource = "./iba/conf/sqlMapConfig.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMap = SqlMapClientBuilder.buildSqlMapClient(reader);
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException("ChefSqlMapConfig 초기화 중 에러 : " + e);
		}
	}//static

	public static SqlMapClient getSqlMapInstance(){
		return sqlMap;
	}
}