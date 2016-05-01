package com.aastha.myapp.pojo;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="entrepreneur")
@PrimaryKeyJoinColumn(name="userID")
public class EntrepreneurRole extends User {

	@Column(name="entrepreneurName")
	private String entrepreneurName;
	
	@Column(name="entrepreneurContact")
	private String entrepreneurContact;
	
	
	@Column(name="proposal")
	private String proposal;
	
	
	
	
//	@ManyToMany(cascade=CascadeType.ALL, mappedBy="entrepreneurRoles")  
//    private Set<InvestorRole> investors;
	
	@OneToMany(mappedBy="entrepreneur")
	private Set<EntrepreneurInvestor> entrepreneurInvestors=new HashSet<EntrepreneurInvestor>();

	
//	@ManyToOne
//	@JoinColumn(name="categoryId")     // inverse = false
//	private Category category;
	  
	  
//	@ManyToMany
//	@JoinTable(name = "expert_entrepreneur",joinColumns = {@JoinColumn(name="entrepreneurId", unique = true)},inverseJoinColumns = {@JoinColumn(name="private int expertId")})
//	private Set<ExpertRole> experttwo=new HashSet<ExpertRole>();
	


//	public Category getCategory() {
//		return category;
//	}
//
//	public void setCategory(Category category) {
//		this.category = category;
//	}
//
//	
//
//	public Set<ExpertRole> getExperttwo() {
//		return experttwo;
//	}
//
//	public void setExperttwo(Set<ExpertRole> experttwo) {
//		this.experttwo = experttwo;
//	}

//	public Set<InvestorRole> getInvestors() {
//		return investors;
//	}
//
//	public void setInvestors(Set<InvestorRole> investors) {
//		this.investors = investors;
//	}

	public String getEntrepreneurName() {
		return entrepreneurName;
	}

	public Set<EntrepreneurInvestor> getEntrepreneurInvestors() {
		return entrepreneurInvestors;
	}

	public void setEntrepreneurInvestors(Set<EntrepreneurInvestor> entrepreneurInvestors) {
		this.entrepreneurInvestors = entrepreneurInvestors;
	}

	public void setEntrepreneurName(String entrepreneurName) {
		this.entrepreneurName = entrepreneurName;
	}

	public String getEntrepreneurContact() {
		return entrepreneurContact;
	}

	public void setEntrepreneurContact(String entrepreneurContact) {
		this.entrepreneurContact = entrepreneurContact;
	}



	public String getProposal() {
		return proposal;
	}

	public void setProposal(String proposal) {
		this.proposal = proposal;
	}

	
	
	

}
