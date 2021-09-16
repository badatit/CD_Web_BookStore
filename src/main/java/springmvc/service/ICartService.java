package springmvc.service;

import java.util.List;

import springmvc.dto.CartDTO;
import springmvc.dto.request.MiniCartDTO;

public interface ICartService {

	public CartDTO editCart(CartDTO cartDTO);
	public CartDTO updateCart(CartDTO cartDTO);
	public CartDTO saveCart(CartDTO cartDTO);
	public List<MiniCartDTO> findAllByUserId(); // use for cart mini
	public int countSizeCart();

	
	
	public List<CartDTO> showCartByIdUser(Long id);
	public List<CartDTO> findAll();
	public CartDTO changePrice(CartDTO cartDTO);
	public CartDTO findById(Long id);
	public void deleteCart(Long cartId);

	
	
	// new function
	public double subTotal();
	public double changeAmountTotal(Long id);
	
	public int checkQuantity(int amount, long bookId);

}
