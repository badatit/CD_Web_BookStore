package springmvc.Enums;

public enum OrderStatusEnum {
	
	Chưa_Nhận_Hàng("Chưa Nhận Hàng"),
	Đã_Nhận_Hàng("Đã Nhận Hàng");
	
	private final String orderStatus;
	
	 OrderStatusEnum(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getOrderStatus() {
		return orderStatus;
	}
	 
}
