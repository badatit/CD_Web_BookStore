package springmvc.controller.web;

import java.util.List;

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

import springmvc.Utils.SecurityUtils;
import springmvc.dto.BookDTO;
import springmvc.dto.CartDTO;
import springmvc.dto.CategoryDTO;
import springmvc.dto.MyUser;
import springmvc.dto.request.MiniCartDTO;
import springmvc.entity.BookFavoriteEntity;
import springmvc.service.IBookService;
import springmvc.service.ICartService;
import springmvc.service.ICategoryService;

@Controller(value = "homeControllerOfWeb")
@RequestMapping(value = "/web")
public class HomeController {

	@Autowired
	private IBookService bookService;

	@Autowired
	private ICategoryService iCategoryService;
	
	@Autowired
	private ICartService iCartService;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("/web/home");
		List<CategoryDTO> lists = iCategoryService.showCategorys();
		List<BookDTO> listDTO = bookService.findAll();
		
		List<BookDTO> listBookASC = bookService.findAllOrderByPriceASC();
//		List<BookDTO> listBookDESC = bookService.findAllOrderByPriceDESC();
		MyUser myUser = SecurityUtils.getPrincipal();
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
		
		
		mav.addObject("listBookASC", listBookASC);
//		mav.addObject("listBookDESC", listBookDESC);
		mav.addObject("userId", id);
		mav.addObject("books", listDTO);
		mav.addObject("categorys", lists);
		

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
		return new ModelAndView("redirect:/web/home");
	}

	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		return new ModelAndView("redirect:/home?accessDenied");
	}
}
