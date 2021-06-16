package springmvc.converter;

import org.modelmapper.ModelMapper;

import springmvc.dto.BookFavoriteDTO;
import springmvc.entity.BookFavoriteEntity;

public class BookFavoriteConverter {
		public BookFavoriteDTO converterToDTO(BookFavoriteEntity bookEntity) {
			ModelMapper mapper = new ModelMapper();
			BookFavoriteDTO bookDTO = mapper.map(bookEntity, BookFavoriteDTO.class);
			return bookDTO;
		}
		public BookFavoriteEntity converterToEntity( BookFavoriteDTO bookEntity) {
			ModelMapper mapper = new ModelMapper();
			BookFavoriteEntity bookDTO = mapper.map(bookEntity, BookFavoriteEntity.class);
			return bookDTO;
		}
}
