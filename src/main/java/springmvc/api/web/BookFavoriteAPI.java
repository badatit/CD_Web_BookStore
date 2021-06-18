package springmvc.api.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import springmvc.dto.BookFavoriteDTO;
import springmvc.service.IBookFavoriteService;

@RestController
@RequestMapping("/api/bookfavorite")
public class BookFavoriteAPI {
	@Autowired
	private IBookFavoriteService bookFavoriteSerivce;
	
	@PostMapping
	public BookFavoriteDTO saveBookFavorite(@RequestBody BookFavoriteDTO bookFavoriteDTO) {
		return bookFavoriteSerivce.save(bookFavoriteDTO);
	}

}
