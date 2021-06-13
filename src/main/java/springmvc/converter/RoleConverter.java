package springmvc.converter;

import org.modelmapper.ModelMapper;

import springmvc.dto.RoleDTO;
import springmvc.entity.RoleEntity;

public class RoleConverter {
	public RoleDTO converterToDTO(RoleEntity bookEntity) {
		ModelMapper mapper = new ModelMapper();
		RoleDTO roleDTO = mapper.map(bookEntity, RoleDTO.class);
		return roleDTO;
	}

	public RoleEntity converterToEntity(RoleDTO bookEntity) {
		ModelMapper mapper = new ModelMapper();
		RoleEntity roleEntity = mapper.map(bookEntity, RoleEntity.class);
		return roleEntity;
	}

}
