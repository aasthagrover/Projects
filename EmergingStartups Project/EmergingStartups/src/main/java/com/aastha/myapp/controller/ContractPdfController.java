package com.aastha.myapp.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.Action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.aastha.myapp.pdfview.PdfReportView;


@Controller
@RequestMapping("/pdf.htm")
public class ContractPdfController  {

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView Report(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv=new ModelAndView();
		View view = new PdfReportView();
		String selfInvestmentShare=request.getParameter("selfInvestmentShare");
		String investorName=request.getParameter("investorName");
		String userID=request.getParameter("userID");
		
		System.out.println(selfInvestmentShare);
		System.out.println(investorName);
		System.out.println(userID);
		
		mv.setView(view);
		mv.addObject("selfInvestmentShare", selfInvestmentShare);
		mv.addObject("investorName", investorName);
		return mv;
		
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView createReport(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView();
	//	ModelAndView mv=new ModelAndView();
		View view = new PdfReportView();
		String action=request.getParameter("action");
		if(action.equals("InvestorPDF")){
		String selfInvestmentShare=request.getParameter("selfInvestmentShare");
		String entrepreneurName=request.getParameter("entrepreneurName");
		String userID=request.getParameter("userID");
		if(selfInvestmentShare.isEmpty() || selfInvestmentShare.equals(null)){
		
			String msg="Enter your investment share";
			mv.addObject("share",msg);
			mv.addObject("userID",userID);
			mv.setViewName("Investor");
			return mv;
			
		}
		else if(entrepreneurName.isEmpty() || entrepreneurName.equals(null)){
			String msg="Enter the Name of Entrepreneur";
			mv.addObject("share",msg);
			mv.addObject("userID",userID);
			mv.setViewName("Investor");
			return mv;
		}
		else{
			mv.setView(view);
			mv.addObject("selfInvestmentShare", selfInvestmentShare);
			return mv;
			
		}
		
	}
		else if(action.equals("EntrepreneurContract")){
			
			ModelAndView mvc=new ModelAndView();
			String selfInvestmentShare=request.getParameter("selfInvestmentShare");
			String investorName=request.getParameter("investorName");
			//String userID=request.getParameter("userID");
			
			System.out.println(selfInvestmentShare);
			System.out.println(investorName);
			//System.out.println(userID);
			
			mvc.setView(view);
//			mv.addObject("selfInvestmentShare", selfInvestmentShare);
//			mv.addObject("investorName", investorName);
			return mvc;
		}
		return null;
	}

}
