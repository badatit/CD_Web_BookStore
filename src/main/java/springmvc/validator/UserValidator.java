package springmvc.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import springmvc.entity.UserEntity;
import springmvc.service.IUserService;


@Component
public class UserValidator implements Validator {
	
	@Autowired
	private IUserService userService;
	

	@Override
	public boolean supports(Class<?> clazz) {
		
		return UserEntity.class.equals(clazz);
	}

	@Override
	public void validate(Object o, Errors errors) {
		
		UserEntity userEntity = (UserEntity) o;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName", "NotEmpty");
		if(userEntity.getUserName().length() < 6 || userEntity.getUserName().length() > 32) {
			errors.rejectValue("userName", "Size.userForm.userName");
		}
//		if(userService.findByUsername(userEntity.getUserName()) != null) {
//			errors.rejectValue("userName", "Duplicate.userForm.userName");
//		}
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
//		if(userEntity.getPassword().length()> 8 || userEntity.getPassword().length() < 32 ) {
//			 errors.rejectValue("password", "Size.userForm.password");
//		}
//		if(!userEntity.getRepeatPass().equals(userEntity.getPassword())) {
//			errors.rejectValue("repeatPass", "Diff.userForm.repeat_pass");
//		}
		
	}

}
