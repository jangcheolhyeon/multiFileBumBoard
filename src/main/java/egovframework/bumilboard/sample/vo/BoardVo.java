package egovframework.bumilboard.sample.vo;

import java.util.Date;

public class BoardVo {
	Integer board_row;
	Integer board_id;
	String title;
	String content;
	String writer;
	String writer_phone;
	String service;
	String type1;
	String type2;
	int agree;
	int view_count;
	int comment_state;
	Date reg_date;
	String board_password;
	
	
	public Integer getBoard_row() {
		return board_row;
	}
	public void setBoard_row(Integer board_row) {
		this.board_row = board_row;
	}
	public Integer getBoard_id() {
		return board_id;
	}
	public void setBoard_id(Integer board_id) {
		this.board_id = board_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWriter_phone() {
		return writer_phone;
	}
	public void setWriter_phone(String writer_phone) {
		this.writer_phone = writer_phone;
	}
	public String getService() {
		return service;
	}
	public void setService(String service) {
		this.service = service;
	}
	public String getType1() {
		return type1;
	}
	public void setType1(String type1) {
		this.type1 = type1;
	}
	public String getType2() {
		return type2;
	}
	public void setType2(String type2) {
		this.type2 = type2;
	}

	public int getAgree() {
		return agree;
	}
	public void setAgree(int agree) {
		this.agree = agree;
	}
	public int getComment_state() {
		return comment_state;
	}
	public void setComment_state(int comment_state) {
		this.comment_state = comment_state;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	

	public String getBoard_password() {
		return board_password;
	}
	public void setBoard_password(String board_password) {
		this.board_password = board_password;
	}
	
	
	
	@Override
	public String toString() {
		return "BoardVo [board_row=" + board_row + ", board_id=" + board_id + ", title=" + title + ", content="
				+ content + ", writer=" + writer + ", writer_phone=" + writer_phone + ", service=" + service
				+ ", type1=" + type1 + ", type2=" + type2 + ", agree=" + agree + ", view_count=" + view_count
				+ ", comment_state=" + comment_state + ", reg_date=" + reg_date + "]";
	}
	

	
	
}
