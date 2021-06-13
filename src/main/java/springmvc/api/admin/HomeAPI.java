package springmvc.api.admin;

import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import springmvc.Utils.UploadFileUtils;
import springmvc.dto.UploadFileDTO;

@RestController
public class HomeAPI {
	
	@Autowired
	private UploadFileUtils upload;

    @PostMapping(value="/api/home")
    public ResponseEntity<Void> uploadFile(@RequestBody UploadFileDTO uploadFileDTO){
    	byte[] decode = Base64.getDecoder().decode(uploadFileDTO.getBase64().getBytes());
    	upload.writeOrUpdate(decode, "/thumbnail/"+uploadFileDTO.getName());
		return ResponseEntity.noContent().build();
    }
}
