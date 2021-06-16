package springmvc.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springmvc.Utils.SecurityUtils;
import springmvc.converter.OrderConverter;
import springmvc.dto.MyUser;
import springmvc.dto.OrderDTO;
import springmvc.entity.CartEntity;
import springmvc.entity.OrderEntity;
import springmvc.entity.UserEntity;
import springmvc.repository.BookRepository;
import springmvc.repository.CartRepository;
import springmvc.repository.OrderRepository;
import springmvc.repository.UserRepository;
import springmvc.service.IOrderService;

@Service
public class OrderServiceImpl implements IOrderService {

	@Autowired
	private BookRepository bookRepository;

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private CartRepository cartRepository;

	@Autowired
	private OrderRepository orderRepository;

	private OrderConverter orderConverter = new OrderConverter();

	@Override
	public OrderDTO save(OrderDTO orderDTO) {
		MyUser myUser = SecurityUtils.getPrincipal();
		int count =0;
		for (String item : orderDTO.getCartIds()) {
			Long id = Long.valueOf(item);
			CartEntity cartEntity = cartRepository.findOne(id);
			count += cartEntity.getAmount();
		}
		OrderEntity entity = new OrderEntity();
		UserEntity userEntity = userRepository.findOne(myUser.getId());
		entity.setAddress(userEntity.getAddress());
		entity.setFullName(userEntity.getFullName());
		entity.setEmail(userEntity.getEmail());
		entity.setUser(userEntity);
		entity.setShipping(orderDTO.getShipping());
		entity.setOrderDate(new Date());
		entity.setTotal(orderDTO.getTotal());
		entity.setAmount(count);
		// save orderdetail
		return orderConverter.converterToDTO(orderRepository.save(entity));
	}

	@Override
	public List<OrderDTO> findOrderById() {
		MyUser myUser = SecurityUtils.getPrincipal();
		List<OrderEntity> orderList = orderRepository.finbOrderByIdUser(myUser.getId());
		List<OrderDTO> dto = new ArrayList<>();
		for (OrderEntity item : orderList) {
			OrderDTO orderDTO = orderConverter.converterToDTO(item);
			dto.add(orderDTO);
		}
		return dto;
	}


	

}
