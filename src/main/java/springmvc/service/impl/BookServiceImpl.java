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
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import springmvc.Enums.CoverTypesEnums;
import springmvc.Utils.SecurityUtils;
import springmvc.converter.BookConverter;
import springmvc.dto.BookDTO;
import springmvc.dto.MyUser;
import springmvc.dto.request.SearchBookDTO;
import springmvc.entity.BookEntity;
import springmvc.entity.BookFavoriteEntity;
import springmvc.entity.CategoryEntity;
import springmvc.repository.BookFavoriteRepository;
import springmvc.repository.BookRepository;
import springmvc.repository.CategoryRepository;
import springmvc.service.IBookService;

@Service
public class BookServiceImpl implements IBookService {
	@Autowired
	private BookRepository bookRepository;

	@Autowired
	private CategoryRepository categoryRepository;

	@Autowired
	private BookFavoriteRepository bookFavoriteRepository;

	private BookConverter bookConverter = new BookConverter();

	

	@Override
	public List<BookDTO> findAll() {
		List<BookEntity> listBooks = bookRepository.findAll();
		List<BookDTO> dtos = new ArrayList<>();
		for (BookEntity item : listBooks) {
			CategoryEntity categoryEntity = item.getCategory();
			BookDTO bookDTO = bookConverter.converterToDTO(item);
			bookDTO.setCategoryName(categoryEntity.getName());
			dtos.add(bookDTO);
		}
		return dtos;
	}
	@Override
	@Transactional
	public BookDTO updateBook(BookDTO bookDTO) {
		BookEntity bookEntity = bookRepository.findOne(bookDTO.getId());
		ModelMapper modelMapper = new ModelMapper();
		modelMapper.getConfiguration().setFieldMatchingEnabled(true).setFieldAccessLevel(AccessLevel.PRIVATE);
		modelMapper.addMappings(new PropertyMap<BookDTO, BookEntity>() {
			@Override
			protected void configure() {
				skip(destination.getId());
				skip(destination.getCreatedBy());
				skip(destination.getCreatedDate());
				skip(destination.getModifiedBy());
				skip(destination.getModifiedDate());
				skip(destination.getImg1());
				skip(destination.getImg2());
				skip(destination.getImg3());
				skip(destination.getImg4());
			}
		});
		modelMapper.map(bookDTO, bookEntity);
		return bookConverter.converterToDTO(bookRepository.save(bookEntity));
	}

	@Override
	@Transactional
	public BookDTO saveBook(BookDTO bookDTO) {
		BookEntity entity = bookConverter.converterToEntity(bookDTO);
		entity.setImg1(bookDTO.getBase64_1());
		entity.setImg2(bookDTO.getBase64_2());
		entity.setImg3(bookDTO.getBase64_3());
		entity.setImg4(bookDTO.getBase64_4());
		if (bookDTO.getCategoryId() != null) {
			CategoryEntity categoryEntity = categoryRepository.findOne(bookDTO.getCategoryId());
			entity.setCategory(categoryEntity);
		}
		BookEntity bookEntity = bookRepository.save(entity);
		return bookConverter.converterToDTO(bookEntity);
	}

	@Override
	public BookDTO findById(Long id) {
		return bookConverter.converterToDTO(bookRepository.findOne(id));
	}

	@Override
	@Transactional
	public void deleteBooks(Long[] ids) {
		for (Long item : ids) {
			bookRepository.delete(item);
		}

	}

	@Override
	public List<BookDTO> showBookByCategory(Long id, Pageable pageable) {
		CategoryEntity categoryEntity = categoryRepository.findOne(id);
		List<BookEntity> listBooks = bookRepository.findAll(pageable).getContent();
		List<BookDTO> dtos = new ArrayList<>();
		for (BookEntity item : listBooks) {
			BookDTO bookDTO = bookConverter.converterToDTO(item);
			if (bookDTO.getCategoryId() == categoryEntity.getId()) {
				dtos.add(bookDTO);
			}
		}
		return dtos;
	}

	@Override
	public List<BookDTO> findAllPage(Pageable pageable, SearchBookDTO searchBookDTO) {
		List<BookEntity> listBooks = bookRepository.findAll(pageable, searchBookDTO);
		List<BookDTO> dtos = new ArrayList<>();
		for (BookEntity item : listBooks) {
			CategoryEntity categoryEntity = item.getCategory();
			BookDTO bookDTO = bookConverter.converterToDTO(item);
			bookDTO.setCategoryName(categoryEntity.getName());
			dtos.add(bookDTO);
		}
		return dtos;
	}

	@Override
	public int getTotalItem() {
		return (int) bookRepository.count();
	}

	@Override
	public List<BookDTO> findAllOrderByPriceASC() {
		MyUser myUser = SecurityUtils.getPrincipal();
		List<BookEntity> listBooks = bookRepository.findAllOrderByPriceASC();
		List<BookDTO> listDTO = new ArrayList<>();
		for (BookEntity item : listBooks) {
			BookDTO bookDTO = bookConverter.converterToDTO(item);
			bookDTO.setFavorite(null);
			if (myUser == null) {
				bookDTO.setFavorite(null);
			}else {
				List<BookFavoriteEntity> bookFavoriteEntities = bookFavoriteRepository.findByUser(myUser.getId());
				for (BookFavoriteEntity bookFavoriteEntity : bookFavoriteEntities) {
					if (bookFavoriteEntity.getBookEntity().getId() == item.getId()) {
						bookDTO.setFavorite("OK");
					}
				}
			}
			listDTO.add(bookDTO);
		}
		return listDTO;
	}

	@Override
	public List<BookDTO> findAllOrderByPriceDESC() {
		MyUser myUser = SecurityUtils.getPrincipal();
		List<BookEntity> listBooks = bookRepository.findAllOrderByPriceDESC();
		List<BookDTO> listDTO = new ArrayList<>();
		for (BookEntity item : listBooks) {
			BookDTO bookDTO = bookConverter.converterToDTO(item);
			bookDTO.setFavorite(null);
			if (myUser == null) {
				bookDTO.setFavorite(null);
			}else {
				List<BookFavoriteEntity> bookFavoriteEntities = bookFavoriteRepository.findByUser(myUser.getId());
				for (BookFavoriteEntity bookFavoriteEntity : bookFavoriteEntities) {
					if (bookFavoriteEntity.getBookEntity().getId() == item.getId()) {
						bookDTO.setFavorite("OK");
					}
				}
			}
			listDTO.add(bookDTO);
		}
		return listDTO;
	}

	@Override
	@Transactional
	public List<BookDTO> findByNameAndCategoryAndPage(String name, String categoryName, Pageable pageable) {
		List<BookEntity> listBooks = bookRepository.findByNameAndCategoryAndPage(name, categoryName, pageable);
		List<BookDTO> listDTO = new ArrayList<>();
		for (BookEntity item : listBooks) {
			BookDTO bookDTO = bookConverter.converterToDTO(item);
			listDTO.add(bookDTO);
		}
		return listDTO;
	}

	@Override
	@Transactional
	public List<BookDTO> findByName(String name) {
		List<BookEntity> listBooks = bookRepository.findByName(name);
		List<BookDTO> listDTO = new ArrayList<>();
		for (BookEntity item : listBooks) {
			BookDTO bookDTO = bookConverter.converterToDTO(item);
			listDTO.add(bookDTO);
		}
		return listDTO;
	}

	@Override
	@Transactional
	public List<BookDTO> findByIssuingcompany(String issuingcompany) {
		List<BookEntity> listBooks = bookRepository.findByIssuingcompany(issuingcompany);
		List<BookDTO> listDTO = new ArrayList<>();
		for (BookEntity item : listBooks) {
			BookDTO bookDTO = bookConverter.converterToDTO(item);
			listDTO.add(bookDTO);
		}
		return listDTO;
	}

	@Override
	public List<BookDTO> findAll(SearchBookDTO searchBookDTO) {
		List<BookEntity> listBook = bookRepository.findAll(searchBookDTO);
		List<BookDTO> listDTO = new ArrayList<>();
		for (BookEntity bookEntity : listBook) {
			BookDTO bookDTO = bookConverter.converterToDTO(bookEntity);
			listDTO.add(bookDTO);
		}
		return listDTO;
	}

	@Override
	public List<String> findAllIssuingcompany() {

		return bookRepository.findAllIssuingcompany();
	}

	@Override
	public List<String> findAllCoverType() {
		return bookRepository.findAllCoverType();
	}

	@Override
	public List<BookDTO> findByNameAndCategory(SearchBookDTO searchBookDTO) {
		List<BookEntity> listBooks = bookRepository.findByNameAndCategory(searchBookDTO.getSearchName(),
				searchBookDTO.getCategoryName());
		List<BookDTO> listDTO = new ArrayList<>();
		for (BookEntity item : listBooks) {
			BookDTO bookDTO = bookConverter.converterToDTO(item);
			listDTO.add(bookDTO);
		}
		return listDTO;
	}

	@Override
	public List<Integer> years() {
		List<Integer> listYears = new ArrayList<>();
		for (int i = 1980; i <= 2021; i++) {
			listYears.add(i);
		}
		return listYears;
	}

	@Override
	public Map<String, String> getCoverTypes() {
		Map<String, String> coverTypes = new HashMap<>();
		for (CoverTypesEnums item : CoverTypesEnums.values()) {
			coverTypes.put(item.toString(), item.getCoverTypesValue());
		}
		return coverTypes;
	}

	@Override
	public long totalAmountOfBooks() {
		long result = bookRepository.count();
		return result;
	}

	@Override
	public long totalAmountOfBooksByActive() {
		return bookRepository.countByStatus("active");
	}

	@Override
	public long totalAmountOfBooksByInactive() {
		return bookRepository.countByStatus("inactive");
	}
	@Override
	public List<BookDTO> findAllByHigPrice() {
		MyUser myUser = SecurityUtils.getPrincipal();
		List<BookEntity> listBooks = bookRepository.findAllByHighPrice();
		List<BookDTO> listDTO = new ArrayList<>();
		for (BookEntity item : listBooks) {
			BookDTO bookDTO = bookConverter.converterToDTO(item);
			bookDTO.setFavorite(null);
			if (myUser == null) {
				bookDTO.setFavorite(null);
			}else {
				List<BookFavoriteEntity> bookFavoriteEntities = bookFavoriteRepository.findByUser(myUser.getId());
				for (BookFavoriteEntity bookFavoriteEntity : bookFavoriteEntities) {
					if (bookFavoriteEntity.getBookEntity().getId() == item.getId()) {
						bookDTO.setFavorite("OK");
					}
				}
			}
			listDTO.add(bookDTO);
		}
		return listDTO;
	}
}
