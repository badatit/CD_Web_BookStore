package springmvc.repository.custom.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.Pageable;

import springmvc.dto.request.BookSQLDTO;
import springmvc.dto.request.SearchBookDTO;
import springmvc.entity.BookEntity;
import springmvc.repository.custom.BookRepositoryCustom;

public class BookRepositoryImpl implements BookRepositoryCustom {

	@PersistenceContext
	private EntityManager entityManager;
	
	private String get_sql;
	@SuppressWarnings("unchecked")
	@Override
	public List<BookEntity> findAll(SearchBookDTO searchBookDTO) {
		StringBuilder sql = new StringBuilder("select * from book");
		sql.append(" where 1=1 ");
		
		if (searchBookDTO.getIssuingCompany() != null && searchBookDTO.getIssuingCompany().length > 0) {
			int i = 0;
			sql.append(" and (");
			for (String item : searchBookDTO.getIssuingCompany()) {
				if (i == 0) {
					sql.append("issuingcompany like '%" + item + "%'");
				} else {
					sql.append(" OR issuingcompany like '%" + item + "%'");
				}
				i++;
			}
			sql.append(")");
		}
		if (StringUtils.isNotBlank(searchBookDTO.getPrice())) { // 0,80000 //80000,150000
			String[] item = searchBookDTO.getPrice().split(",");

			if (StringUtils.isNotBlank(item[0])) {
				sql.append(" and price > " + item[0]);

			}
			if (StringUtils.isNotBlank(item[1])) {
				sql.append(" and price <= " + item[1]);

			}

		}
		if (searchBookDTO.getCoverType() != null && searchBookDTO.getCoverType().length > 0) {
			int i = 0;
			sql.append(" and (");
			for (String item : searchBookDTO.getCoverType()) {
				if (i == 0) {
					sql.append("covertype like '%" + item + "%'");
				} else {
					sql.append(" OR covertype like '%" + item + "%'");
				}
				i++;
			}
			sql.append(")");
		}
		Query query = entityManager.createNativeQuery(sql.toString(), BookEntity.class);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BookEntity> findAll(Pageable pageable , SearchBookDTO  searchBookDTO){
		StringBuilder sql = new StringBuilder("select * from book b");
		
		sql.append(" where 1=1 ");
		
		if(searchBookDTO.getCategoryId() != null) {
			if(searchBookDTO.getCategoryId() == 0) {
				sql.append(" ");
			}else {
				sql.append(" and b.categoryid=" + searchBookDTO.getCategoryId());
			}
			
		}
		
		if(StringUtils.isNotBlank(searchBookDTO.getSearchName())) {
			sql.append(" and b.name like '%" + searchBookDTO.getSearchName()+ "%'");
		}
		
		if (searchBookDTO.getIssuingCompany() != null && searchBookDTO.getIssuingCompany().length > 0) {
			int i = 0;
			sql.append(" and (");
			for (String item : searchBookDTO.getIssuingCompany()) {
				if (i == 0) {
					sql.append("b.issuingcompany like '%" + item + "%'");
				} else {
					sql.append(" OR b.issuingcompany like '%" + item + "%'");
				}
				i++;
			}
			sql.append(")");
		}
		if (StringUtils.isNotBlank(searchBookDTO.getPrice())) { // 0,80000 //80000,150000
			String[] item = searchBookDTO.getPrice().split(",");

			if (StringUtils.isNotBlank(item[0])) {
				sql.append(" and price > " + item[0]);

			}
			if (StringUtils.isNotBlank(item[1])) {
				sql.append(" and price <= " + item[1]);

			}

		}
		if (searchBookDTO.getCoverType() != null && searchBookDTO.getCoverType().length > 0) {
			int i = 0;
			sql.append(" and (");
			for (String item : searchBookDTO.getCoverType()) {
				if (i == 0) {
					sql.append("covertype like '%" + item + "%'");
				} else {
					sql.append(" OR covertype like '%" + item + "%'");
				}
				i++;
			}
			sql.append(")");
		}
		get_sql = sql.toString();
		sql.append(" limit " + pageable.getOffset() + "," + pageable.getPageSize());
		
		Query query = entityManager.createNativeQuery(sql.toString(), BookEntity.class);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public int getSizeSql() {
		Query query = entityManager.createNativeQuery(get_sql, BookEntity.class);
		List<BookEntity> list = query.getResultList();
		return list.size();
	}
}
