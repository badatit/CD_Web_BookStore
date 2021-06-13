package springmvc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "orderdetail")
public class OrderDetailEntity extends BaseEntity {

	@Column(name = "amount")
	private int amount;
	
	@Column(name = "price")
	private double price;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="orderid")
	private OrderEntity orderEntity;
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="bookid")
	private BookEntity bookEntity;


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


	public OrderEntity getOrderEntity() {
		return orderEntity;
	}


	public void setOrderEntity(OrderEntity orderEntity) {
		this.orderEntity = orderEntity;
	}


	public BookEntity getBookEntity() {
		return bookEntity;
	}


	public void setBookEntity(BookEntity bookEntity) {
		this.bookEntity = bookEntity;
	}
	
	
}
