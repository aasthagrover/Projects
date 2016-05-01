package com.aastha.myapp.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.aastha.myapp.dao.UserDAO;
import com.aastha.myapp.exception.AdException;
import com.aastha.myapp.pojo.User;



@Controller
@RequestMapping("/signup.htm")
public class SignUpFormController {
	
	@Autowired
	@Qualifier("userDAO")
	UserDAO userdao;
	
	@RequestMapping(method = RequestMethod.GET)
	public String initializeForm(@ModelAttribute("user") User user, BindingResult result) {

		return "SignUp";
	}
	
	@Autowired
	@Qualifier("userValidator")
	UserValidator validator;

	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}

	@RequestMapping(method = RequestMethod.POST)
	protected String doSubmitAction(@ModelAttribute("user") User user, BindingResult result) throws Exception {
		validator.validate(user, result);
		if (result.hasErrors()) {
			return "SignUp";
		}
		
		//UserDAO userdao=new UserDAO();
		
		User user1=userdao.create(user.getFirstName(),user.getLastName(),user.getUsername(), user.getPassword(), user.getEmail(),user.getRoleType(),user.getGender(),user.getLocation(),user.getCategory());
		
		return "Added";
		
//	 @RequestMapping(value = "/addUser.htm",method = RequestMethod.GET) 
//	    public ModelAndView personPage(@ModelAttribute("user") User user,
//                BindingResult result) {  
//
//	        return new ModelAndView("home", "user", new User());  
//	    } 

	
//	@RequestMapping(method=RequestMethod.POST)
//    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		
//		System.out.print("test1");
//		return null;
//	}
	
	
	
	
//	@RequestMapping(method = RequestMethod.POST)
//	  protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
//	       PrintWriter out = response.getWriter();
//	        String action=request.getParameter("action");
//	        ModelAndView mv=new ModelAndView();
//	        if (action.equals("signup")) {
//	        	
//	        	
//	        	mv=null;
//
//	        JSONObject obj=new JSONObject();
//	        String view="view";
//	        obj.put("file",view);
//	        PrintWriter ouit=response.getWriter();
//	        ouit.print(obj);
//	        }  
//			
//	     return mv;
//	}

	}
}
	
