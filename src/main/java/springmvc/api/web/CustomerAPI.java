package springmvc.api.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import springmvc.dto.JsonResultDto;
import springmvc.dto.UserDTO;
import springmvc.entity.UserEntity;
import springmvc.service.IUserService;

@RestController
@RequestMapping(value = "/web/api/user")
public class CustomerAPI {
	
	@Autowired
	private IUserService userService;
	
	
	@PostMapping
	public UserDTO saveUser(@RequestBody UserDTO userDTO) {
		return userService.saveCustomer(userDTO);
		
	}
	
	@PutMapping
	public UserDTO updateUser(@RequestBody UserDTO userDTO) {
		return userService.updateCustomer(userDTO);
		
	}
	
	@PutMapping("/password")
	public UserDTO updatePass(@RequestBody UserDTO userDTO) {
		return userService.updatePassword(userDTO);
		
	}
	@DeleteMapping
	public void deleteUser(@RequestBody UserDTO  userDTO) {
		userService.deleteUser(userDTO.getIds());
	}
	
	@RequestMapping(value = "/find/{id}", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<UserDTO> find(@PathVariable("id") Long id) {
		try {
			return new ResponseEntity<UserDTO>(userService.finbById(id), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<UserDTO>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@PostMapping("/check")
	@ResponseBody
	public JsonResultDto<String> check(@RequestBody UserEntity userEntity) {
		if (userService.existsByUserName(userEntity.getUserName())) {
			return new JsonResultDto<String>().error("Tên đăng nhập đã tồn tại" ,userEntity.getPassword() );
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
