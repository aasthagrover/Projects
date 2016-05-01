package com.aastha.myapp.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.aastha.myapp.dao.EntrepreneurInvestorDAO;
import com.aastha.myapp.dao.InvestorDAO;
import com.aastha.myapp.dao.UserDAO;
import com.aastha.myapp.pojo.EntrepreneurInvestor;
import com.aastha.myapp.pojo.InvestorRole;
import com.aastha.myapp.pojo.User;

@Controller
@RequestMapping("/entrepreneur.htm")
public class EntrepreneurController {
	List<InvestorRole> investorlist = new ArrayList();
 
	@Autowired
	@Qualifier("entrepreneurInvestorDAO")
	EntrepreneurInvestorDAO entrepreneurInvestorDAO;
	
	@Autowired
	@Qualifier("investorDAO")
	InvestorDAO investorDAO;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView initializeForm(HttpServletRequest request, HttpServletResponse response) {
            HttpSession session=request.getSession();
            ModelAndView mvc=new ModelAndView();
            String action=request.getParameter("action");
            
            if(action.equals("View")){
			int userID=Integer.parseInt(request.getParameter("userID"));
			System.out.println(userID);
			// EntrepreneurInvestorDAO entrepreneurInvestorDAO=new EntrepreneurInvestorDAO();
			 List<EntrepreneurInvestor> list=entrepreneurInvestorDAO.fetchProposals(userID);
			 List<InvestorRole> investorRoles=new ArrayList<InvestorRole>();
			 for(int i=0;i<list.size();i++){
				investorRoles.add(list.get(i).getInvestor()); 
			 }
		    
		     mvc.addObject("list",investorRoles);
			 mvc.setViewName("Proposal");
            }
            else if(action.equals("Notification")){
            	int userID=Integer.parseInt(request.getParameter("userID"));  
            	List<EntrepreneurInvestor> entrepreneurInvestors=entrepreneurInvestorDAO.fetchInvestors(userID);
            	List<InvestorRole> investorRoles=new ArrayList<InvestorRole>();
            	for(int i=0;i<entrepreneurInvestors.size();i++){
            		investorRoles.add(entrepreneurInvestors.get(1).getInvestor());	
            	}
            	
            	mvc.addObject("list",entrepreneurInvestors);
            	mvc.addObject("userID", userID);
            	mvc.setViewName("EntrepreneurNotify");
            }

		return mvc;
	}
	
	@RequestMapping(method=RequestMethod.POST)
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv=new ModelAndView();
		
		String action=request.getParameter("action");
		
		if(action.equals("search")){
		
		
		String category= request.getParameter("category");
		String roleType=request.getParameter("roleType");

		
		//InvestorDAO investorDAO=new InvestorDAO();
		investorlist=investorDAO.fetchInvestorList(category, roleType);
		System.out.println(investorlist.size());
		List<JSONObject> customlist = new ArrayList();
		for(int i=0;i<investorlist.size();i++){
			JSONObject obj1=new JSONObject();
			customlist.add(obj1.put("investorName",investorlist.get(i).getInvestorName()));
			
		}
		  if(investorlist.size()>0){
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
		else if(action.equals("open")){
			String investorName= request.getParameter("investorName");
			String userID=request.getParameter("userID");
//			System.out.println("inside open");
//			System.out.println(investorName);
			
			//InvestorDAO investorDAO=new InvestorDAO();
			InvestorRole investorRole=investorDAO.searchProfile(investorName);
			
			mv.addObject("investor",investorRole);
			mv.addObject("userID", userID);
			mv.setViewName("Entrepreneur");
//			List<JSONObject> customlist = new ArrayList();
//			
//				JSONObject obj1=new JSONObject();
//				JSONObject obj2=new JSONObject();
//				JSONObject obj3=new JSONObject();
//				customlist.add(obj1.put("investorName",investorRole.getInvestorName()));
//				customlist.add(obj2.put("investorContact",investorRole.getInvestorContact()));
//				customlist.add(obj3.put("description",investorRole.getDescription()));
//				
//             System.out.println(customlist.size());
//			 JSONObject obj4=new JSONObject();
//			 JSONArray jsonArray = new JSONArray();
//		      for (int i=0; i < customlist.size(); i++) {
//		          jsonArray.put(customlist.get(i));
//		       }
//		      
//
//			 obj4.put("investor",jsonArray);
//			 PrintWriter out1=response.getWriter();
//		      out1.print(obj4);
//			
		}
		else if(action.equals("sendproposal")){
			
			String investorName=request.getParameter("investorName");
			String investorContact=request.getParameter("investorContact");
			String description=request.getParameter("description");
			String entrepreneurName=request.getParameter("entrepreneurName");
			String entrepreneurContact=request.getParameter("entrepreneurContact");
			String proposal=request.getParameter("proposal");
	        
			int userID=Integer.parseInt(request.getParameter("userID"));
			//InvestorDAO investorDAO=new InvestorDAO();
			String msg= investorDAO.saveProposal(investorName, investorContact, description, entrepreneurName, entrepreneurContact, proposal, userID);
			String sucess="YourProposal has been Sucessfully submitted";
			String cannotsubmit= "Proposal has already been submitted";
			if(msg.equals("success")){
				mv.addObject("msg",sucess);
				mv.addObject("userID", userID);
				mv.setViewName("Entrepreneur");
			}
			else if(msg.equals("CannotSubmit")){
				mv.addObject("msg",cannotsubmit);
				mv.addObject("userID", userID);
				mv.setViewName("Entrepreneur");
			}
			}
		
		
		return mv;
	}
	
}
