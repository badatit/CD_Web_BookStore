package springmvc.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "cart")
public class CartEntity extends BaseEntity {

	@Column(name = "amount")
	private Integer amount;
	
	@Column(name = "checkorder")
	private boolean checkOrder;
	
//	@ManyToMany(fetch = FetchType.LAZY)
//	@JoinTable(name = "cart_book", joinColumns = @JoinColumn(name = "cartid"), inverseJoinColumns = @JoinColumn(name = "bookid"))
//	private List<BookEntity> bookEntities  = new ArrayList<>();

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="bookid")
	private BookEntity bookEntity;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="userid")
	private UserEntity userEntity;
	
	

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

	public BookEntity getBookEntity() {
		return bookEntity;
	}

	public void setBookEntity(BookEntity bookEntity) {
		this.bookEntity = bookEntity;
	}
	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}

	
	
	
	
}
