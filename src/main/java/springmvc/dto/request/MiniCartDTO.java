package springmvc.dto.request;

public class MiniCartDTO {
	private String name;
	private int amount;
	private double price;
	private long id;
	private double amountTotal;
	private long bookId;
	private double subTotal;
	private String img1;
	
	
	
	
	public long getBookId() {
		return bookId;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public void setBookId(long bookId) {
		this.bookId = bookId;
	}
	public double getAmountTotal() {
		return amountTotal;
	}
	public void setAmountTotal(double amountTotal) {
		this.amountTotal = amountTotal;
	}
	public double getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(double subTotal) {
		this.subTotal = subTotal;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	
	

}
