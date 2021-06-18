package springmvc.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springmvc.converter.OrderDetailsConverter;
import springmvc.dto.OrderDTO;
import springmvc.dto.OrderDetailDTO;
import springmvc.entity.BookEntity;
import springmvc.entity.CartEntity;
import springmvc.entity.OrderDetailEntity;
import springmvc.entity.OrderEntity;
import springmvc.repository.BookRepository;
import springmvc.repository.CartRepository;
import springmvc.repository.OrderDetailRepository;
import springmvc.repository.OrderRepository;
import springmvc.service.IOrderDetailService;

@Service
public class OrderDetailServiceImpl implements IOrderDetailService {

	@Autowired
	private CartRepository cartRepository;
	@Autowired
	private BookRepository bookrepository;
	@Autowired
	private OrderRepository orderRepository;
	@Autowired
	private OrderDetailRepository orderDetailRepository;
	
	private OrderDetailsConverter orderDetailsConverter = new OrderDetailsConverter();
	

	@Override
	public String saveOrderDetail(OrderDetailDTO orderDetailDTO) {
		// edit : kiem cha orderid co trong db chua
		// chua : save
		// co : delete save
		List<OrderDetailEntity> listOD = orderDetailRepository.findAllByOrderid(orderDetailDTO.getOrderId());
		List<OrderDetailEntity> list = new ArrayList<>();
		if (listOD != null && listOD.size() > 0) {
			for (OrderDetailEntity orderDetailEntity : listOD) {
				orderDetailRepository.delete(orderDetailEntity);
			}
		}
		if (orderDetailDTO.getCartIds() != null) {
			for (String item : orderDetailDTO.getCartIds()) {
				Long id = Long.valueOf(item);
				CartEntity cartEntity = cartRepository.findOne(id);
				OrderDetailEntity orderDetailEntity = new OrderDetailEntity();
				orderDetailEntity.setAmount(cartEntity.getAmount());
				BookEntity bookEntity = bookrepository.findOne(cartEntity.getBookEntity().getId());
				orderDetailEntity.setPrice(cartEntity.getAmount() * bookEntity.getPrice());
				orderDetailEntity.setBookEntity(bookEntity);
				OrderEntity orderEntity = orderRepository.findOne(orderDetailDTO.getOrderId());
				orderDetailEntity.setOrderEntity(orderEntity);
				list.add(orderDetailRepository.save(orderDetailEntity));
			}
		}
		if (list.size() == orderDetailDTO.getCartIds().length) {
			return "success";
		}
		return "fail";
	}

	@Override
	public List<OrderDetailDTO> findAllByOrderId(Long orderId) {
		List<OrderDetailEntity> entities = orderDetailRepository.findAllByOrderid(orderId);
		List<OrderDetailDTO> detailDTOs = new ArrayList<>();
		for (OrderDetailEntity item : entities) {
			OrderEntity orderEntity = item.getOrderEntity();
			BookEntity bookEntity = item.getBookEntity();
			OrderDetailDTO dto = orderDetailsConverter.converterToDTO(item);
			dto.setOrderFullName(orderEntity.getFullName());
			dto.setNameBook(bookEntity.getName());
			detailDTOs.add(dto);
		}
		return detailDTOs;
	}

	
}
