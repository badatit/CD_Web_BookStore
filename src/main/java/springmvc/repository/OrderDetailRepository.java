package springmvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import springmvc.entity.OrderDetailEntity;

public interface OrderDetailRepository extends JpaRepository<OrderDetailEntity,Long>{
	
	@Query(value = "select * from orderdetail where orderid= ?1",nativeQuery = true)
	public List<OrderDetailEntity> findAllByOrderid(Long orderId);

}
