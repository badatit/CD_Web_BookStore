package springmvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import springmvc.entity.OrderEntity;

public interface OrderRepository extends JpaRepository<OrderEntity, Long>{
	
	@Query(value="select * from orders where usersid = ?1" , nativeQuery = true)
	public List<OrderEntity> finbOrderByIdUser(Long userId);
	
	
	
	

}
