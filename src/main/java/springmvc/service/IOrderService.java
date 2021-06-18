package springmvc.service;

import java.util.List;
import java.util.Map;

import springmvc.dto.CartDTO;
import springmvc.dto.OrderDTO;

public interface IOrderService {

	public OrderDTO save(OrderDTO orderDTO);
	public List<OrderDTO> findOrderById();
	Map<String,String> getStatus();
	public List<OrderDTO> findAll();
	public OrderDTO findById(Long id);
	public OrderDTO updateOrderStatus(OrderDTO orderDTO);
}
