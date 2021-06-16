package springmvc.controller.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;


import springmvc.Utils.SecurityUtils;

import springmvc.dto.MyUser;
import springmvc.dto.OrderDTO;
import springmvc.dto.UserDTO;
import springmvc.dto.request.MiniCartDTO;
import springmvc.service.ICartService;
import springmvc.service.IUserService;


@Controller(value = "checkOutControllerOfWeb")
@RequestMapping(value = "/web")
public class CheckOutController {
	
	public static final String URL_PAYPAL_SUCCESS = "web/home";
	public static final String URL_PAYPAL_CANCEL = "web/checkout";
	
	private Logger log = LoggerFactory.getLogger(getClass());
	@Autowired
	private ICartService iCartService;
	
	
	
	@Autowired
	private IUserService iuserService;
	
	@SuppressWarnings("unused")
	@RequestMapping(value = "/checkout" , method = RequestMethod.GET)
	public ModelAndView checkOutPage(HttpSession session ) {
		ModelAndView mav = new ModelAndView("/web/checkout");
		OrderDTO dto = (OrderDTO) session.getAttribute("orderDTO");
		try {
			mav.addObject("total",dto.getTotal());
		} catch (Exception e) {
			mav.addObject("total",0);
		}
		
		
		// show information user
		MyUser myUser = SecurityUtils.getPrincipal();
		UserDTO userDTO = iuserService.finbById(myUser.getId());
		Long id ;
		if (myUser == null) {
			id = null;
		}else {
			id = myUser.getId();
			List<MiniCartDTO> listCart = iCartService.findAllByUserId();
			mav.addObject("sizeCart", iCartService.countSizeCart());
			mav.addObject("listCart",listCart);
			mav.addObject("sumPrice", iCartService.subTotal());
		}
		
		
		mav.addObject("userDTO",userDTO);
		mav.addObject("orderDTO", dto);
		return mav;
	}	

}
