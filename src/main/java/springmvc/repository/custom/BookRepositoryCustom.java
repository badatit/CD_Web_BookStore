package springmvc.repository.custom;

import java.util.List;

import org.springframework.data.domain.Pageable;

import springmvc.dto.request.SearchBookDTO;
import springmvc.entity.BookEntity;

public interface BookRepositoryCustom  {
	public List<BookEntity> findAll(SearchBookDTO searchBookDTO);
	public List<BookEntity> findAll(Pageable pageable,SearchBookDTO searchBookDTO);
	

}
