package springmvc.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springmvc.Enums.StatusEnum;
import springmvc.converter.RoleConverter;
import springmvc.dto.RoleDTO;
import springmvc.entity.RoleEntity;
import springmvc.repository.RoleRepsitory;
import springmvc.service.IRoleService;

@Service
public class RoleServiceImpl implements IRoleService {
	
	@Autowired
	private RoleRepsitory rolerepsitory;
	

	private RoleConverter roleConverter = new RoleConverter();

	@Override
	public Map<String, String> getStatus() {
		Map<String, String> status = new HashMap<>();
		for (StatusEnum item : StatusEnum.values()) {
			status.put(item.toString(), item.getStatusValue());
		}
		return status;
	}

	@Override
	public List<RoleDTO> findAll() {
		List<RoleEntity> listRoles = rolerepsitory.findAll();
		List<RoleDTO> dtos = new ArrayList<>();
		for (RoleEntity item : listRoles) {
			dtos.add(roleConverter.converterToDTO(item));
		}
		return dtos;
	}

}
