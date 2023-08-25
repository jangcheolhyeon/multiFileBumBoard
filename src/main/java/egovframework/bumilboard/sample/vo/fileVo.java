package egovframework.bumilboard.sample.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class fileVo {
	int board_id;
	String file_name;
	Date reg_date;
	int file_order;
	int file_size;
	String original_file_name;
	String file_ext;
	MultipartFile uploadFile;
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getFile_order() {
		return file_order;
	}
	public void setFile_order(int file_order) {
		this.file_order = file_order;
	}
	public int getFile_size() {
		return file_size;
	}
	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}
	public String getOriginal_file_name() {
		return original_file_name;
	}
	public void setOriginal_file_name(String original_file_name) {
		this.original_file_name = original_file_name;
	}
	public String getFile_ext() {
		return file_ext;
	}
	public void setFile_ext(String file_ext) {
		this.file_ext = file_ext;
	}
	@Override
	public String toString() {
		return "fileVo [board_id=" + board_id + ", file_name=" + file_name + ", reg_date=" + reg_date + ", file_order="
				+ file_order + ", file_size=" + file_size + ", original_file_name=" + original_file_name + ", file_ext="
				+ file_ext + ", uploadFile=" + uploadFile + "]";
	}

	

	
}
