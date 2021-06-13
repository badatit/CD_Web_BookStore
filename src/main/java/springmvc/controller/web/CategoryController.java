package springmvc.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import springmvc.service.IBookService;
import springmvc.service.ICategoryService;

@Controller(value = "categoryControllerOfWeb")
@RequestMapping(value = "/web")
public class CategoryController {

	@Autowired
	private ICategoryService iCategoryService;
	
	@Autowired
	private IBookService bookService;

	
	
	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public ModelAndView saveCategory() {
		ModelAndView mav = new ModelAndView("/admin/category/category-edit");
		mav.addObject("status", iCategoryService.getStatus());
		return mav;

	}
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public ModelAndView editCategory(@PathVariable("id") Long id ) {
		ModelAndView mav = new ModelAndView("/admin/category/category-edit");
		mav.addObject("category", iCategoryService.findOneById(id));
		mav.addObject("status", iCategoryService.getStatus());
		return mav;

	}

}
