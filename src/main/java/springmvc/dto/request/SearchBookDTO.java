package springmvc.dto.request;

import java.util.Arrays;

public class SearchBookDTO {
	private String[] issuingCompany;
	private String price;
	private String[] coverType;
	private Integer limit;
	private Integer page;
	private String searchName;
	private String categoryName;
	private Integer categoryId;
	private String searchName1;
	private String categoryName1;

	public String[] getIssuingCompany() {
		return issuingCompany;
	}

	public void setIssuingCompany(String[] issuingCompany) {
		this.issuingCompany = issuingCompany;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String[] getCoverType() {
		return coverType;
	}

	public void setCoverType(String[] coverType) {
		this.coverType = coverType;
	}

	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	@Override
	public String toString() {
		return "SearchBookDTO [issuingCompany=" + Arrays.toString(issuingCompany) + ", price=" + price + ", coverType="
				+ Arrays.toString(coverType) + ", limit=" + limit + ", page=" + page + ", searchName=" + searchName
				+ ", categoryName=" + categoryName + "]";
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getSearchName1() {
		return searchName1;
	}

	public void setSearchName1(String searchName1) {
		this.searchName1 = searchName1;
	}

	public String getCategoryName1() {
		return categoryName1;
	}

	public void setCategoryName1(String categoryName1) {
		this.categoryName1 = categoryName1;
	}

	
}
