package springmvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import springmvc.entity.BookFavoriteEntity;

public interface BookFavoriteRepository extends JpaRepository<BookFavoriteEntity, Long>{
	
	@Query(value = "select * from favoritebook where bookid =?1",nativeQuery = true)
	public BookFavoriteEntity findOneByBookId(long bookId);
	
	@Query(value = "select * from favoritebook where userid =?1",nativeQuery = true)
	public List<BookFavoriteEntity> findByUser(long userId);
	
	@Query(value = "select count(id) from favoritebook where userid =?1",nativeQuery = true)
	public int countByUser(long userId);
}
