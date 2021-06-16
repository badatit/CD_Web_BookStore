package springmvc.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.modelmapper.config.Configuration.AccessLevel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import springmvc.constant.SystemConstant;
import springmvc.converter.UserConverter;
import springmvc.dto.OrderDTO;
import springmvc.dto.UserDTO;
import springmvc.entity.RoleEntity;
import springmvc.entity.UserEntity;
import springmvc.repository.OrderRepository;
import springmvc.repository.RoleRepsitory;
import springmvc.repository.UserRepository;
import springmvc.service.IUserService;

@Service
public class UserServiceImpl implements IUserService{
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepsitory roleRepsitory;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Autowired
	private OrderRepository orderRepository;
	
	private UserConverter userConverter = new UserConverter();

	@Override
	public UserDTO showUserById(Long id) {
		UserEntity entity =userRepository.findOne(id);
		return userConverter.converterToDTO(entity) ;
	}

	@Override
	public List<UserDTO> findAll() {
		List<UserEntity> listUsers = userRepository.findAll();
		List<UserDTO> dtos = new ArrayList<>();
		
		for (UserEntity item : listUsers) {
			List<RoleEntity> listRole = item.getRoles();
			UserDTO userDTO = userConverter.converterToDTO(item);
			userDTO.setRoleName(listRole.getClass().getName());
			dtos.add(userDTO);
		}
		return dtos;
	}

	@Override
	public UserDTO finbById(Long id) {
		return userConverter.converterToDTO(userRepository.findOne(id));
	}

	@Override
	@Transactional
	public UserDTO saveUser(UserDTO userDTO) {
		// gui role thong qua : id : 2
		RoleEntity roleEntity = roleRepsitory.findOne(userDTO.getRoleId());
		List<RoleEntity> listRoleEntities = new ArrayList<RoleEntity>();
		listRoleEntities.add(roleEntity);
		UserEntity entity = userConverter.converterToEntity(userDTO);
		entity.setRoles(listRoleEntities);
		entity.setPassword(encoder.encode(entity.getPassword()));
		UserEntity userEntity = userRepository.save(entity);
		return userConverter.converterToDTO(userEntity);
	}
	

	@Override
	@Transactional
	public UserDTO updateUser(UserDTO userDTO) {
		UserEntity userEntity = userRepository.findOne(userDTO.getId());
		ModelMapper modelMapper = new ModelMapper();
		modelMapper.getConfiguration().setFieldMatchingEnabled(true).setFieldAccessLevel(AccessLevel.PRIVATE);
		modelMapper.addMappings(new PropertyMap<UserDTO, UserEntity>() {

			@Override
			protected void configure() {
				skip(destination.getId());
				skip(destination.getCreatedBy());
				skip(destination.getCreatedDate());
				skip(destination.getModifiedBy());
				skip(destination.getModifiedDate());
		 		
			}
		});
		RoleEntity roleEntity = roleRepsitory.findOne(userDTO.getRoleId());
		List<RoleEntity> listRoleEntities = new ArrayList<RoleEntity>();
		listRoleEntities.add(roleEntity);
		userEntity.setRoles(listRoleEntities);
		modelMapper.map(userDTO,userEntity);
		return userConverter.converterToDTO(userRepository.save(userEntity));
	}

	@Override
	@Transactional
	public void deleteUser(Long[] ids) {
		for (Long item : ids) {
			userRepository.delete(item);
		}
	}

	@Override
	public boolean existsByUserName(String userName) {
		return userRepository.existsByUserName(userName);
	}

	@Override
	public boolean existsByEmail(String email) {
		 return userRepository.existsByEmail(email);
	}
	

	// save web
	@Override
	@Transactional
	public UserDTO saveCustomer(UserDTO userDTO) {
		RoleEntity roleEntity = roleRepsitory.findOne((long) 2);
		List<RoleEntity> listRoleEntities = new ArrayList<RoleEntity>();
		listRoleEntities.add(roleEntity);
		UserEntity entity = userConverter.converterToEntity(userDTO);
		entity.setRoles(listRoleEntities);
		entity.setPassword(encoder.encode(entity.getPassword()));
		entity.setStatus(SystemConstant.ACTIVE_STATUS);
		UserEntity userEntity = userRepository.save(entity);
		return userConverter.converterToDTO(userEntity);
	}

	@Override
	public UserDTO updateCustomer(UserDTO userDTO) {
		UserEntity userEntity = userRepository.findOne(userDTO.getId());
		ModelMapper modelMapper = new ModelMapper();
		modelMapper.getConfiguration().setFieldMatchingEnabled(true).setFieldAccessLevel(AccessLevel.PRIVATE);
		modelMapper.addMappings(new PropertyMap<UserDTO, UserEntity>() {

			@Override
			protected void configure() {
				skip(destination.getId());
				skip(destination.getCreatedBy());
				skip(destination.getCreatedDate());
				skip(destination.getModifiedBy());
				skip(destination.getModifiedDate());
		 		skip(destination.getPassword());
		 		skip(destination.getStatus());
			}
		});
		
		modelMapper.map(userDTO,userEntity);
		return userConverter.converterToDTO(userRepository.save(userEntity));
	}

	@Override
	public UserDTO updatePassword(UserDTO userDTO) {
		UserEntity userEntity = userRepository.findOne(userDTO.getId());
		ModelMapper modelMapper = new ModelMapper();
		modelMapper.getConfiguration().setFieldMatchingEnabled(true).setFieldAccessLevel(AccessLevel.PRIVATE);
		modelMapper.addMappings(new PropertyMap<UserDTO, UserEntity>() {

			@Override
			protected void configure() {
				skip(destination.getId());
				skip(destination.getCreatedBy());
				skip(destination.getCreatedDate());
				skip(destination.getModifiedBy());
				skip(destination.getModifiedDate());
				skip(destination.getFullName());
				skip(destination.getUserName());
				skip(destination.getEmail());
				skip(destination.getStatus());
				skip(destination.getAddress());
				skip(destination.getPhoneNumber());
			}
		});
		
		modelMapper.map(userDTO,userEntity);
		userEntity.setPassword(encoder.encode(userEntity.getPassword()));
		return userConverter.converterToDTO(userRepository.save(userEntity));
	}

	@Override
	public long totalAmountOfUsers() {
		return userRepository.count();
	}



}
