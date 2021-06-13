package springmvc.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import springmvc.service.IBookService;
import springmvc.service.ICategoryService;
import springmvc.service.IUserService;

@Controller(value = "homeControllerOfAdmin")
public class HomeController {

	@Autowired
	private IBookService bookService;
	
	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private IUserService userService;

	@RequestMapping(value = "/admin/home", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("admin/home");
		mav.addObject("amountOfBooks", bookService.totalAmountOfBooks());
		mav.addObject("amountOfCategorys", categoryService.totalAmountOfCategorys());
		mav.addObject("amountOfUsers", userService.totalAmountOfUsers());
		mav.addObject("amountOfStatusActive", bookService.totalAmountOfBooksByActive());
		mav.addObject("amountOfStatusInactive", bookService.totalAmountOfBooksByInactive());
		return mav;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginPage() {
		ModelAndView mav = new ModelAndView("login");
		return mav;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return new ModelAndView("redirect:/admin/home");
	}

	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		return new ModelAndView("redirect:/login?accessDenied");
	}
}