package egovframework.bumilboard.sample.vo;

public class adminAccountVo {
	String id;
	String password;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "UserVo [id=" + id + ", password=" + password + "]";
	}
	
	
	
}
