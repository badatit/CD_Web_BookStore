package springmvc.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import springmvc.dto.OrderDTO;
import springmvc.service.IOrderService;

@Controller(value = "orderControllerAdmin")
@RequestMapping(value = "/admin/order")
public class OrderController {

	@Autowired
	private IOrderService orderSerive;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView showListBook() {
		ModelAndView mav = new ModelAndView("admin/order/order-list");
		List<OrderDTO> listDTO = orderSerive.findAll();
		mav.addObject("oders", listDTO);
		
		return mav;
	}
	
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public ModelAndView editCategory(@PathVariable("id") Long id ) {
		ModelAndView mav = new ModelAndView("/admin/order/order-edit");
		
		mav.addObject("order", orderSerive.findById(id));
		mav.addObject("status", orderSerive.getStatus());
		return mav;

	}
}
