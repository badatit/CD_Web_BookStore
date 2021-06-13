package springmvc.converter;

import org.modelmapper.ModelMapper;

import springmvc.dto.CartDTO;
import springmvc.dto.OrderDTO;
import springmvc.entity.CartEntity;
import springmvc.entity.OrderEntity;

public class OrderConverter {
	public OrderDTO converterToDTO(OrderEntity orderEntity) {
		ModelMapper mapper = new ModelMapper();
		OrderDTO orderDTO  = mapper.map(orderEntity, OrderDTO.class);
		return orderDTO;
	}
	public OrderEntity converterToEntity( OrderDTO orderDTO) {
		ModelMapper mapper = new ModelMapper();
		OrderEntity orderEntity = mapper.map(orderDTO, OrderEntity.class);
		return orderEntity;
	}

}
