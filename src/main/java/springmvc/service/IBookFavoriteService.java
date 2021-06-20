package springmvc.service;

import java.util.List;

import springmvc.dto.BookFavoriteDTO;

public interface IBookFavoriteService {
	public BookFavoriteDTO save(BookFavoriteDTO bookFavoriteDTO);
	public int countByUser();
	public List<BookFavoriteDTO> findById();
	public void deleteFavoriteBook(Long id);
}
