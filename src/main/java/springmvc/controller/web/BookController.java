package springmvc.controller.web;

import java.awt.print.Book;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import springmvc.Utils.SecurityUtils;
import springmvc.dto.BookDTO;
import springmvc.dto.CartDTO;
import springmvc.dto.CategoryDTO;
import springmvc.dto.MyUser;
import springmvc.dto.request.BookSQLDTO;
import springmvc.dto.request.HeaderDTO;
import springmvc.dto.request.MiniCartDTO;
import springmvc.dto.request.SearchBookDTO;
import springmvc.service.IBookFavoriteService;
import springmvc.service.IBookService;
import springmvc.service.ICartService;
import springmvc.service.ICategoryService;

@Controller(value = "productControllerOfWeb")
@RequestMapping(value = "/web")
public class BookController {

	@Autowired
	private ICategoryService iCategoryService;

	@Autowired
	private IBookService bookService;

	@Autowired
	private ICartService iCartService;
	

	@Autowired
	private IBookFavoriteService iBookFavo;
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public ModelAndView productsPage(@ModelAttribute("searchBookDTO") SearchBookDTO searchBookDTO) {
		System.out.println(searchBookDTO.getSearchName());
		ModelAndView mav = new ModelAndView("/web/books");
		/*
		 * if(searchBookDTO.getPage() == null) { searchBookDTO.setPage(1);
		 * searchBookDTO.setLimit(9); }
		 */
		Pageable pageable = new PageRequest(searchBookDTO.getPage() - 1, searchBookDTO.getLimit());
		int currentPage = searchBookDTO.getPage();
		mav.addObject("currentPage", currentPage);
		List<CategoryDTO> lists = iCategoryService.showCategorys();
		List<BookDTO> listDTO = null;

		listDTO = bookService.findAllPage(pageable, searchBookDTO);
		System.out.println("tong so luong" + bookService.getSizeSql());
		System.out.print(searchBookDTO.getLimit());
		int totalPages = (int) Math.ceil((double) bookService.getSizeSql() / searchBookDTO.getLimit());
		mav.addObject("totalPages", "9");
		System.out.println(totalPages +"-----------------------------------");

		List<String> listIssuingCompany = bookService.findAllIssuingcompany();
		List<String> listCoverType = bookService.findAllCoverType();

		MyUser myUser = SecurityUtils.getPrincipal();
		Long id;
		if (myUser == null) {
			id = null;
		} else {
			id = myUser.getId();
			List<MiniCartDTO> listCart = iCartService.findAllByUserId();
			mav.addObject("sizeCart", iCartService.countSizeCart());
			mav.addObject("listCart", listCart);
			mav.addObject("subTotal", iCartService.subTotal());
			mav.addObject("countFavo", iBookFavo.countByUser());
		}
		mav.addObject("userId", id);
		mav.addObject("categorys", lists);
		mav.addObject("books", listDTO);
		mav.addObject("issuingCompanys", listIssuingCompany);
		mav.addObject("coverTypes", listCoverType);
		mav.addObject("searchName", searchBookDTO.getSearchName());
		mav.addObject("categoryId", searchBookDTO.getCategoryId());
		// tra 1 list bang mav.

		// lưa checked
		if (searchBookDTO.getCoverType() != null) {// 0 1
			String[] result = searchBookDTO.getCoverType();
			mav.addObject("coverType", result);
		}
		if (searchBookDTO.getIssuingCompany() != null) {
			String[] result = searchBookDTO.getIssuingCompany();
			mav.addObject("issu", result);
		}
		if (searchBookDTO.getPrice() != null) {
			String result = searchBookDTO.getPrice();
			mav.addObject("price", result);
		}

		return mav;
	}

	@RequestMapping(value = "/product/{id}", method = RequestMethod.GET)
	public ModelAndView productDetailsPage(@PathVariable("id") Long id) {
		ModelAndView mav = new ModelAndView("/web/bookdetails");

		BookDTO bookDTO = bookService.findById(id);
		List<CategoryDTO> lists = iCategoryService.showCategorys();
		List<BookDTO> listBooks = bookService.findBookByCategoryIdOfBookDetail(bookDTO.getCategoryId());
		MyUser myUser = SecurityUtils.getPrincipal();
		Long idUser;
		if (myUser == null) {
			idUser = null;
		} else {
			idUser = myUser.getId();
			List<MiniCartDTO> listCart = iCartService.findAllByUserId();
			mav.addObject("sizeCart", iCartService.countSizeCart());
			mav.addObject("listCart", listCart);
			mav.addObject("subTotal", iCartService.subTotal());
			mav.addObject("countFavo", iBookFavo.countByUser());

		}

		mav.addObject("userId", idUser);
		mav.addObject("categorys", lists);
		mav.addObject("bookId", bookDTO);
		mav.addObject("listBooks", listBooks);
		return mav;

	}

	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public ModelAndView showCategorys() {
		ModelAndView mav = new ModelAndView("/web/books");

		List<CategoryDTO> lists = iCategoryService.showCategorys();
		List<BookDTO> listDTO = bookService.findAll();
		MyUser myUser = SecurityUtils.getPrincipal();
		Long id;
		if (myUser == null) {
			id = null;
		} else {
			id = myUser.getId();
		}
		mav.addObject("userId", id);
		mav.addObject("categorys", lists);
		mav.addObject("books", listDTO);

		return mav;

	}

	@RequestMapping(value = "/category/{id}", method = RequestMethod.GET)
	public ModelAndView showBookByCategory(@PathVariable Long id,
			@ModelAttribute("searchBookDTO") SearchBookDTO searchBookDTO) {
		ModelAndView mav = new ModelAndView("/web/category");

		Pageable pageable = new PageRequest(searchBookDTO.getPage() - 1, searchBookDTO.getLimit());
		int totalPages = (int) Math.ceil((double) bookService.getTotalItem() / searchBookDTO.getLimit());
		mav.addObject("totalPages", totalPages);
		int currentPage = searchBookDTO.getPage();
		mav.addObject("currentPage", currentPage);
		mav.addObject("idCategory", id);

		List<BookDTO> listDTO = bookService.showBookByCategory(id, pageable);
		List<CategoryDTO> lists = iCategoryService.showCategorys();
		List<String> listIssuingCompany = bookService.findAllIssuingcompany();
		List<String> listCoverType = bookService.findAllCoverType();

		if (listDTO.size() == 0) {
			mav.addObject("message", "Sản phẩm hiện tại đã hết");
		} else {
			mav.addObject("books", listDTO);
		}
		mav.addObject("categorys", lists);

		MyUser myUser = SecurityUtils.getPrincipal();
		Long idUser;
		if (myUser == null) {
			idUser = null;
		} else {
			idUser = myUser.getId();
			List<CartDTO> listCart = iCartService.showCartByIdUser(idUser);
//			mav.addObject("sizeCart", iCartService.countSizeCart(idUser));
			mav.addObject("carts", listCart);
		}
		mav.addObject("userId", idUser);
		mav.addObject("issuingCompanys", listIssuingCompany);
		mav.addObject("coverTypes", listCoverType);
		mav.addObject("idCategory", id);

		if (searchBookDTO.getCoverType() != null) {// 0 1
			String[] result = searchBookDTO.getCoverType();
			mav.addObject("coverType", result);
		}
		if (searchBookDTO.getIssuingCompany() != null) {
			String[] result = searchBookDTO.getIssuingCompany();
			mav.addObject("issu", result);
		}
		if (searchBookDTO.getPrice() != null) {
			String result = searchBookDTO.getPrice();
			mav.addObject("price", result);
		}
		return mav;
	}

}
