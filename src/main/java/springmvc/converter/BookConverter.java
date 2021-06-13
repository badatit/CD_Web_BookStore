package springmvc.converter;

import org.modelmapper.ModelMapper;

import springmvc.dto.BookDTO;
import springmvc.entity.BookEntity;

public class BookConverter {
	public BookDTO converterToDTO(BookEntity bookEntity) {
		ModelMapper mapper = new ModelMapper();
		BookDTO bookDTO = mapper.map(bookEntity, BookDTO.class);
		return bookDTO;
	}
	public BookEntity converterToEntity( BookDTO bookEntity) {
		ModelMapper mapper = new ModelMapper();
		BookEntity bookDTO = mapper.map(bookEntity, BookEntity.class);
		return bookDTO;
	}
}
