package springmvc.dto;

import springmvc.entity.BaseEntity;

public class BookFavoriteDTO extends BaseEntity{
	private Long bookId;
	private Long userId;
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
	
}
