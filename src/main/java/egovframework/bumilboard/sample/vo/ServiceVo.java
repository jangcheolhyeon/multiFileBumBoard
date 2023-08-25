package egovframework.bumilboard.sample.vo;

public class ServiceVo {
	int service_number;
	String service_name;
	
	
	public int getService_number() {
		return service_number;
	}
	public void setService_number(int service_number) {
		this.service_number = service_number;
	}
	public String getService_name() {
		return service_name;
	}
	public void setService_name(String service_name) {
		this.service_name = service_name;
	}
	
	@Override
	public String toString() {
		return "ServiceVo [service_number=" + service_number + ", service_name=" + service_name + "]";
	}
	


}
