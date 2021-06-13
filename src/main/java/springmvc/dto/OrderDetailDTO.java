package springmvc.dto;

public class OrderDetailDTO extends AbstractDTO {

	private int amount;

	private double price;
	
	private String[] cartIds ;
	private double total ;
	private Long orderId;
	
	

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String[] getCartIds() {
		return cartIds;
	}

	public void setCartIds(String[] cartIds) {
		this.cartIds = cartIds;
	}
	
	
}
