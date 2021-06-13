package springmvc.Enums;

public enum StatusEnum {
	Active("active"),
	Inactive("inactive");


	private final String statusValue;
	StatusEnum(String statusValue) {
		this.statusValue = statusValue;
	}
	
	
	public String getStatusValue() {
		return statusValue;
	}	
}
