package egovframework.bumilboard.sample.vo;

import java.util.Date;

public class AnswerVo {
	int answer_id;
	int board_id;
	String writer_id;
	Date reg_date;
	String content;
	
	public int getAnswer_id() {
		return answer_id;
	}
	public void setAnswer_id(int answer_id) {
		this.answer_id = answer_id;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "AnswerVo [answer_id=" + answer_id + ", board_id=" + board_id + ", writer_id=" + writer_id
				+ ", reg_date=" + reg_date + ", content=" + content + "]";
	}
	
	
	
	
	
	
}
