package springmvc.service;

import java.util.List;

import springmvc.dto.CartDTO;
import springmvc.dto.OrderDTO;

public interface IOrderService {

	public OrderDTO save(OrderDTO orderDTO);
}
