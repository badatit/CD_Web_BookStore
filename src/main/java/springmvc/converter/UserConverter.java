package springmvc.converter;

import org.modelmapper.ModelMapper;

import springmvc.dto.UserDTO;
import springmvc.entity.UserEntity;

public class UserConverter {
	public UserDTO converterToDTO(UserEntity bookEntity) {
		ModelMapper mapper = new ModelMapper();
		UserDTO bookDTO = mapper.map(bookEntity, UserDTO.class);
		return bookDTO;
	}

	public UserEntity converterToEntity(UserDTO bookEntity) {
		ModelMapper mapper = new ModelMapper();
		UserEntity bookDTO = mapper.map(bookEntity, UserEntity.class);
		return bookDTO;
	}
}
