package com.aastha.myapp.dao;

import java.util.List;

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

public class EntrepreneurDAO extends DAO {

	public List<EntrepreneurRole> fetchEntrepreneurList(String category,String roleType ){
		  
		  try {
	            begin();
	          // Query q=getSession().createQuery("from User where username= :username and password=:password");
	            Criteria crit=getSession().createCriteria(User.class); 
	            crit.add(Restrictions.like("category.categoryName",category,MatchMode.EXACT));
	            crit.add(Restrictions.like("roleType",roleType,MatchMode.EXACT));

	            List<EntrepreneurRole> investors=(List<EntrepreneurRole>)crit.list();
	            
	            commit();
	            return investors;
		  }catch (HibernateException e) {
	            rollback();
	           
	            e.printStackTrace();
				}
		return null;
		
		
		  
	  }
	
public EntrepreneurRole searchProfile(String entrepreneurName){
		
		try{
		begin();
		Session session=getSession();
		Query q=session.createQuery("from EntrepreneurRole where entrepreneurName= :entrepreneurName");
		q.setString("entrepreneurName", entrepreneurName);
		EntrepreneurRole entrepreneurRole = (EntrepreneurRole) q.uniqueResult();
        
        commit();
		return entrepreneurRole;
		}catch (HibernateException e) {
            rollback();
            
            e.getCause();
			}
		return null;
		
	}

public String approveProposal(String entrepreneurName,String selfInvestmentShare,int userID){
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
     
     if(investorRole==null || entrepreneurRole==null ){
    	 return "Error1"; 
     }
     else{
     int entrepreneuruserid=entrepreneurRole.getUserID();
	
     for(int i=0;i<entrepreneurInvestors.size();i++){
     	if(entrepreneurInvestors.get(i).getInvestor().getUserID()==userID && entrepreneurInvestors.get(i).getEntrepreneur().getUserID()==entrepreneuruserid && entrepreneurInvestors.get(i).getSelfInvestmentShare()==null)
     	{
     		Criteria crit2=session.createCriteria(EntrepreneurInvestor.class);
     		crit2.add(Restrictions.eq("entrepreneur",entrepreneurRole));
     		crit2.add(Restrictions.eq("investor",investorRole));

     		EntrepreneurInvestor entrepreneurInvestor=(EntrepreneurInvestor)crit2.uniqueResult();
     		entrepreneurInvestor.setSelfInvestmentShare(selfInvestmentShare);
     		session.save(entrepreneurInvestor);
     		commit();
     		
     		return "success";
     	}
     	else{
     		return "Error";
     	}
     }
     }
    
	}catch (HibernateException e) {
        rollback();
        
        System.out.println(e.getMessage());
		}
	return null;
}
	
	
}
