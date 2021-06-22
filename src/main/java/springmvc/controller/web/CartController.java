package springmvc.controller.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import springmvc.Utils.VnCurrencyUtil;
import springmvc.dto.CategoryDTO;
import springmvc.dto.request.MiniCartDTO;
import springmvc.service.IBookFavoriteService;
import springmvc.service.ICartService;
import springmvc.service.ICategoryService;

@Controller(value = "cartControllerOfWeb")
@RequestMapping(value = "/web")
public class CartController {
	
	@Autowired
	private ICategoryService iCategoryService;
	
	@Autowired
	private ICartService iCartService;
	
	@Autowired
	private VnCurrencyUtil vn;
	@Autowired
	private IBookFavoriteService iBookFavo;

	@RequestMapping(value ="/cart/{id}" , method = RequestMethod.GET)
	public ModelAndView showCart(@PathVariable Long id) {
		ModelAndView mav = new ModelAndView("/web/cart");
		List<MiniCartDTO>listCart = iCartService.findAllByUserId();
		List<CategoryDTO> lists = iCategoryService.showCategorys();
		

//		mav.addObject("sizeCart", iCartService.countSizeCart(id));
		mav.addObject("userId", id);
		mav.addObject("listCart", listCart);
		mav.addObject("sizeCart", iCartService.countSizeCart());
		mav.addObject("countFavo", iBookFavo.countByUser());
		mav.addObject("categorys", lists);
		
		mav.addObject("sumPrice", iCartService.subTotal());
		System.out.println(listCart.size());
		return mav;
		
	}
	
	

}
