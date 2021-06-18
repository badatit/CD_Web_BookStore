package springmvc.api.admin;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import springmvc.dto.CategoryDTO;
import springmvc.dto.OrderDTO;
import springmvc.dto.OrderDetailDTO;
import springmvc.service.IOrderDetailService;
import springmvc.service.IOrderService;

@RestController
@RequestMapping(value = "/api/managementorder")
public class ManagementOrderAPI {
	
	@Autowired
	private IOrderDetailService orderDetailService;
	
	@Autowired
	private IOrderService orderSevice;
	
	@GetMapping("/findall")
	public List<OrderDetailDTO> findAllByOrderId(@RequestParam(value = "id") Long id){
		return orderDetailService.findAllByOrderId(id);
		
	}
	@GetMapping("/findone")
	public OrderDTO findById(@RequestParam(value="id") Long id) {
		return orderSevice.findById(id);
	}
	@PutMapping
	public OrderDTO updateOrder(@Valid @RequestBody OrderDTO orderDTO ) {
		return orderSevice.updateOrderStatus(orderDTO);
		
	}
}
