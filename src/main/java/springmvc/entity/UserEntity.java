package springmvc.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class UserEntity extends BaseEntity {

	@Column(name = "username")
	private String userName;

	@Column(name = "password")
	private String password;

	@Column(name = "fullname")
	private String fullName;

	@Column(name = "status")
	private String status;

	@Column(name = "phonenumber")
	private String phoneNumber;

	@Column(name = "address")
	private String address;

	@Column(name = "email")
	private String email;

	@Column(name = "birthday")
	private Date birthDay;

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "userid"), inverseJoinColumns = @JoinColumn(name = "roleid"))
	private List<RoleEntity> roles = new ArrayList<>();

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private List<OrderEntity> orders = new ArrayList<>();

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private List<BookFavoriteEntity> bookFavoriteEntities = new ArrayList<>();
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "userEntity")
	private List<CartEntity> cartEntities =new ArrayList<>();

	public List<OrderEntity> getOrders() {
		return orders;
	}

	public void setOrders(List<OrderEntity> orders) {
		this.orders = orders;
	}

	public List<RoleEntity> getRoles() {
		return roles;
	}

	public void setRoles(List<RoleEntity> roles) {
		this.roles = roles;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
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

	public Date getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}

	public List<BookFavoriteEntity> getBookFavoriteEntities() {
		return bookFavoriteEntities;
	}

	public void setBookFavoriteEntities(List<BookFavoriteEntity> bookFavoriteEntities) {
		this.bookFavoriteEntities = bookFavoriteEntities;
	}

	public List<CartEntity> getCartEntities() {
		return cartEntities;
	}

	public void setCartEntities(List<CartEntity> cartEntities) {
		this.cartEntities = cartEntities;
	}

}
