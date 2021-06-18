package springmvc.converter;

import org.modelmapper.ModelMapper;

import springmvc.dto.CartDTO;
import springmvc.dto.OrderDTO;
import springmvc.dto.OrderDetailDTO;
import springmvc.entity.CartEntity;
import springmvc.entity.OrderDetailEntity;
import springmvc.entity.OrderEntity;

public class OrderDetailsConverter {
	public OrderDetailDTO converterToDTO(OrderDetailEntity detailEntity) {
		ModelMapper mapper = new ModelMapper();
		OrderDetailDTO detailDTO  = mapper.map(detailEntity, OrderDetailDTO.class);
		return detailDTO;
	}
	public OrderDetailEntity converterToEntity( OrderDetailDTO orderDetailDTO) {
		ModelMapper mapper = new ModelMapper();
		OrderDetailEntity orderDetailEntity = mapper.map(orderDetailDTO, OrderDetailEntity.class);
		return orderDetailEntity;
	}

}
