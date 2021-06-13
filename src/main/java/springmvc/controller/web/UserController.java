package springmvc.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import springmvc.dto.UserDTO;
import springmvc.service.IUserService;

@Controller(value = "userControllerOfWeb")
@RequestMapping(value = "/web")
public class UserController {
	
	@Autowired
	private IUserService userService;

	@RequestMapping(value = "/account/{id}" , method = RequestMethod.GET)
	public ModelAndView accountPage(@PathVariable("id") Long id) {
		
		ModelAndView mav = new ModelAndView("web/account");
		
		UserDTO dto = userService.finbById(id);
		mav.addObject("userId", id);
		mav.addObject("user", dto);
		
		return mav;
		
	}
}
