package springmvc.service;

import springmvc.dto.BookFavoriteDTO;

public interface IBookFavoriteService {
	public BookFavoriteDTO save(BookFavoriteDTO bookFavoriteDTO);
	public int countByUser();
}
