package springmvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import springmvc.entity.UserEntity;

public interface UserRepository extends  JpaRepository<UserEntity, Long> {

	UserEntity findOneByUserNameAndStatus(String username, String activeStatus);
	
	boolean existsByUserName(String userName);
	
	boolean existsByEmail(String email);

}
