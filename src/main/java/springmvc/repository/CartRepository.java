package springmvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import springmvc.entity.CartEntity;

public interface CartRepository extends JpaRepository<CartEntity, Long>{
	
	
	@Query(value="SELECT COUNT(id) FROM cart where userid = ?1 and checkorder = ?2" ,nativeQuery = true)
	public int countCartById(Long idUser,boolean checkOrder);
	
	@Query(value="select c.* from cart c join cart_book cb on c.id = cb.cartid where cb.bookid=?1 and userid= ?2" , nativeQuery = true)
	public CartEntity findBookInCart(Long bookId , Long userId);
	
	@Query(value="select * from cart where userid = ?1" , nativeQuery = true)
	public List<CartEntity> findAllByUserId(Long userId);
	

	
	
	

}
