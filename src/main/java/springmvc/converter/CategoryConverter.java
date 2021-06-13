package springmvc.converter;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import springmvc.dto.CategoryDTO;
import springmvc.entity.CategoryEntity;

@Component
public class CategoryConverter {
	public CategoryDTO converterToDTO(CategoryEntity bookEntity) {
		ModelMapper mapper = new ModelMapper();
		CategoryDTO bookDTO = mapper.map(bookEntity, CategoryDTO.class);
		return bookDTO;
	}

	public CategoryEntity converterToEntity(CategoryDTO bookEntity) {
		ModelMapper mapper = new ModelMapper();
		CategoryEntity bookDTO = mapper.map(bookEntity, CategoryEntity.class);
		return bookDTO;
	}
}
