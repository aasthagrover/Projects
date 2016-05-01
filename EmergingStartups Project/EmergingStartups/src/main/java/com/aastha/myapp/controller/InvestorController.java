package com.aastha.myapp.controller;


import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.aastha.myapp.dao.EntrepreneurDAO;
import com.aastha.myapp.dao.EntrepreneurInvestorDAO;
import com.aastha.myapp.dao.InvestorDAO;
import com.aastha.myapp.pojo.EntrepreneurInvestor;
import com.aastha.myapp.pojo.EntrepreneurRole;
import com.aastha.myapp.pojo.InvestorRole;


@Controller
@RequestMapping("/investor.htm")
public class InvestorController {
	List<EntrepreneurRole> entrepreneurList = new ArrayList();
	
	@Autowired
	@Qualifier("entrepreneurDAO")
	EntrepreneurDAO entrepreneurDAO;
	
	@Autowired
	@Qualifier("investorDAO")
	InvestorDAO investorDAO;
	
	@Autowired
	@Qualifier("entrepreneurInvestorDAO")
	EntrepreneurInvestorDAO entrepreneurInvestorDAO;
	
	@RequestMapping(method=RequestMethod.GET)
	 protected ModelAndView handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 String action=request.getParameter("action"); 
		 System.out.println(action);
		 ModelAndView mv=new ModelAndView();
		if(action.equals("Notifications")){
		    	int userID=Integer.parseInt(request.getParameter("userID"));
		    	List<EntrepreneurRole> notificationlist=entrepreneurInvestorDAO.fetchNotifications(userID);
		    	mv.addObject("list", notificationlist);
		    	mv.addObject("userID", userID);
		    	mv.setViewName("Notifications");
		    } 
		
		return mv;
	 }

	@RequestMapping(method=RequestMethod.POST)
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mv=new ModelAndView();

        String action=request.getParameter("action");
		
		if(action.equals("search")){
		
		List<JSONObject> customlist = new ArrayList();
		String category= request.getParameter("category");
		String roleType=request.getParameter("roleType");
		
		//EntrepreneurDAO entrepreneurDAO=new EntrepreneurDAO();
		entrepreneurList=entrepreneurDAO.fetchEntrepreneurList(category, roleType);
		
		System.out.println(entrepreneurList.size());
		for(int i=0;i<entrepreneurList.size();i++){
			JSONObject obj1=new JSONObject();
			customlist.add(obj1.put("firstName",entrepreneurList.get(i).getFirstName()));
			
		}
		  if(entrepreneurList.size()>0){
            mv=null;
            
      JSONObject obj=new JSONObject();
      JSONArray jsonArray = new JSONArray();
      for (int i=0; i < customlist.size(); i++) {
          jsonArray.put(customlist.get(i));
       }
      obj.put("file",jsonArray);
      PrintWriter out=response.getWriter();
      out.print(obj);
          }
		
		}
		else if(action.equals("saveUser")){
		String investorName=request.getParameter("investorName");
		String investorContact=request.getParameter("investorContact");
		String description=request.getParameter("description");
		int userID= Integer.parseInt(request.getParameter("user"));
		
		//InvestorDAO investorDAO=new InvestorDAO();
		InvestorRole investorRole=investorDAO.saveInvestor(investorName, investorContact,description,userID);
		
		JSONObject obj=new JSONObject();
		List<String> msg = new ArrayList();
	    msg.add("Your Proposal has been submitted successfully");
        obj.put("successmsg",msg);
        PrintWriter out=response.getWriter();
        out.print(obj);
		}
		else if(action.equals("open")){
			String entrepreneurName=request.getParameter("entrepreneurName");
			String userID=request.getParameter("userID");
			//EntrepreneurDAO entrepreneurDAO=new EntrepreneurDAO();
			EntrepreneurRole entrepreneurRole=entrepreneurDAO.searchProfile(entrepreneurName);
			
			mv.addObject("entrepreneur",entrepreneurRole);
			mv.addObject("userID", userID);
			mv.setViewName("Investor");
		      
			}
    else if(action.equals("sendproposal")){
			
			String entrepreneurName=request.getParameter("entrepreneurName");
			String entrepreneurContact=request.getParameter("entrepreneurContact");
			String proposal=request.getParameter("proposal");
			String selfInvestmentShare=request.getParameter("selfInvestmentShare");
			
	        
			int userID=Integer.parseInt(request.getParameter("userID"));
			
			if(entrepreneurName.trim().isEmpty() || entrepreneurName==null || entrepreneurContact.trim().isEmpty() || entrepreneurContact==null || proposal.trim().isEmpty() || proposal==null || selfInvestmentShare.trim().isEmpty() || selfInvestmentShare==null ){
				String error1="Enter Valid values";
				mv.addObject("msg",error1);
				mv.addObject("userID", userID);
				mv.setViewName("Investor");
			}
			else{
			String msg= entrepreneurDAO.approveProposal(entrepreneurName, selfInvestmentShare, userID);
			String sucess="You agreed to Invest in a Startup";
			String error="Your have already approved this proposal";
			String error1="You cannot submit the proposal";
			//String cannotsubmit= "Proposal has already been submitted";
			if(msg.equals("success")){
				mv.addObject("msg",sucess);
				mv.addObject("userID", userID);
				mv.setViewName("Investor");
			}
			else if(msg.equals("Error")){
				mv.addObject("msg",error);
				mv.addObject("userID", userID);
				mv.setViewName("Investor");
			}
			else if(msg.equals("Error1")){
				mv.addObject("msg",error1);
				mv.addObject("userID", userID);
				mv.setViewName("Investor");
			}
			}

			}
    else if(action.equals("approve")){
   	 
    	int userID=Integer.parseInt(request.getParameter("userID"));
    	String selfInvestmentShare=request.getParameter("selfInvestmentShare");
    	String entrepreneurName=request.getParameter("entrepreneurName");
    	System.out.println("entrepreneurName="+entrepreneurName);
		//String proposal=request.getParameter("proposal");
		
		System.out.println("selfInvestmentShare="+selfInvestmentShare);
        
		
		System.out.println("userID="+userID);

		String msg= entrepreneurDAO.approveProposal(entrepreneurName, selfInvestmentShare, userID);
		//String sucess="You agreed to Invest in a Startup";
		mv=null;
		JSONObject obj=new JSONObject();
		JSONObject obj1=new JSONObject();
		if(msg.equals("success")){
			
		    obj1.put("msg", "Your Approval have been Saved");
		    obj.put("successmsg",obj1);
	        PrintWriter out=response.getWriter();
	        out.print(obj);
		}
		else if(msg.equals("Error")){
			
		    obj1.put("msg", "Your have already approved this proposal");
		    obj.put("successmsg",obj1);
	        PrintWriter out=response.getWriter();
	        out.print(obj);
		}
    	
    	
    }
   
		
		return mv;
		
	}

}
