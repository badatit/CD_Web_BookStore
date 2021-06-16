package springmvc.controller.web;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import springmvc.Utils.SecurityUtils;
import springmvc.dto.MyUser;
import springmvc.dto.OrderDTO;
import springmvc.dto.UserDTO;
import springmvc.service.IUserService;

@Controller(value = "checkOutControllerOfWeb")
@RequestMapping(value = "/web")
public class CheckOutController {
	
	@Autowired
	private IUserService iuserService;
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
		mav.addObject("userDTO",userDTO);
		mav.addObject("orderDTO", dto);
		return mav;
	}

}
