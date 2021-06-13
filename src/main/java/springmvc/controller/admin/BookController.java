package springmvc.controller.admin;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import springmvc.dto.BookDTO;
import springmvc.service.IBookService;
import springmvc.service.ICategoryService;

@Controller(value = "bookControllerAdmin")
@RequestMapping(value = "/admin/book")
public class BookController {
	@Autowired
	private IBookService bookService;

	@Autowired
	private ICategoryService iCategoryService;

	@Autowired
	ServletContext servletContext;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView showListBook() {
		ModelAndView mav = new ModelAndView("admin/book/book-list");
		List<BookDTO> listDTO = bookService.findAll();
		mav.addObject("books", listDTO);
		return mav;
	}

	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public ModelAndView savetBook() {
		ModelAndView mav = new ModelAndView("admin/book/book-edit");
		mav.addObject("status", iCategoryService.getStatus());
		mav.addObject("categoryId", iCategoryService.showCategorys());
		mav.addObject("years", bookService.years());
		mav.addObject("coverTypes", bookService.getCoverTypes());

		return mav;
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public ModelAndView editBook(@PathVariable("id") Long id) {
		ModelAndView mav = new ModelAndView("admin/book/book-edit");
		mav.addObject("status", iCategoryService.getStatus());
		mav.addObject("categoryId", iCategoryService.showCategorys());
		BookDTO bookDTO = bookService.findById(id);
		if (bookDTO.getImg1() != null) {
			bookDTO.setImg1(bookDTO.getImg1());
		}
		if (bookDTO.getImg2() != null) {
			bookDTO.setImg2(bookDTO.getImg2());
		}
		if (bookDTO.getImg3() != null) {
			bookDTO.setImg3(bookDTO.getImg3());
		}
		if (bookDTO.getImg4() != null) {
			bookDTO.setImg4(bookDTO.getImg4());
		}
		mav.addObject("book", bookDTO);
		mav.addObject("years", bookService.years());
		mav.addObject("coverTypes", bookService.getCoverTypes());

		return mav;
	}

//	@RequestMapping(value = "/admin/book/edit")
//	public ModelAndView showForm(Model theModel) {
//		theModel.addAttribute("book", new BookDTO());
//		return new ModelAndView("admin/book-edit");
//	}
//
//	@RequestMapping("/admin/book/processForm")
//	public ModelAndView editBuilding(@Valid @ModelAttribute("book") BookDTO bookDTO, BindingResult bindingResult) {
//		if (bindingResult.hasErrors()) {
//			ModelAndView mav = new ModelAndView("admin/book-edit");
//			return mav;
//		}
//		MultipartFile multipartFile1 = bookDTO.getProfileImage1();
//		MultipartFile multipartFile2 = bookDTO.getProfileImage2();
//		if (multipartFile1 != null) {
//			String fileName = servletContext.getRealPath("/")+"resources\\image\\"+multipartFile1.getOriginalFilename();
//			try {
//				multipartFile1.transferTo(new File(fileName));
//			} catch (IllegalStateException | IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//
//		}
//		if (multipartFile2 != null) {
//			String fileName = servletContext.getRealPath("/")+"resources\\image\\"+multipartFile2.getOriginalFilename();
//			try {
//				multipartFile2.transferTo(new File(fileName));
//			} catch (IllegalStateException | IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//
//		}
//		bookDTO.setImg1(multipartFile1.getOriginalFilename());
//		bookDTO.setImg2(multipartFile2.getOriginalFilename());
//		bookService.saveBook(bookDTO);
//		return new ModelAndView("redirect:/admin/book/edit?message=Insert success");
//
//	}
}
