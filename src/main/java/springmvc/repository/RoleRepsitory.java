package springmvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import springmvc.entity.RoleEntity;

public interface RoleRepsitory  extends JpaRepository<RoleEntity, Long>{

}
