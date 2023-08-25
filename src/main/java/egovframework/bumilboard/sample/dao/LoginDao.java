package egovframework.bumilboard.sample.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDao {
	
	@Autowired
	SqlSession session;
	
	String namespace = "egovframework.bumilboard.sample.vo.adminAccountVo.";
	
	public int loginCheck(String password) {
		return session.selectOne(namespace + "adminLoginCheck", password);
	}
	
	
}
