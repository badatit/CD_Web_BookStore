package springmvc.api.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import springmvc.dto.OrderDTO;
import springmvc.service.IOrderService;

@RestController
@RequestMapping(value = "/api/orders")
public class OrderAPI {
	
	@Autowired
	private IOrderService orderService;
	
	@PostMapping("/saveOrders")
	public String saveOrder(@RequestBody OrderDTO orderDTO,HttpSession session) {
//		orderDTO = orderService.save(orderDTO);
//		if (orderDTO != null) {
//			orderDTO.setMessage("orderoke");
//		}
//		return orderDTO;
		session.setAttribute("orderDTO", orderDTO);
		if (session.getAttribute("orderDTO") != null) {
			return "success";
		}
		return "false";
		
	}
	

}
