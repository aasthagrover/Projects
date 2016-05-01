package com.aastha.myapp.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import com.aastha.myapp.exception.AdException;
import com.aastha.myapp.pojo.Category;
import com.aastha.myapp.pojo.Email;
import com.aastha.myapp.pojo.EntrepreneurRole;
import com.aastha.myapp.pojo.ExpertRole;
import com.aastha.myapp.pojo.InvestorRole;
import com.aastha.myapp.pojo.Location;

import com.aastha.myapp.pojo.User;



public class UserDAO extends DAO {
	User user; 
	 public UserDAO() {
	    }
	 
	  public User create(String firstName,String lastName,String username,String password,Email email,String roleType,String gender,Location location,Category category){
		   
		  try {
			  
	            begin();
	            
	           
	            if(roleType.equals("Entrepreneur")){
	             user=new EntrepreneurRole();	
	            }
	            else if(roleType.equals("Investor")){
	            	 user=new InvestorRole();
	            }
                else if(roleType.equals("Expert")){
                	 user=new ExpertRole();
	            }
	           
	            
	            user.setFirstName(firstName);
	            user.setLastName(lastName);
                user.setUsername(username);
                user.setPassword(password);
                user.setGender(gender);
                user.setRoleType(roleType);
               // Query q=getSession().createQuery("from location where username= :username and password=:password");
	            user.setLocation(location);
                user.setCategory(category);
	            user.setEmail(email);
            
	            email.setUser(user);
//	            
//	            if(roleType.equals("Entrepreneur")){
//	            	
//	            }
	            //location.getUsers().add(user);	
	            
	            getSession().save(user);
	            
	            commit();
	            return user;
	        } catch (HibernateException e) {
	            rollback();
	            //throw new AdException("Could not create user " + username, e);
	            //,unique=true,nullable=false
					//throw new AdException("Exception while creating user: " + e.getCause());
	            System.out.println(e.getMessage());
				}
			return null;
			
			
	    }
	  
	  public User login(String username1, String password1){
		  
		  try {
	            begin();
	          
	          // Query q=getSession().createQuery("from User where username= :username and password=:password");
	            Criteria crit=getSession().createCriteria(User.class); 
	            crit.add(Restrictions.like("username",username1,MatchMode.EXACT));
	            crit.add(Restrictions.like("password",password1,MatchMode.EXACT));
//	            Criterion user=Restrictions.like("username",username1,MatchMode.EXACT);
//	            Criterion pass=Restrictions.like("password",password1,MatchMode.EXACT);
//	            Conjunction conjunction=Restrictions.conjunction(); 
//	            conjunction.add(user);
//	            conjunction.add(pass);
	            crit.setMaxResults(1);
	            User user1=(User)crit.uniqueResult();
	            
	            
//	            q.setString("username",username1);
//	            q.setString("password",password1);
//	            User user1 = (User) q.uniqueResult();
	            
	            commit();
	            return user1;
		  }catch (HibernateException e) {
	            rollback();
	            //throw new AdException("Could not create user " + username, e);
	            //,unique=true,nullable=false
					//throw new AdException("Exception while creating user: " + e.getCause());
	            e.printStackTrace();
				}
		return null;
		
		
		  
	  }
	  
	  public User checkUsername(String username2){
		  try {
		begin();
		
		System.out.println("insidecheck");
		  Criteria crit=getSession().createCriteria(User.class); 
          crit.add(Restrictions.like("username",username2,MatchMode.EXACT));
          crit.setMaxResults(1);
          User user2=(User)crit.uniqueResult();

          commit();
          
		return user2;
		  }catch (HibernateException e) {
	            rollback();
	            //throw new AdException("Could not create user " + username, e);
	            //,unique=true,nullable=false
					//throw new AdException("Exception while creating user: " + e.getCause());
	            e.printStackTrace();
				}
		return null;
		  
	  }
	  
	  public String findByUserName(String username,String password) {

			try{
				begin();
			Criteria crit=getSession().createCriteria(User.class); 
            crit.add(Restrictions.like("username",username,MatchMode.EXACT));
            crit.setMaxResults(1);
            User user=(User) crit.uniqueResult();
            
            user.setPassword(password);
            getSession().save(user);

            commit();
			return "Your password has been reset";
			}catch (HibernateException e) {
	            rollback();
	            
	            System.out.println(e.getMessage());
				}
		return null;
			
	  }
	  
//	 s
//	  public Set<InvestorRole> fetchInvestorList(){
//		return null;
//		  
//	  }
}
