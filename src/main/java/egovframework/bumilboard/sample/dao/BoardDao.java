package egovframework.bumilboard.sample.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egovframework.bumilboard.sample.vo.BoardVo;
import egovframework.bumilboard.sample.vo.ServiceVo;
import egovframework.bumilboard.sample.vo.SideBoardVo;
import egovframework.bumilboard.sample.vo.TypeVo;
import egovframework.bumilboard.sample.vo.fileVo;

@Repository
public class BoardDao {
	@Autowired
	SqlSession session;
	
	String namespace = "egovframework.bumilboard.sample.vo.boardVo.";
	
	
	// 게시판 가져오기
	public BoardVo getBoardOne(Integer board_id) {
		return session.selectOne(namespace + "selectBoard", board_id);
	}
	// 파일 가져오기
	public List<fileVo> getFilesInBoard(Integer board_id) {
		return session.selectList(namespace + "getFilesInBoard", board_id);
	}
	
	
	public int insertBoard(BoardVo boardVo) {
		return session.insert(namespace + "insertBoard", boardVo);
	}
	
	public int insertFile(Map map) {
		System.out.println("inserTfile Dao");
		return session.insert(namespace + "insertFiles", map);
	}
	
	// board page부분
	public List<BoardVo> selectBoardList(Map map){
		return session.selectList(namespace + "selectBoardList", map);
	}
	
	public int selectBoardListCnt() {
		return session.selectOne(namespace + "selectBoardListCnt");
	}
	
	//sideBoard
	public SideBoardVo selectSideBoards(int board_id){
		return session.selectOne(namespace + "selectSideBoards", board_id);
	}
	
	public int updateAnswerState(Map map) {
		return	session.update(namespace + "updateAnswerState", map);
	}
	
	
	public int increaseViewCount(int board_id) {
		return session.update(namespace + "increaseViewCount", board_id);
	}
	
	//게시판 삭제
	public int deleteBoard(Map map) {
		return session.delete(namespace + "deleteBoard", map);
	}
	
	//파일 db에 저장된 파일정보들 삭제
	public int deleteBoardFiles(int board_id) {
		return session.delete(namespace + "deleteBoardFiles", board_id);
	}
	
	//파일 db에 저장된 파일정보를 삭제(이름과 board_id를 통해서 선택 삭제)
	public int deleteBoardFile(Map map) {
		return session.delete(namespace + "deleteBoardFile", map);
	}
	
	//upload에 삭제할때 파일db에서 파일 names 가져오기
	public List<fileVo> deleteBoardFilesUpload(int board_id){
		return session.selectList(namespace + "deleteBoardFilesUpload", board_id);
	}
	
	//서비스 드롭박스 종류
	public List<ServiceVo> getServiceList(){
		return session.selectList(namespace + "getServiceList");
	}
	
	//타입1 드롭박스 종류
	public List<TypeVo> getType1List(){
		return session.selectList(namespace + "getType1List");
	}
	
	//타입2 드롭박스 종류
	public List<TypeVo> getType2List(String pk_code){
		return session.selectList(namespace + "getType2List", pk_code);
	}
	
	public int getSeqNumber() {
		return session.selectOne(namespace + "getSeq");
	}
	
	public int updateSeqNumber() {
		return session.update(namespace + "updateSeq");
	}
	
	//글에 대해 비밀번호 가져오기
	public String getBoardPassword(int board_id) {
		return session.selectOne(namespace + "getBoardPassword", board_id);
	}
	
	
	public int updateBoard(BoardVo boardVo) {
		return session.update(namespace + "updateBoard", boardVo);
	}
	
	
}

