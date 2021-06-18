package springmvc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springmvc.Utils.SecurityUtils;
import springmvc.converter.BookFavoriteConverter;
import springmvc.dto.BookFavoriteDTO;
import springmvc.dto.MyUser;
import springmvc.entity.BookFavoriteEntity;
import springmvc.repository.BookFavoriteRepository;
import springmvc.repository.BookRepository;
import springmvc.repository.UserRepository;
import springmvc.service.IBookFavoriteService;

@Service
public class BookFavoriteServiceImpl implements IBookFavoriteService {

	@Autowired
	private BookFavoriteRepository bookfavorite;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private BookRepository bookRepository;

	private BookFavoriteConverter bookFavoriteConverter = new BookFavoriteConverter();

	
	@Override
	public BookFavoriteDTO save(BookFavoriteDTO bookFavoriteDTO) {
		 MyUser myUser = SecurityUtils.getPrincipal();
		if (checkBookInFavorite(bookFavoriteDTO.getBookId())) {
			BookFavoriteEntity bookFavoriteEntity = bookfavorite.findOneByBookId(bookFavoriteDTO.getBookId());
			bookfavorite.delete(bookFavoriteEntity);
			int count = bookfavorite.countByUser(myUser.getId());
			bookFavoriteDTO.setMessage("success_delete");
		} else {
			BookFavoriteEntity bookFavoriteEntity = new BookFavoriteEntity();
			bookFavoriteEntity.setUser(userRepository.findOne(myUser.getId()));
			bookFavoriteEntity.setBookEntity(bookRepository.findOne(bookFavoriteDTO.getBookId()));
			bookFavoriteEntity = bookfavorite.save(bookFavoriteEntity);
			if (bookFavoriteEntity != null) {
				bookFavoriteDTO.setMessage("success_save");
			}
		}
		bookFavoriteDTO.setCount(countByUser());
		return bookFavoriteDTO;
	}

	public boolean checkBookInFavorite(Long bookId) {
		List<BookFavoriteEntity> list = bookfavorite.findAll();
		for (BookFavoriteEntity bookFavoriteEntity : list) {
			if (bookFavoriteEntity.getBookEntity().getId() == bookId) {
				return true;
			}
		}
		return false;
	}

	@Override
	public int countByUser() {
		 MyUser myUser = SecurityUtils.getPrincipal();
		return bookfavorite.countByUser(myUser.getId());
	}

}
