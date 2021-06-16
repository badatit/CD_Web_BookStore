package springmvc.api.admin;

import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
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

import springmvc.Utils.UploadFileUtils;
import springmvc.dto.BookDTO;
import springmvc.service.IBookService;

@RestController
@RequestMapping(value = "/api/book")
public class BookAPI {

	@Autowired
	private IBookService bookService;

	@Autowired
	private UploadFileUtils uploadFileUtils;

	@SuppressWarnings("unchecked")
	@PostMapping
	public BookDTO saveBook(@RequestBody BookDTO bookDTO) {
		Map<String, String > paramsImage = new HashMap<String, String>();
		if (StringUtils.isNotBlank(bookDTO.getBase64_1()) && StringUtils.isNotBlank(bookDTO.getImg1())) {
			paramsImage.put(bookDTO.getImg1(), bookDTO.getBase64_1());
		}
		if (StringUtils.isNotBlank(bookDTO.getBase64_2()) && StringUtils.isNotBlank(bookDTO.getImg2())) {
			paramsImage.put(bookDTO.getImg2(), bookDTO.getBase64_2());
		}
		if (StringUtils.isNotBlank(bookDTO.getBase64_3()) && StringUtils.isNotBlank(bookDTO.getImg3())) {
			paramsImage.put(bookDTO.getImg3(), bookDTO.getBase64_3());
		}
		if (StringUtils.isNotBlank(bookDTO.getBase64_4()) && StringUtils.isNotBlank(bookDTO.getImg4())) {
			paramsImage.put(bookDTO.getImg4(), bookDTO.getBase64_4());
		}
		uploadFile(paramsImage);
		return bookService.saveBook(bookDTO);
	}

	@PutMapping
	public BookDTO updateBook(@RequestBody BookDTO bookDTO) {
//		uploadFile(bookDTO);
		return bookService.updateBook(bookDTO);
	}

	@DeleteMapping
	public void deleteBook(@RequestBody BookDTO bookDTO) {
		bookService.deleteBooks(bookDTO.getIds());
	}
	@GetMapping("/checkNameMatch")
	public boolean checkNameMatch(@RequestParam String name) {
		List<BookDTO> dtos = bookService.findAll();
		for (BookDTO bookDTO : dtos) {
			if (bookDTO.getName().equalsIgnoreCase(name)) {
				return false;
			}
		}
		return true;
	}

	@RequestMapping(value = "/find/{id}", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<BookDTO> find(@PathVariable("id") Long id) {
		try {
			return new ResponseEntity<BookDTO>(bookService.findById(id), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<BookDTO>(HttpStatus.BAD_REQUEST);
		}
	}
		// map<key , value > param -- > truyền base64 va img1
	public void uploadFile(Map<String, String> params) {
		for (Map.Entry<String, String> entry : params.entrySet()) {
			byte[] decodeBase64 = Base64.getDecoder().decode(entry.getValue().split(",")[1].getBytes());
			uploadFileUtils.writeOrUpdate(decodeBase64, "/thumbnail/" + entry.getKey());
		}
	}

}
