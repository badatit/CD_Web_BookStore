package springmvc.api.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import springmvc.dto.OrderDetailDTO;
import springmvc.service.IOrderDetailService;

@RestController
@RequestMapping("/api/orderdetails")
public class OrderDetailAPI {
	@Autowired
	private IOrderDetailService orderDetailService;
	@PostMapping
	public String saveOrderDetail(@RequestBody OrderDetailDTO detailDTO){
		return orderDetailService.saveOrderDetail(detailDTO);
	}
	
}
