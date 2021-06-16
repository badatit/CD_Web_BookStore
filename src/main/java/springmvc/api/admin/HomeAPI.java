package springmvc.api.admin;

import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import springmvc.Utils.UploadFileUtils;
import springmvc.dto.UploadFileDTO;
import springmvc.repository.BookRepository;
import springmvc.repository.CategoryRepository;

@RestController
@RequestMapping(value = "/api/admin")
public class HomeAPI {
	
	@Autowired
	private UploadFileUtils upload;
	
	@Autowired 
	private CategoryRepository categoryRepository;
	
	@Autowired
	private BookRepository bookRepository;

    @PostMapping(value="/home")
    public ResponseEntity<Void> uploadFile(@RequestBody UploadFileDTO uploadFileDTO){
    	byte[] decode = Base64.getDecoder().decode(uploadFileDTO.getBase64().getBytes());
    	upload.writeOrUpdate(decode, "/thumbnail/"+uploadFileDTO.getName());
		return ResponseEntity.noContent().build();
    }
    
    @GetMapping("/statisticalBook")
    public List<?> counBookByCategory(){
    	return categoryRepository.countBookByCategory() ;
    }
    @GetMapping("/statisticalBookByIssuingcompany")
    public List<?> counBookByIssuingcompany(){
    	return bookRepository.countBookByIssuingcompany();
    
    }
}
