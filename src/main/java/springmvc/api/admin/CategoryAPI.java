package springmvc.api.admin;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import springmvc.dto.CategoryDTO;
import springmvc.service.ICategoryService;

@RestController
@RequestMapping(value = "/api/category")
public class CategoryAPI {
	
	@Autowired
	private ICategoryService categoryService;

	@PostMapping
	public CategoryDTO saveCategory(@Valid @RequestBody CategoryDTO categoryDTO) {
		return categoryService.saveCategory(categoryDTO);
	}
	@DeleteMapping
	public void deleteCategory(@RequestBody CategoryDTO categoryDTO) {
		categoryService.delteCategory(categoryDTO.getIds());
	}
	@PutMapping
	public CategoryDTO updateCategory(@Valid @RequestBody CategoryDTO categoryDTO ) {
		return categoryService.updateCategory(categoryDTO);
		
	}
	// check name match with name in db ? true : false
	@GetMapping("/checkName")
	public boolean checkCateogryName(@RequestParam String name) {
		List<CategoryDTO> list = categoryService.showCategorys();
		for (CategoryDTO categoryDTO : list) {
			if (categoryDTO.getName().equalsIgnoreCase(name)) {
				return false;
			}
		}	
		return true;
	}
}
