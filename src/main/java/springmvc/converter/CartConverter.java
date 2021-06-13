package springmvc.converter;

import org.modelmapper.ModelMapper;

import springmvc.dto.CartDTO;
import springmvc.entity.CartEntity;

public class CartConverter {
	public CartDTO converterToDTO(CartEntity cartEntity) {
		ModelMapper mapper = new ModelMapper();
		CartDTO cartDTO = mapper.map(cartEntity, CartDTO.class);
		return cartDTO;
	}
	public CartEntity converterToEntity( CartDTO cartDTO) {
		ModelMapper mapper = new ModelMapper();
		CartEntity cartEntity = mapper.map(cartDTO, CartEntity.class);
		return cartEntity;
	}

}
