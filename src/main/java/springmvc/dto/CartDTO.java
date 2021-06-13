package springmvc.dto;

public class CartDTO extends AbstractDTO {

	private Long userId;
	private Long bookId;
	private Integer sizeCart;
	private Double amountTotal;
	private Integer amount;
	private boolean checkOrder;
	private Long id;
	private double subTotal;
	private boolean checkBookInCartPage;
	
	
	
	
	public double getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(double subTotal) {
		this.subTotal = subTotal;
	}

	public boolean isCheckBookInCartPage() {
		return checkBookInCartPage;
	}

	public void setCheckBookInCartPage(boolean checkBookInCartPage) {
		this.checkBookInCartPage = checkBookInCartPage;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public boolean isCheckOrder() {
		return checkOrder;
	}

	public void setCheckOrder(boolean checkOrder) {
		this.checkOrder = checkOrder;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getBookId() {
		return bookId;
	}

	public void setBookId(Long bookId) {
		this.bookId = bookId;
	}

	public Integer getSizeCart() {
		return sizeCart;
	}

	public void setSizeCart(Integer sizeCart) {
		this.sizeCart = sizeCart;
	}

	public Double getAmountTotal() {
		return amountTotal;
	}

	public void setAmountTotal(Double amountTotal) {
		this.amountTotal = amountTotal;
	}

	
}
