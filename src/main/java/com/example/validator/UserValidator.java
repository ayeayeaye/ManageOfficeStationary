package com.example.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.example.model.User;

@Component
public class UserValidator implements Validator {

	
	
	@Override
	public boolean supports(Class<?> arg0) {
		return User.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object obj, Errors error) {
		
		User u = (User)obj;
		
		ValidationUtils.rejectIfEmpty(error, "userName", "error.user.username.empty");
		ValidationUtils.rejectIfEmpty(error, "password", "error.user.password.empty");
		
	}

}
