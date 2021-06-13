package springmvc.service;

import java.util.List;
import java.util.Map;

import springmvc.dto.RoleDTO;


public interface IRoleService {
	Map<String, String> getStatus();
	public List<RoleDTO> findAll();
	

}
