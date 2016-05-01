package com.aastha.myapp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.aastha.myapp.dao.EntrepreneurInvestorDAO;
import com.aastha.myapp.dao.UserDAO;
import com.aastha.myapp.pojo.EntrepreneurInvestor;
import com.aastha.myapp.pojo.EntrepreneurRole;
import com.aastha.myapp.pojo.ExpertRole;
import com.aastha.myapp.pojo.InvestorRole;
import com.aastha.myapp.pojo.User;



@Controller
@RequestMapping("/signIn.htm")
public class SignInFormController {
	
	@Autowired
	@Qualifier("userDAO")
	UserDAO userdao;
	Cookie rememberMe1;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		 HttpSession session=request.getSession();
		String action=request.getParameter("action");
		
		
		if(action.equals("logout")){
			 session.invalidate();
			mv.setViewName("Menu");
			response.addCookie(rememberMe1);
			mv.addObject("message","User has been Successfully Logged Out");
		}
		else if(action.equals("forgot")){
			
			mv.setViewName("ForgotPassword");
		}
		
     return mv;
	}
	
	

	@RequestMapping(method=RequestMethod.POST)
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		User user=null;
		ModelAndView mv = new ModelAndView();
		
//	    String rememberMe=request.getParameter("rememberMe");
//	    System.out.println(rememberMe);
	    
//	    rememberMe1 = new Cookie("rememberMe",request.getParameter("rememberMe"));
//	    response.addCookie(rememberMe1);

	    
		String usern=request.getParameter("usern");
	    String action1=request.getParameter("action");

	    if(action1.equals("login")){
	    	String username=request.getParameter("username");
			String password=request.getParameter("password");
		
		user=userdao.login(username, password);
		
		
		if(user==null){
			String error="Invalid credentials";
			mv.setViewName("Menu");
			mv.addObject("Error",error);
		}
		
		else if(user!=null){
			int userID=user.getUserID();
			if(user.getRoleType().equals("Entrepreneur")){
				mv.addObject("user",(EntrepreneurRole)user);
				mv.addObject("userID",userID);
				mv.	setViewName("Entrepreneur");
	           
			}
			else if(user.getRoleType().equals("Investor")){
				mv.addObject("user",(InvestorRole)user);
				mv.addObject("userID",userID);
				mv.setViewName("Investor");
			}
			else if(user.getRoleType().equals("Expert")){
				mv.addObject("user",(ExpertRole)user);
				mv.addObject("userID",userID);
				mv.setViewName("Expert");
			}
			
		}
	    }
	    else if(action1.equals("checkusername")){
		
		
		User user1=userdao.checkUsername(usern);
		
		
		if(user1==null){
			JSONObject obj2=new JSONObject();
		      JSONArray jsonArray1 = new JSONArray();
		      String usererror1="Username approved";
		      try {
				obj2.put("username",usererror1);
			
		     jsonArray1.put(obj2);
		     PrintWriter out1=response.getWriter();
		      out1.print(obj2);
		      mv=null;
		      }
		      catch (JSONException e) {
					e.printStackTrace();
				} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		else if(user1.getUsername().equals(usern)){
			 JSONObject obj=new JSONObject();
		      JSONArray jsonArray = new JSONArray();
		      String usererror="Username not available";
		      try {
				obj.put("username",usererror);
			
		     jsonArray.put(obj);
		     PrintWriter out=response.getWriter();
		      out.print(obj);
		      mv=null;
		      }
		      catch (JSONException e) {
					e.printStackTrace();
				} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		      
		}
		
		}
	    else if(action1.equals("forgotpassword")){
	    	
	    	String username=request.getParameter("username");
	    	String password=request.getParameter("password");
	    	String msg=userdao.findByUserName(username, password);
	    	
	    	mv.addObject("msg",msg);
	    	mv.setViewName("ForgotPassword");
	    	
	    }
	    
		
		
		return mv;
	}

	

}
