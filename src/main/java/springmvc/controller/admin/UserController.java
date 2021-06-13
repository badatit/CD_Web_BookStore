package springmvc.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import springmvc.dto.JsonResultDto;
import springmvc.dto.UserDTO;
import springmvc.entity.UserEntity;
import springmvc.service.ICategoryService;
import springmvc.service.IRoleService;
import springmvc.service.IUserService;

@Controller
@RequestMapping(value = "/admin/user")
public class UserController {

	@Autowired
	private IUserService userService;

	@Autowired
	private ICategoryService iCategoryService;

	@Autowired
	private IRoleService roleService;

	@RequestMapping(value = "/list")
	public ModelAndView showListUsers() {
		ModelAndView mav = new ModelAndView("admin/user/user-list");
		List<UserDTO> listDTO = userService.findAll();
		mav.addObject("users", listDTO);
		return mav;
	}

	@RequestMapping(value = "/save")
	public ModelAndView saveUser() {
		ModelAndView mav = new ModelAndView("admin/user/user-edit");
		mav.addObject("status", iCategoryService.getStatus());
		mav.addObject("role", roleService.findAll());
		return mav;
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public ModelAndView editBook(@PathVariable("id") Long id) {
		ModelAndView mav = new ModelAndView("admin/user/user-edit");
		
		mav.addObject("status", iCategoryService.getStatus());
		mav.addObject("role", roleService.findAll());
		UserDTO userDTO = userService.finbById(id);
		mav.addObject("user", userDTO);

		return mav;
	}
	@PostMapping("/check")
	@ResponseBody
	public JsonResultDto<String> check(@RequestBody UserEntity userEntity) {
		if (userService.existsByUserName(userEntity.getUserName())) {
			return new JsonResultDto<String>().error("Tên đăng nhập đã tồn tại");
		}
		return new JsonResultDto<String>().success("Tên đăng nhập hợp lệ", null);
	}
	
	@PostMapping("/checkEmail")
	@ResponseBody
	public JsonResultDto<String> checkEmail(@RequestBody UserEntity entity) {
		if (userService.existsByEmail(entity.getEmail())) {
			return new JsonResultDto<String>().error("Email đã được đăng ký");
		}
		return new JsonResultDto<String>().success("Email hợp lệ", null);

	}
}
