package springmvc.controller.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import springmvc.Utils.SecurityUtils;
import springmvc.dto.BookDTO;
import springmvc.dto.CategoryDTO;
import springmvc.dto.MyUser;
import springmvc.dto.request.HeaderDTO;
import springmvc.service.IBookService;
import springmvc.service.ICategoryService;

@Controller
@RequestMapping(value = "/web")
public class SearchController {

	@Autowired
	private ICategoryService iCategoryService;

	@Autowired
	private IBookService bookService;

	@SuppressWarnings("unused")
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView productsPage(@ModelAttribute("headerDTO") HeaderDTO headerDTO
//			@RequestParam("name") String name , 
//			@RequestParam("categoryName") String categoryName,
//			@RequestParam(value="pageSearch" , required=false,defaultValue = "1") Integer page, 
//			@RequestParam(value="limitSearch",required=false, defaultValue = "9") int limit
	) {
		System.out.println(headerDTO.getNameSearch());
		ModelAndView mav = new ModelAndView("/web/search");

//		Pageable pageable = new PageRequest(page-1, limit);
//		int totalPages= (int) Math.ceil((double) bookService.getTotalItem() / limit);
//		mav.addObject("totalPages", totalPages);
//		Integer currentPage = 0;
//		currentPage = page;
//		mav.addObject("currentPageSearch", currentPage);
//		List<CategoryDTO> lists = iCategoryService.showCategorys();
////		List<BookDTO> listDTO = bookService.findAllPage(pageable ,);
//		
//		List<BookDTO> listsSearch = bookService.findByNameAndCategoryAndPage(name , categoryName , pageable);
//		List<String> listIssuingCompany = bookService.findAllIssuingcompany();
//		List<String> listCoverType = bookService.findAllCoverType();
//	
//		if(listsSearch.size() == 0) {
//			mav.addObject("message", "Sản phẩm hiện tại đã hết");
//			
//		}else {
//			mav.addObject("listsSearch", listsSearch);
//		}
//		
//		MyUser myUser = SecurityUtils.getPrincipal();
//		Long id ;
//		if (myUser == null) {
//			id = null;
//		}else {
//			id = myUser.getId();
//		}
//		mav.addObject("searchName", name);
//		mav.addObject("categoryNameSearch", categoryName);
//		mav.addObject("userId", id);
//		mav.addObject("categorys", lists);
//		mav.addObject("books", "");
//		mav.addObject("issuingCompanys", listIssuingCompany);
//		mav.addObject("coverTypes", listCoverType);
		return mav;
	}
}
