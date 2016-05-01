package com.aastha.myapp.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.aastha.myapp.pojo.EntrepreneurInvestor;
import com.aastha.myapp.pojo.EntrepreneurRole;
import com.aastha.myapp.pojo.InvestorRole;
import com.aastha.myapp.pojo.User;



public class EntrepreneurInvestorDAO extends DAO{

	
	public List<EntrepreneurInvestor> fetchProposals(int userID){
		  
		  try {
	            begin();
	            Session session=getSession();
	    		Query q=session.createQuery("from EntrepreneurInvestor where entrepreneur= :entrepreneur");
	    		q.setString("entrepreneur",String.valueOf(userID));
	    
	            List<EntrepreneurInvestor> results=q.list();
	            System.out.println(results.size());
	            commit();
	           
	         return results;   
           }catch (HibernateException e) {
	            rollback();
	            
	            e.printStackTrace();
				}
		  return null;
      }
	
	public List<EntrepreneurRole> fetchNotifications(int userID){
		
		
		 try {
	            begin();
	            Session session=getSession();
	            System.out.println(userID);
	    		Query q=session.createQuery("from EntrepreneurInvestor where investor= :investor and selfInvestmentShare is NULL");
	    		q.setString("investor",String.valueOf(userID));
//	    		q.setString("selfInvestmentShare",null);
	    
	            List<EntrepreneurInvestor> results=q.list();
	            List<EntrepreneurRole> entrepreneurs=new ArrayList<EntrepreneurRole>();
	            System.out.println("List Size= "+results.size());
	            for(int i=0;i<results.size();i++){
	            	entrepreneurs.add(results.get(i).getEntrepreneur());
	            }
	            commit();
	           
	         return entrepreneurs;   
        }catch (HibernateException e) {
	            rollback();
	            
	            e.printStackTrace();
				}
		  return null;
		
	}
	
	public String saveApproval(String entrepreneurName,String selfInvestmentShare,int userID){
		
		int userid;
		InvestorRole investorRole=null;
		try{
		begin();
		Session session=getSession();
		
		Criteria crit=session.createCriteria(EntrepreneurInvestor.class); 
	    List<EntrepreneurInvestor> entrepreneurInvestors=(List<EntrepreneurInvestor>)crit.list();
	    
	    for(int i=0;i<entrepreneurInvestors.size();i++){
	    	if(entrepreneurInvestors.get(i).getInvestor().getUserID()==userID)
	    	{
	    		userid=entrepreneurInvestors.get(i).getInvestor().getUserID();
	    		investorRole=entrepreneurInvestors.get(i).getInvestor();
	    		System.out.println("got an investor Role");
	    	}
	    }
	   
	     Criteria crit1=session.createCriteria(EntrepreneurRole.class); 
	     crit1.add(Restrictions.like("entrepreneurName",entrepreneurName,MatchMode.EXACT));
	     crit1.setMaxResults(1);
	     EntrepreneurRole entrepreneurRole=(EntrepreneurRole)crit1.uniqueResult();
	     System.out.println("almost ");
	     int entrepreneuruserid=entrepreneurRole.getUserID();
		
	     for(int i=0;i<entrepreneurInvestors.size();i++){
	     	if(entrepreneurInvestors.get(i).getInvestor().getUserID()==userID && entrepreneurInvestors.get(i).getEntrepreneur().getUserID()==entrepreneuruserid)
	     	{
	     		Criteria crit2=session.createCriteria(EntrepreneurInvestor.class);
	     		crit2.add(Restrictions.eq("entrepreneur",entrepreneurRole));
	     		crit2.add(Restrictions.eq("investor",investorRole));
	     		 crit2.setMaxResults(1);
	     		System.out.println("almost ");
	     		EntrepreneurInvestor entrepreneurInvestor=(EntrepreneurInvestor)crit2.uniqueResult();
	     		entrepreneurInvestor.setSelfInvestmentShare(selfInvestmentShare);
	     		session.save(entrepreneurInvestor);
	     		System.out.println("done ");
	     		
	     	}
	     }

		commit();
		
		return "success";
	    
		}catch (HibernateException e) {
	        rollback();
	        
	        System.out.println(e.getMessage());
			}
		return null;
		
		
	}
	
	public List<EntrepreneurInvestor> fetchInvestors(int userID){
		
		try{
			begin();
			Session session=getSession();
			
			Criteria crit1=session.createCriteria(EntrepreneurRole.class);
			crit1.add(Restrictions.eq("userID",userID));
     		EntrepreneurRole entrepreneurRole=(EntrepreneurRole) crit1.uniqueResult();
     		
			
			Criteria crit2=session.createCriteria(EntrepreneurInvestor.class);
     		crit2.add(Restrictions.eq("entrepreneur",entrepreneurRole));
     		crit2.add(Restrictions.isNotNull("selfInvestmentShare"));
     		
     		List<EntrepreneurInvestor> entrepreneurInvestors=(List<EntrepreneurInvestor>)crit2.list();
			
			commit();
			
			return entrepreneurInvestors;

		}catch (HibernateException e) {
	        rollback();
	        
	        System.out.println(e.getMessage());
			}
		return null;
		
	}
}