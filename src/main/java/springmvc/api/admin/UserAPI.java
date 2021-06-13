package springmvc.api.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import springmvc.dto.BookDTO;
import springmvc.dto.UserDTO;
import springmvc.service.IUserService;

@RestController
@RequestMapping(value = "/api/user")
public class UserAPI {
	
	@Autowired
	private IUserService userService;
	
	@PostMapping
	public UserDTO saveUser(@RequestBody UserDTO userDTO) {
		return userService.saveUser(userDTO);
	}
	@PutMapping
	public UserDTO updateUser(@RequestBody UserDTO userDTO) {
		return userService.updateUser(userDTO);
		
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
	
}
