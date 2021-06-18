package springmvc.service;

import java.util.List;

import springmvc.dto.OrderDetailDTO;

public interface IOrderDetailService {
	public String saveOrderDetail(OrderDetailDTO orderDetailDTO);
	public List<OrderDetailDTO> findAllByOrderId(Long orderId);
}
