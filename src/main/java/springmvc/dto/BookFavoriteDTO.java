package springmvc.dto;

import springmvc.entity.BaseEntity;

public class BookFavoriteDTO extends BaseEntity{
	private Long bookId;
	private Long userId;
	private String message;
	private int count;
	private String bookIMG1;
	private String bookName;
	private double bookPrice;
	private String bookCategory;
	private Long id;
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Long getBookId() {
		return bookId;
	}
	public void setBookId(Long bookId) {
		this.bookId = bookId;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getBookIMG1() {
		return bookIMG1;
	}
	public void setBookIMG1(String bookIMG1) {
		this.bookIMG1 = bookIMG1;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	
	public String getBookCategory() {
		return bookCategory;
	}
	public void setBookCategory(String bookCategory) {
		this.bookCategory = bookCategory;
	}
	public double getBookPrice() {
		return bookPrice;
	}
	public void setBookPrice(double bookPrice) {
		this.bookPrice = bookPrice;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	
}
