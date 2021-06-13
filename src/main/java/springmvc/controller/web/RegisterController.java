package springmvc.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import springmvc.dto.JsonResultDto;
import springmvc.entity.UserEntity;
import springmvc.service.IUserService;


@Controller
@RequestMapping(value = "/web")
public class RegisterController {
	
	@Autowired
	private IUserService userService;
	
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
