package com.aastha.myapp.pojo;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="investor")
@PrimaryKeyJoinColumn(name="userID")
public class InvestorRole extends User{
	

	private String investorName;
	
	private String investorContact;
	
	private String description;

//	@ManyToMany(cascade=CascadeType.ALL)  
//    @JoinTable(name="entrepreneur_investor", joinColumns=@JoinColumn(name="investorName"), inverseJoinColumns=@JoinColumn(name="entrepreneurName"))  
//    private Set<EntrepreneurRole> entrepreneurRoles;  

	
	@OneToMany(mappedBy="investor")
	private Set<EntrepreneurInvestor> entrepreneurInvestors=new HashSet<EntrepreneurInvestor>();


//	public Set<EntrepreneurRole> getEntrepreneurRoles() {
//		return entrepreneurRoles;
//	}
//
//	public void setEntrepreneurRoles(Set<EntrepreneurRole> entrepreneurRoles) {
//		this.entrepreneurRoles = entrepreneurRoles;
//	}

	public String getInvestorName() {
		return investorName;
	}

	public Set<EntrepreneurInvestor> getEntrepreneurInvestors() {
		return entrepreneurInvestors;
	}

	public void setEntrepreneurInvestors(Set<EntrepreneurInvestor> entrepreneurInvestors) {
		this.entrepreneurInvestors = entrepreneurInvestors;
	}

	public void setInvestorName(String investorName) {
		this.investorName = investorName;
	}

	public String getInvestorContact() {
		return investorContact;
	}

	public void setInvestorContact(String investorContact) {
		this.investorContact = investorContact;
	}




	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	

}
