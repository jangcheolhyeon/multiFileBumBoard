package egovframework.bumilboard.sample.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egovframework.bumilboard.sample.vo.AnswerVo;

@Repository
public class AnswerDao {
	@Autowired
	SqlSession session;
	
	String namespace = "egovframework.bumilboard.sample.vo.AnswerVo.";
	
	public AnswerVo getAnswerOne(Integer board_id) {
		return session.selectOne(namespace + "selectBoardAnswer", board_id);
	}
	
	public int getMaxNum() {
		return session.selectOne(namespace + "maxAnswerId");
	}
	
	public int writeAnswer(AnswerVo answerVo) {
		return session.insert(namespace + "writeAnswer", answerVo);
	}
	
	public int deleteAnswer(int board_id) {
		return session.delete(namespace + "deleteAnswer", board_id);
	}
	
	public int updateAnswer(AnswerVo answerVo) {
		return session.update(namespace + "updateAnswer", answerVo);
	}
}
