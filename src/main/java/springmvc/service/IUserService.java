package springmvc.service;

import java.util.List;

import springmvc.dto.OrderDTO;
import springmvc.dto.UserDTO;

public interface IUserService {
	
	public UserDTO showUserById(Long id);
	
	public List<UserDTO> findAll();
	
	
	public UserDTO finbById(Long id);
	
	public UserDTO saveUser(UserDTO userDTO);
	
	public UserDTO updateUser(UserDTO userDTO);
	
	public void deleteUser(Long[] ids);
	
	boolean existsByUserName(String userName);
	
	boolean existsByEmail(String email);
	
	public UserDTO saveCustomer(UserDTO userDTO);
	
	public UserDTO updateCustomer(UserDTO userDTO);
	
	public UserDTO updatePassword(UserDTO userDTO);
	public long totalAmountOfUsers();
	
	
}
