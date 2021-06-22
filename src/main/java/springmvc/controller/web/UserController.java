package springmvc.controller.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import springmvc.dto.BookFavoriteDTO;
import springmvc.dto.CategoryDTO;
import springmvc.dto.OrderDTO;
import springmvc.dto.UserDTO;
import springmvc.dto.request.MiniCartDTO;
import springmvc.service.IBookFavoriteService;
import springmvc.service.ICartService;
import springmvc.service.ICategoryService;
import springmvc.service.IOrderService;
import springmvc.service.IUserService;

@Controller(value = "userControllerOfWeb")
@RequestMapping(value = "/web")
public class UserController {
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IOrderService orderService;
	
	@Autowired
	private IBookFavoriteService bookFavariteService;
	
	@Autowired
	private ICartService iCartService;
	
	@Autowired
	private ICategoryService iCategoryService;

	@RequestMapping(value = "/account/{id}" , method = RequestMethod.GET)
	public ModelAndView accountPage(@PathVariable("id") Long id) {
		
		ModelAndView mav = new ModelAndView("web/account");
		UserDTO dto = userService.finbById(id);
		List<CategoryDTO> lists = iCategoryService.showCategorys();
		List<OrderDTO> listOrders = orderService.findOrderById();
		List<BookFavoriteDTO> favoriteDTOs = bookFavariteService.findById();
		List<MiniCartDTO> listCart = iCartService.findAllByUserId();
		
		mav.addObject("categorys", lists);
		mav.addObject("listOrders", listOrders);
		mav.addObject("listCart",listCart);
		mav.addObject("sizeCart", iCartService.countSizeCart());
		mav.addObject("subTotal", iCartService.subTotal());
		mav.addObject("countFavo", bookFavariteService.countByUser());
		mav.addObject("favoriteBooks", favoriteDTOs);
		mav.addObject("userId", id);
		mav.addObject("user", dto);
		
		return mav;
		
	}
}
