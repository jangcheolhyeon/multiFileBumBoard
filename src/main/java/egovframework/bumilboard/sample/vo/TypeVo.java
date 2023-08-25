package egovframework.bumilboard.sample.vo;

public class TypeVo {
	String pk_code;
	String parent_code;
	String code_name;
	
	public String getPk_code() {
		return pk_code;
	}
	public void setPk_code(String pk_code) {
		this.pk_code = pk_code;
	}
	public String getParent_code() {
		return parent_code;
	}
	public void setParent_code(String parent_code) {
		this.parent_code = parent_code;
	}
	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
	@Override
	public String toString() {
		return "TypeVo [pk_code=" + pk_code + ", parent_code=" + parent_code + ", code_name=" + code_name + "]";
	}
	
	
}
