package springmvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import springmvc.entity.CategoryEntity;

public interface CategoryRepository extends JpaRepository<CategoryEntity,Long>{


}
