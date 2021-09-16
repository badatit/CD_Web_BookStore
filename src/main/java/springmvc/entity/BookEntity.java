package springmvc.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "book")
public class BookEntity extends BaseEntity {
	
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "price")
	private double price;
	
	@Column(name = "productionday")
	private String productionDay;
	
	@Column(name = "issuingcompany")
	private String issuingCompany;
	
	@Column(name = "size")
	private String size;
	
	@Column(name = "covertype")
	private String coverType;
	
	@Column(name = "numberofpages")
	private Long numberOfPages;
	
	@Column(name = "sku")
	private String sku;
	
	@Column(name = "productdescription",length = 512)
	private String productDescription;
	
	@Column(name = "img1")
	private String img1;
	
	@Column(name = "img2")
	private String img2;

	@Column(name = "img3")
	private String img3;
	
	@Column(name = "img4")
	private String img4;
	
	@Column(name ="quantity")
	private int quantity;
	
	
	@ManyToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL)
	@JoinColumn(name="categoryid")
	private CategoryEntity category;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "bookEntity")
	private List<CartEntity> cartEntities =new ArrayList<>();
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "bookEntity")
	private List<OrderDetailEntity> orderDetailEntities =new ArrayList<>();
//	@ManyToMany(fetch = FetchType.LAZY)
//	@JoinTable(name = "order_book",joinColumns = @JoinColumn(name = "bookid"),
//									inverseJoinColumns = @JoinColumn(name = "orderid"))
//	private List<OrderEntity> orderEntities = new ArrayList<>();
	
	
//	@ManyToMany(mappedBy = "bookEntities")
//	private List<CartEntity> cartEntities = new ArrayList<>();
//	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "bookEntity")
	private List<BookFavoriteEntity> bookFavoriteEntities = new ArrayList<>();
	
	
	public List<OrderDetailEntity> getOrderDetailEntities() {
		return orderDetailEntities;
	}

	public void setOrderDetailEntities(List<OrderDetailEntity> orderDetailEntities) {
		this.orderDetailEntities = orderDetailEntities;
	}

	public List<BookFavoriteEntity> getBookFavoriteEntities() {
		return bookFavoriteEntities;
	}

	public void setBookFavoriteEntities(List<BookFavoriteEntity> bookFavoriteEntities) {
		this.bookFavoriteEntities = bookFavoriteEntities;
	}

	@Column(name = "status")
	private String status;
	
	

	public List<CartEntity> getCartEntities() {
		return cartEntities;
	}

	public void setCartEntities(List<CartEntity> cartEntities) {
		this.cartEntities = cartEntities;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getProductionDay() {
		return productionDay;
	}

	public void setProductionDay(String productionDay) {
		this.productionDay = productionDay;
	}

	public String getIssuingCompany() {
		return issuingCompany;
	}

	public void setIssuingCompany(String issuingCompany) {
		this.issuingCompany = issuingCompany;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getCoverType() {
		return coverType;
	}

	public void setCoverType(String coverType) {
		this.coverType = coverType;
	}

	public Long getNumberOfPages() {
		return numberOfPages;
	}

	public void setNumberOfPages(Long numberOfPages) {
		this.numberOfPages = numberOfPages;
	}

	

	public String getSku() {
		return sku;
	}

	public void setSku(String sku) {
		this.sku = sku;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	public String getImg3() {
		return img3;
	}

	public void setImg3(String img3) {
		this.img3 = img3;
	}

	public String getImg4() {
		return img4;
	}

	public void setImg4(String img4) {
		this.img4 = img4;
	}

	public CategoryEntity getCategory() {
		return category;
	}

	public void setCategory(CategoryEntity category) {
		this.category = category;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	
	
}
