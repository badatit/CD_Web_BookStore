package springmvc.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.modelmapper.config.Configuration.AccessLevel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springmvc.Enums.OrderStatusEnum;
import springmvc.Enums.StatusEnum;
import springmvc.Utils.SecurityUtils;
import springmvc.constant.SystemConstant;
import springmvc.converter.OrderConverter;
import springmvc.dto.CategoryDTO;
import springmvc.dto.MyUser;
import springmvc.dto.OrderDTO;
import springmvc.entity.CartEntity;
import springmvc.entity.CategoryEntity;
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
		entity.setStatus(SystemConstant.NOT_RECEIVED);
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

	@Override
	public List<OrderDTO> findAll() {
		List<OrderEntity> listEntities = orderRepository.findAll();
		List<OrderDTO> dtos = new ArrayList<>();
		for (OrderEntity item : listEntities) {
			OrderDTO orderDTO = orderConverter.converterToDTO(item);
			dtos.add(orderDTO);
		}
		return dtos;
	}

	@Override
	public OrderDTO findById(Long id) {
		return orderConverter.converterToDTO(orderRepository.findOne(id));
	}

	@Override
	@Transactional
	public OrderDTO updateOrderStatus(OrderDTO orderDTO) {
		OrderEntity orderEntity = orderRepository.findOne(orderDTO.getId());
		ModelMapper modelMapper = new ModelMapper();	
		modelMapper.getConfiguration().setFieldMatchingEnabled(true).setFieldAccessLevel(AccessLevel.PRIVATE);
		modelMapper.addMappings(new PropertyMap<OrderDTO, OrderEntity>() {
			@Override
			protected void configure() {
				skip(destination.getId());
				skip(destination.getCreatedBy());
				skip(destination.getCreatedDate());
				skip(destination.getModifiedBy());
				skip(destination.getModifiedDate());
				skip(destination.getAmount());
				skip(destination.getEmail());
				skip(destination.getFullName());
				skip(destination.getNote());
				skip(destination.getOrderDate());
				skip(destination.getShipping());
				skip(destination.getPhoneNumber());
				skip(destination.getTotal());
				skip(destination.getUser());
				
			}
		});
		modelMapper.map(orderDTO, orderEntity);
		
		return orderConverter.converterToDTO(orderRepository.save(orderEntity));
	}

	@Override
	public Map<String, String> getStatus() {
		Map<String, String> status = new HashMap<>();
		for (OrderStatusEnum item : OrderStatusEnum.values()) {
			status.put(item.toString(), item.getOrderStatus());
		}
		return status;
	}


	

}
