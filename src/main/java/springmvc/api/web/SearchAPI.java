package springmvc.api.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import springmvc.dto.BookDTO;
import springmvc.dto.request.SearchBookDTO;
import springmvc.service.IBookService;

@RestController
@RequestMapping(value = "/web/api/search")
public class SearchAPI {
	
	@Autowired
	private IBookService bookService;
	
	@PostMapping
	@ResponseBody
	public List<BookDTO> nameAutoComplete(@RequestBody SearchBookDTO searchBookDTO){
		Pageable pageable = new PageRequest(searchBookDTO.getPage()-1, searchBookDTO.getLimit());
		List<BookDTO> lists = bookService.findAllPage(pageable, searchBookDTO);
		return lists;
	}
	@PostMapping("/book")
	public List<BookDTO> search(@RequestBody SearchBookDTO searchBookDTO){
		List<BookDTO> listBook = bookService.findByNameAndCategory(searchBookDTO);
		return listBook;
	}
	
	@PostMapping("/catalog")
	public List<BookDTO> issuingcompanySearch(@RequestBody SearchBookDTO searchBookDTO ){
		Pageable pageable = new PageRequest(searchBookDTO.getPage()-1, searchBookDTO.getLimit());
		List<BookDTO> lists = bookService.findAllPage(pageable, searchBookDTO);
		System.out.println(searchBookDTO.toString());
		return lists;
	}
}
