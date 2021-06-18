package springmvc.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import springmvc.dto.BookDTO;
import springmvc.dto.request.SearchBookDTO;

public interface IBookService {
	public List<BookDTO> findAll();
	public BookDTO updateBook(BookDTO bookDTO);
	public BookDTO saveBook(BookDTO bookDTO);
	public BookDTO findById(Long id);
	public void deleteBooks(Long[] ids);
	public List<BookDTO> showBookByCategory(Long id , Pageable pageable);
	public List<BookDTO> findAllPage(Pageable pageable , SearchBookDTO searchBookDTO);
	public int getTotalItem();
	public List<BookDTO> findAllOrderByPriceASC();
	public List<BookDTO> findAllOrderByPriceDESC();
	public List<BookDTO> findAllByHigPrice();
	public List<BookDTO> findByNameAndCategoryAndPage(String name , String categoryName , Pageable pageable);
	public List<BookDTO> findByName(String name);
	public List<BookDTO> findByIssuingcompany(String issuingcompany);
	public List<BookDTO> findAll(SearchBookDTO searchBookDTO);
	public List<String> findAllIssuingcompany();
	public List<String> findAllCoverType();
	public List<BookDTO> findByNameAndCategory(SearchBookDTO searchBookDTO);
	public List<Integer> years();
	public Map<String,String> getCoverTypes();
	public long totalAmountOfBooks();
	public long totalAmountOfBooksByActive();
	public long totalAmountOfBooksByInactive();
}
