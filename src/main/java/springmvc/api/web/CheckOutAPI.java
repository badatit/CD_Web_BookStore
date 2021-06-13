package springmvc.api.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import springmvc.dto.OrderDTO;
import springmvc.dto.OrderDetailDTO;
import springmvc.service.ICartService;
import springmvc.service.IOrderDetailService;
import springmvc.service.IOrderService;

@RestController
@RequestMapping("/api/checkout")
public class CheckOutAPI {
	@Autowired
	private IOrderService orderService;

	@Autowired
	private IOrderDetailService orderDetailService;
	
	@Autowired
	private ICartService cartService;

	@GetMapping
	public Long saveCheckOut(HttpSession session) {
		OrderDTO dto = (OrderDTO) session.getAttribute("orderDTO");
		dto = orderService.save(dto);
		if (dto != null) {
			return dto.getId();
		}
		return null;
	}

	@PostMapping
	public String saveDetail(HttpSession session,@RequestBody Long orderId) {
		OrderDTO dto = (OrderDTO) session.getAttribute("orderDTO");
		OrderDetailDTO detailDTO = new OrderDetailDTO();
		detailDTO.setOrderId(orderId);
		detailDTO.setCartIds(dto.getCartIds());
		if (orderDetailService.saveOrderDetail(detailDTO).equalsIgnoreCase("success")) {
			for (String item : detailDTO.getCartIds()) {
				long id = Long.valueOf(item);
				cartService.deleteCart(id);
			}
			session.removeAttribute("orderDTO");
			return "success";
		}
		return "fail";

	}
}
