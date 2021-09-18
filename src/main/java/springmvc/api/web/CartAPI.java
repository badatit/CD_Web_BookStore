package springmvc.api.web;

import java.text.NumberFormat;
import java.text.ParseException;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import springmvc.Utils.SecurityUtils;
import springmvc.Utils.VnCurrencyUtil;
import springmvc.dto.BookDTO;
import springmvc.dto.CartDTO;
import springmvc.dto.MyUser;
import springmvc.dto.request.MiniCartDTO;
import springmvc.service.ICartService;

@RestController
@RequestMapping(value = "/api")
public class CartAPI {

	@Autowired
	private ICartService cartService;
	
	@Autowired
	private VnCurrencyUtil vn;
	

	@PostMapping("/carts")
	public CartDTO saveCart(@RequestBody(required = false) CartDTO cartDTO) {
		return cartService.editCart(cartDTO);
	}

	@GetMapping("/carts")
	public List<MiniCartDTO> findAllCartByUser() {
		return cartService.findAllByUserId();

	}

	@GetMapping("/carts/subTotal")
	public String subTotal() {
		String result = vn.currencyVn(cartService.subTotal());
		return result;
	}

	@GetMapping("/carts/changeCart")
	public double changeCart(@RequestParam Long id) {
		return cartService.changeAmountTotal(id);
	}

	@DeleteMapping("/carts/delete")
	public int deleteCart(@RequestBody CartDTO cartDTO) {
		cartService.deleteCart(cartDTO.getId());
		int amount = cartService.countSizeCart();
		return amount;

	}

	@PostMapping("/getQuantityCart")
	public int getQuantityCart() {
//		MyUser myUser = SecurityUtils.getPrincipal();
//		int size = cartService.countSizeCart(myUser.getId());
		return 0;
	}

	@PostMapping("/cartsByIdUser")
	public List<CartDTO> findAll() {
		MyUser myUser = SecurityUtils.getPrincipal();
		return cartService.showCartByIdUser(myUser.getId());

	}
	
	@GetMapping("/carts/totalClickShipping")
	public double totalClickShipping(@RequestParam(required = false,value = "radio") double radio,@RequestParam(required = false,value = "total") String total) {
		NumberFormat format = NumberFormat.getInstance(Locale.GERMAN);
		double value = 0;
		try {
			value = format.parse(total).doubleValue();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		double result = value + radio*1000;
		if (result <0) {
			result = 0;
		}
		return result;
	}
	
	//check quantity 
	
//	public int checkQuantity(int amount,long bookId) {
//		return cartService.checkQuantity(amount, bookId);
//	}
	@GetMapping("/carts/checkQuantity")
	public int checkQuantity(@RequestParam(value="bookId") Long bookId,@RequestParam(value="quantity") int quantity) {
		return cartService.checkQuantity(quantity, bookId);
	}
	

}
