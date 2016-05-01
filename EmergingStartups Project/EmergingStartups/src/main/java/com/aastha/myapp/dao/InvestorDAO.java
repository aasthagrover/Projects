package com.aastha.myapp.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import com.aastha.myapp.pojo.EntrepreneurInvestor;
import com.aastha.myapp.pojo.EntrepreneurRole;
import com.aastha.myapp.pojo.InvestorRole;
import com.aastha.myapp.pojo.User;

public class InvestorDAO extends DAO {
	
	boolean flag=true;
	public List<InvestorRole> fetchInvestorList(String category,String roleType){
		  
		  try {
	            begin();
	          // Query q=getSession().createQuery("from User where username= :username and password=:password");
	            Criteria crit=getSession().createCriteria(User.class); 
	            crit.add(Restrictions.like("category.categoryName",category,MatchMode.EXACT));
	            crit.add(Restrictions.like("roleType",roleType,MatchMode.EXACT));
//	            Criterion user=Restrictions.like("username",username1,MatchMode.EXACT);
//	            Criterion pass=Restrictions.like("password",password1,MatchMode.EXACT);
//	            Conjunction conjunction=Restrictions.conjunction(); 
//	            conjunction.add(user);
//	            conjunction.add(pass);

	            List<InvestorRole> investors=(List<InvestorRole>)crit.list();
//	            System.out.println(user1.getRoleType());
//	            q.setString("username",username1);
//	            q.setString("password",password1);
//	            User user1 = (User) q.uniqueResult();
	            
	            commit();
	            return investors;
		  }catch (HibernateException e) {
	            rollback();
	            //throw new AdException("Could not create user " + username, e);
	            //,unique=true,nullable=false
					//throw new AdException("Exception while creating user: " + e.getCause());
	            e.printStackTrace();
				}
		return null;
		
		
		  
	  }

	public InvestorRole saveInvestor(String investorName,String investorContact,String description,int userID){
		try {
            begin();

            Session session=getSession();
            Criteria crit=session.createCriteria(InvestorRole.class); 
            crit.add(Restrictions.eq("userID",userID));

            crit.setMaxResults(1);
            InvestorRole investorRole=(InvestorRole)crit.uniqueResult();
            
            
            investorRole.setInvestorName(investorName);
            investorRole.setInvestorContact(investorContact);
            investorRole.setDescription(description);
            session.save(investorRole); 
            commit();
            InvestorRole investorRole1=(InvestorRole)investorRole;
            return investorRole1;
		}catch (HibernateException e) {
            rollback();
            //throw new AdException("Could not create user " + username, e);
            //,unique=true,nullable=false
				//throw new AdException("Exception while creating user: " + e.getCause());
            e.printStackTrace();
			}
		return null;
		
	}
	
	
	public InvestorRole searchProfile(String investorName){
		
		try{
		begin();
		Session session=getSession();
		Query q=session.createQuery("from InvestorRole where investorName= :investorName");
		q.setString("investorName", investorName);
		InvestorRole investorRole = (InvestorRole) q.uniqueResult();
//        Criteria crit=session.createCriteria(InvestorRole.class);
//        crit.add(Restrictions.like("investorName",investorName,MatchMode.EXACT));
//        crit.setMaxResults(1);
//        InvestorRole investorRole=(InvestorRole) crit.uniqueResult();
        
        commit();
		return investorRole;
		}catch (HibernateException e) {
            rollback();
            //throw new AdException("Could not create user " + username, e);
            //,unique=true,nullable=false
				//throw new AdException("Exception while creating user: " + e.getCause());
            e.getCause();
			}
		return null;
		
	}
	
	
	public String saveProposal(String investorName,String investorContact,String description,String entrepreneurName,String entrepreneurContact,String proposal,int userID){
		
		try{
		begin();
		Session session=getSession();
		 Criteria crit=session.createCriteria(EntrepreneurRole.class); 
         crit.add(Restrictions.eq("userID",userID));
         crit.setMaxResults(1);
         EntrepreneurRole entrepreneurRole=(EntrepreneurRole)crit.uniqueResult();
		
		
		entrepreneurRole.setEntrepreneurName(entrepreneurName);
		entrepreneurRole.setEntrepreneurContact(entrepreneurContact);
		entrepreneurRole.setProposal(proposal);
		
		  session.save(entrepreneurRole);
		  
		 Criteria crit1=session.createCriteria(InvestorRole.class); 
         crit1.add(Restrictions.like("investorName",investorName,MatchMode.EXACT));
         crit1.setMaxResults(1);
         InvestorRole investorRole=(InvestorRole)crit1.uniqueResult();
		
         Criteria crit2=session.createCriteria(EntrepreneurInvestor.class); 
         List<EntrepreneurInvestor> entrepreneurInvestors=(List<EntrepreneurInvestor>)crit2.list();
         
         
        for(int i=0;i<entrepreneurInvestors.size();i++){
        	if(entrepreneurInvestors.get(i).getInvestor().getUserID()==investorRole.getUserID()  && entrepreneurInvestors.get(i).getEntrepreneur().getUserID()==entrepreneurRole.getUserID() ){
        	flag=false;
        	System.out.println(flag);
        	}
        }
         if(flag==true){
        	 System.out.println("true flag");
        	 if(entrepreneurRole!=null && investorRole!=null){
		EntrepreneurInvestor entrepreneurInvestor=new EntrepreneurInvestor();
		entrepreneurInvestor.setEntrepreneur(entrepreneurRole);
		entrepreneurInvestor.setInvestor(investorRole);
		session.save(entrepreneurInvestor);
		commit();
		
		return "success";
        	 }
        	 else{
            	 return "CannotSubmit";
             }
         }
         else{
        	 return "CannotSubmit";
         }
		}catch (HibernateException e) {
            rollback();
            //throw new AdException("Could not create user " + username, e);
            //,unique=true,nullable=false
				//throw new AdException("Exception while creating user: " + e.getCause());
            System.out.println(e.getMessage());
			}
		return null;
	}
	

}
