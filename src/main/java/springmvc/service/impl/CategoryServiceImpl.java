package springmvc.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.modelmapper.config.Configuration.AccessLevel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springmvc.Enums.StatusEnum;
import springmvc.converter.CategoryConverter;
import springmvc.dto.CategoryDTO;
import springmvc.entity.CategoryEntity;
import springmvc.repository.CategoryRepository;
import springmvc.service.ICategoryService;

@Service
public class CategoryServiceImpl implements ICategoryService {

	@Autowired
	private CategoryRepository categoryRepository;

	@Autowired
	private CategoryConverter categoryConverter;

	@Override
	public List<CategoryDTO> showCategorys() {
		List<CategoryEntity> categoryEntity = categoryRepository.findAll();
		List<CategoryDTO> categoryDTOs = new ArrayList<>();
		for (CategoryEntity item : categoryEntity) {
			categoryDTOs.add(categoryConverter.converterToDTO(item));
		}
		return categoryDTOs;
	}
	@Override
	public long totalAmountOfCategorys() {
		return categoryRepository.count();
	}
	@Override
	@Transactional
	public CategoryDTO saveCategory(CategoryDTO categoryDTO) {
		CategoryEntity categoryEntity = categoryRepository.save(categoryConverter.converterToEntity(categoryDTO));
		categoryDTO = categoryConverter.converterToDTO(categoryEntity);
		return categoryDTO;
	}

	@Override
	public Map<String, String> getStatus() {
		Map<String, String> status = new HashMap<>();
		for (StatusEnum item : StatusEnum.values()) {
			status.put(item.toString(), item.getStatusValue());
		}
		return status;
	}

	@Override
	public CategoryDTO findOneById(Long id) {
		CategoryEntity categoryEntity = categoryRepository.findOne(id);
		return categoryConverter.converterToDTO(categoryEntity);
	}

	@Override
	@Transactional
	public void delteCategory(Long[] ids) {
		for (Long item : ids) {
			categoryRepository.delete(item);
		}
	}

	@Override
	@Transactional
	// spring data jpa 4.0 findOne   save(id == null) save(id != null)
	// spring data jpa 5.0 findById save update

	// name : hi id= 1
	public CategoryDTO updateCategory(CategoryDTO categoryDTO) {
		CategoryEntity categoryEntity = categoryRepository.findOne(categoryDTO.getId());
		ModelMapper modelMapper = new ModelMapper();	
		modelMapper.getConfiguration().setFieldMatchingEnabled(true).setFieldAccessLevel(AccessLevel.PRIVATE);
		modelMapper.addMappings(new PropertyMap<CategoryDTO, CategoryEntity>() {
			@Override
			protected void configure() {
				skip(destination.getId());
				skip(destination.getCreatedBy());
				skip(destination.getCreatedDate());
				skip(destination.getModifiedBy());
				skip(destination.getModifiedDate());
			}
		});
		modelMapper.map(categoryDTO, categoryEntity);
		return categoryConverter.converterToDTO(categoryRepository.save(categoryEntity));

	}

}
