package springmvc.service;

import java.util.List;
import java.util.Map;

import springmvc.dto.CategoryDTO;

public interface ICategoryService {
	public List<CategoryDTO> showCategorys();
	public CategoryDTO saveCategory(CategoryDTO categoryDTO);
	Map<String,String> getStatus();
	public CategoryDTO findOneById(Long id);
	public void delteCategory(Long[] ids);
	public CategoryDTO updateCategory(CategoryDTO categoryDTO);
	public long totalAmountOfCategorys();
}
