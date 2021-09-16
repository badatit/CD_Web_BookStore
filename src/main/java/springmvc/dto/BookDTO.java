package springmvc.dto;

public class BookDTO extends AbstractDTO {

	private String name;
	 double price;
	private String productionDay;
	private String issuingCompany;
	private String size;
	private String coverType;
	private Long numberOfPages;
	private String sku;
	private String productDescription;
	private String img1;
	private String img2;
	private String img3;
	private String img4;
	private String status;
	private Long categoryId;
	private String categoryName;
	private String base64_1;
	private String favorite;
	private int quantity;
	
	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getFavorite() {
		return favorite;
	}

	public void setFavorite(String favorite) {
		this.favorite = favorite;
	}

	public String getBase64_1() {
		return base64_1;
	}

	public void setBase64_1(String base64_1) {
		this.base64_1 = base64_1;
	}

	public String getBase64_2() {
		return base64_2;
	}

	public void setBase64_2(String base64_2) {
		this.base64_2 = base64_2;
	}

	public String getBase64_3() {
		return base64_3;
	}

	public void setBase64_3(String base64_3) {
		this.base64_3 = base64_3;
	}

	public String getBase64_4() {
		return base64_4;
	}

	public void setBase64_4(String base64_4) {
		this.base64_4 = base64_4;
	}

	private String base64_2;
	private String base64_3;
	private String base64_4;

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	private String path;

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
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
	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}



	
}
