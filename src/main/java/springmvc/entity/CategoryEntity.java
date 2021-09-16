package springmvc.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="category")
public class CategoryEntity extends BaseEntity{
	
	@Column(name = "name")
	private String name;
	
	@Column(name ="status")
	private String status;
	
	@OneToMany(mappedBy = "category",cascade= {CascadeType.PERSIST, CascadeType.REMOVE})
	private List<BookEntity> listBooks =new ArrayList<>();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<BookEntity> getListBooks() {
		return listBooks;
	}

	public void setListBooks(List<BookEntity> listBooks) {
		this.listBooks = listBooks;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
