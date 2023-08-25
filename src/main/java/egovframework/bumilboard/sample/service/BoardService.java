package egovframework.bumilboard.sample.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.bumilboard.sample.dao.AnswerDao;
import egovframework.bumilboard.sample.dao.BoardDao;
import egovframework.bumilboard.sample.vo.BoardVo;
import egovframework.bumilboard.sample.vo.ServiceVo;
import egovframework.bumilboard.sample.vo.SideBoardVo;
import egovframework.bumilboard.sample.vo.TypeVo;
import egovframework.bumilboard.sample.vo.fileVo;

@Service
public class BoardService {
	
	@Autowired
	BoardDao boardDao;
	
	@Autowired
	AnswerDao answerDao;
	
	public BoardVo getBoardOne(Integer board_id) {
		return boardDao.getBoardOne(board_id);
	}
	
	public List<fileVo> getFilesInBoard(Integer board_id) {
		return boardDao.getFilesInBoard(board_id);
	}
	
	public int insertBoard(BoardVo boardVo) {
		return boardDao.insertBoard(boardVo);
	}
	
	public int insertFile(Map map) {
		System.out.println("insertFiles");
		System.out.println(map);
		return boardDao.insertFile(map);
	}
	
	// board page부분
	public List<BoardVo> selectBoardList(Map map){
		return boardDao.selectBoardList(map);
	}
	
	public int selectBoardListCnt() {
		return boardDao.selectBoardListCnt();
	}
	
	//sideBoard
	public SideBoardVo selectSideBoards(int board_id){
		return boardDao.selectSideBoards(board_id);
	}
	
	public int increaseViewCount(int board_id) {
		return boardDao.increaseViewCount(board_id);
	}
	
	//deelteBoard
	@Transactional
	public int deleteBoard(int board_id, String password) {
		Map map = new HashMap();
		map.put("board_id", board_id);
		map.put("password", password);
		
		answerDao.deleteAnswer(board_id);
		boardDao.deleteBoardFiles(board_id);
		return boardDao.deleteBoard(map);
	}
	
	//updateBoard
	@Transactional
	public int updateBoard(BoardVo boardVo) {
		return boardDao.updateBoard(boardVo);
	}
	
	//삭제할 파일정보들 upload에도 제거해야하니까 이름들 가져오기
	public List<fileVo> deleteBoardFilesUpload(int board_id){
		return boardDao.deleteBoardFilesUpload(board_id);
	}
	
	//파일 db에 저장된 파일정보를 삭제(이름과 board_id를 통해서 선택 삭제)
	public int deleteBoardFile(Map map) {
		return boardDao.deleteBoardFile(map);
	}
	
	//서비스 종류 가져오기
	public List<ServiceVo> getServiceList(){
		return boardDao.getServiceList();
	}
	
	
	//getServiceType
	public List<TypeVo> getType1List() {
		return boardDao.getType1List();
	}
	
	public List<TypeVo> getType2List(String pk_code){
		return boardDao.getType2List(pk_code);
	}
	
	@Transactional
	public int getSeqNumber() {
		boardDao.updateSeqNumber();
		return boardDao.getSeqNumber();
	}
	
	//게시글당 비밀번호 가져오기
	public String getBoardPassword(int board_id) {
		return boardDao.getBoardPassword(board_id);
	}

	
	
}
