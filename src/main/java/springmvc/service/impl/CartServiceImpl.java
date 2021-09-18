package springmvc.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;
import javax.validation.constraints.Min;

import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.modelmapper.config.Configuration.AccessLevel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springmvc.Utils.SecurityUtils;
import springmvc.converter.BookConverter;
import springmvc.converter.CartConverter;
import springmvc.dto.BookDTO;
import springmvc.dto.CartDTO;
import springmvc.dto.MyUser;
import springmvc.dto.request.MiniCartDTO;
import springmvc.entity.BookEntity;
import springmvc.entity.CartEntity;
import springmvc.entity.UserEntity;
import springmvc.repository.BookRepository;
import springmvc.repository.CartRepository;
import springmvc.repository.UserRepository;
import springmvc.service.ICartService;

@Service
public class CartServiceImpl implements ICartService {

	@Autowired
	private BookRepository bookRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private CartRepository cartRepository;

	private CartConverter cartConverter = new CartConverter();

	private BookConverter bookConverter = new BookConverter();

	@Override
	public List<CartDTO> showCartByIdUser(Long id) {
		UserEntity userEntity = userRepository.findOne(id);
		List<CartEntity> listCart = cartRepository.findAll();
		List<CartDTO> listDTO = new ArrayList<>();
		for (CartEntity item : listCart) {
			CartDTO cartDTO = cartConverter.converterToDTO(item);
			if (cartDTO.getUserId() == userEntity.getId()) {
				listDTO.add(cartDTO);
			}
		}

		return listDTO;
	}

	@Override
	public List<CartDTO> findAll() {
		List<CartEntity> list = cartRepository.findAll();
		List<CartDTO> listdto = new ArrayList<>();
		for (CartEntity item : list) {
			CartDTO cartDTO = cartConverter.converterToDTO(item);
			listdto.add(cartDTO);
		}
		return listdto;
	}

	@Override
	public CartDTO changePrice(CartDTO cartDTO) {
		CartEntity cartEntity = cartConverter.converterToEntity(cartDTO);
		cartEntity = cartRepository.save(cartEntity);
		return cartConverter.converterToDTO(cartEntity);
	}

	@Override
	public CartDTO findById(Long id) {
		return cartConverter.converterToDTO(cartRepository.findOne(id));
	}

	@Override
	@Transactional
	public CartDTO editCart(CartDTO cartDTO) {
		MyUser myUser = SecurityUtils.getPrincipal();
		long result = checkBookExistInCart(cartDTO.getBookId(), myUser.getId());
		if (result != 0) {
			cartDTO.setId(result);
			cartDTO = updateCart(cartDTO);
		} else {
			cartDTO = saveCart(cartDTO);

		}
//		// get size cart
		int sizeCart = cartRepository.countCartById(myUser.getId(), false);
		cartDTO.setSizeCart(sizeCart);
		cartDTO.setAmount( bookRepository.countByQuantity(cartDTO.getBookId())-cartDTO.getAmount());
		return cartDTO;
	}

	@Override
	@Transactional
	public CartDTO updateCart(CartDTO cartDTO) {
		CartEntity cartEntity = cartRepository.findOne(cartDTO.getId());
		ModelMapper modelMapper = new ModelMapper();
		modelMapper.getConfiguration().setFieldMatchingEnabled(true).setFieldAccessLevel(AccessLevel.PRIVATE);
		modelMapper.addMappings(new PropertyMap<CartDTO, CartEntity>() {
			@Override
			protected void configure() {
				skip(destination.getId());
				skip(destination.getCreatedBy());
				skip(destination.getCreatedDate());
				skip(destination.getModifiedBy());
				skip(destination.getModifiedDate());
				skip(destination.getAmount());
			}
		});
		modelMapper.map(cartDTO, cartEntity);

		if (cartDTO.getAmount() == null) {
			cartEntity.setAmount(cartEntity.getAmount() + 1);
		} else {
			if (cartDTO.isCheckBookInCartPage() == false) {
				cartEntity.setAmount(cartEntity.getAmount() + cartDTO.getAmount());
			} else {
				cartEntity.setAmount(cartDTO.getAmount());
			}
		}

		return cartConverter.converterToDTO(cartRepository.save(cartEntity));
	}

	@Override
	@Transactional
	public CartDTO saveCart(CartDTO cartDTO) {
		MyUser myUser = SecurityUtils.getPrincipal();
		if (cartDTO.getAmount() == null) {
			cartDTO.setAmount(1);
		} else {
			cartDTO.setAmount(cartDTO.getAmount());
		}
		CartEntity cartEntity = cartConverter.converterToEntity(cartDTO);
		cartEntity.setUserEntity(userRepository.findOne(myUser.getId()));
		cartEntity.setBookEntity(bookRepository.findOne(cartDTO.getBookId()));
		cartEntity.setCheckOrder(false);
		return cartConverter.converterToDTO(cartRepository.save(cartEntity));
	}

	public Long checkBookExistInCart(Long idBook, Long userId) {
		Long result = (long) 0;
		List<CartEntity> cartEntities = cartRepository.findAllByUserId(userId);
		for (CartEntity cartEntity : cartEntities) {
			if (cartEntity.getBookEntity().getId() == idBook) {
				result = cartEntity.getId();
				return result;
			}
		}

		return result;
	}

	@Override
	public double subTotal() {
		double result = 0;
		MyUser myUser = SecurityUtils.getPrincipal();
		List<CartEntity> cartEntities = cartRepository.findAllByUserId(myUser.getId());
		System.out.println(cartEntities.size());
		if (cartEntities.size() > 0) {
			for (CartEntity item : cartEntities) {
				BookEntity bookEntity = bookRepository.findOne(item.getBookEntity().getId());
				result += item.getAmount() * bookEntity.getPrice();
			}
		}
		return result;
	}

	// use for cart mini
	@Override
	public List<MiniCartDTO> findAllByUserId() {
		MyUser myUser = SecurityUtils.getPrincipal();
		List<CartEntity> listEntity = cartRepository.findAllByUserId(myUser.getId());
		List<MiniCartDTO> lCartDTOs = new ArrayList<>();
		for (CartEntity item : listEntity) {
			MiniCartDTO miniCartDTO = new MiniCartDTO();
			miniCartDTO.setAmount(item.getAmount());
			miniCartDTO.setPrice(item.getBookEntity().getPrice());
			miniCartDTO.setName(item.getBookEntity().getName());
			miniCartDTO.setId(item.getId());
			miniCartDTO.setAmountTotal(item.getAmount() * item.getBookEntity().getPrice());
			miniCartDTO.setBookId(item.getBookEntity().getId());
			miniCartDTO.setImg1(item.getBookEntity().getImg1());
			lCartDTOs.add(miniCartDTO);
		}
		return lCartDTOs;
	}

	@Override
	public void deleteCart(Long cartId) {
		cartRepository.delete(cartId);

	}


	@Override
	public int countSizeCart() {
		MyUser myUser = SecurityUtils.getPrincipal();
		return cartRepository.countCartById(myUser.getId(), false);
	}
	@Override
	public double changeAmountTotal(Long id) {
		double result =0;
		CartEntity cartEntity = cartRepository.findOne(id);
		if (cartEntity != null) {
			result = cartEntity.getAmount() * cartEntity.getBookEntity().getPrice();
		}
		return result;
	}

	@Override
	public int checkQuantity(int amount, long bookId) {
		int in = bookRepository.countByQuantity(bookId)-amount;
		return in;
	}


}
