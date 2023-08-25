package egovframework.bumilboard.sample.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.bumilboard.sample.dao.AnswerDao;
import egovframework.bumilboard.sample.dao.BoardDao;
import egovframework.bumilboard.sample.vo.AnswerVo;

@Service
public class AnswerService {
	@Autowired
	AnswerDao answerDao;
	
	@Autowired
	BoardDao boardDao;
	
	
	public AnswerVo getAnswerOne(Integer board_id) {
		return answerDao.getAnswerOne(board_id);
	}
	
	public int getMaxNum() {
		return answerDao.getMaxNum();
	}
	
	@Transactional
	public int writeAnswer(AnswerVo answerVo) {
		Map map = new HashMap();
		map.put("board_id", answerVo.getBoard_id());
		map.put("state", true);
		
		boardDao.updateAnswerState(map);
		return answerDao.writeAnswer(answerVo);
	}
	
	@Transactional
	public int deleteAnswer(int board_id) {
		Map map = new HashMap();
		map.put("board_id", board_id);
		map.put("state", false);
		
		boardDao.updateAnswerState(map);
		return answerDao.deleteAnswer(board_id);
	}
	
	
	public int updateAnswer(AnswerVo answerVo) {
		return answerDao.updateAnswer(answerVo);
	}

	
	
}

