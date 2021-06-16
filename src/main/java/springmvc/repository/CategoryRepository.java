package springmvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import springmvc.entity.CategoryEntity;

public interface CategoryRepository extends JpaRepository<CategoryEntity,Long>{
	@Query(value="select c.name ,count(b.categoryid) as a from book b inner join category c on b.categoryid = c.id GROUP BY b.categoryid", nativeQuery = true)
	List<?> countBookByCategory();

}
