package springmvc.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name ="orders")
public class OrderEntity extends BaseEntity{

	@Column(name = "fullname")
	private String fullName ;
	
	
	@Column(name = "address")
	private String address;
	
	@Column(name ="email")
	private String email;
	
	@Column(name = "phonenumber")
	private String phoneNumber;
	
	@Column(name = "note")
	private String note;
	
	@Column(name ="total")
	private double total;
	
	@Column(name = "status")
	private String status;
	
	@Column(name = "shipping")
	private Double shipping;
	
	@Column(name = "orderdate")
	private Date orderDate;
	
	@Column(name = "amount")
	private int amount;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="usersid")
	private UserEntity user;

	@OneToMany(fetch = FetchType.LAZY,mappedBy = "orderEntity")
	private List<OrderDetailEntity> orderDetailEntities =new ArrayList<>();
	
	
	

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public List<OrderDetailEntity> getOrderDetailEntities() {
		return orderDetailEntities;
	}

	public void setOrderDetailEntities(List<OrderDetailEntity> orderDetailEntities) {
		this.orderDetailEntities = orderDetailEntities;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
		this.user = user;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


	public Double getShipping() {
		return shipping;
	}

	public void setShipping(Double shipping) {
		this.shipping = shipping;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}


	
	

	
	
	
	
}
