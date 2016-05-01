package com.aastha.myapp.controller;


import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.aastha.myapp.pojo.User;

import org.springframework.validation.ValidationUtils;

@Component
public class UserValidator implements Validator{

	@Override
	public boolean supports(Class aClass) {
		
		return aClass.equals(User.class);
	}

    public void validate(Object obj, Errors errors)
    {
        User user = (User) obj;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "error.invalid.firstName", "First Name Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "error.invalid.lastName", "Last Name Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "error.invalid.username", "User Name Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "error.invalid.password", "Password Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "gender", "error.invalid.gender", "Gender Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "roleType", "error.invalid.roleType", "Role Type Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email.emailId", "error.invalid.email.emailId", "Email Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "location.locationname", "error.invalid.location.locationname", "Location Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "category.categoryName", "error.invalid.categoryName.categoryName", "Category Required");
        
    }
}
