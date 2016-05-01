package com.aastha.myapp.pojo;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="expert")
@PrimaryKeyJoinColumn(name="userID")
public class ExpertRole extends User{
	
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name = "expertId")
//	private int expertId;
	
	@Column(name = "expertname")
	private String expertName;
	
	@Column(name = "expertcontact")
	private String expertContact;
	
	
	@Column(name = "expertise")
	private String expertise;
	
	
//	@ManyToMany(mappedBy="experts")  // map info is in category class
//	private Set<Category> category=new HashSet<Category>();
//
//	@ManyToMany(mappedBy="experttwo")  // map info is in entrepreneur class
//	private Set<EntrepreneurRole> entrepreneurs=new HashSet<EntrepreneurRole>();

	public String getExpertContact() {
		return expertContact;
	}

	public void setExpertContact(String expertContact) {
		this.expertContact = expertContact;
	}
	
	

	

//	public int getExpertId() {
//		return expertId;
//	}
//
//	public void setExpertId(int expertId) {
//		this.expertId = expertId;
//	}

//	public Set<Category> getCategory() {
//		return category;
//	}
//
//	public void setCategory(Set<Category> category) {
//		this.category = category;
//	}

	

	public String getExpertise() {
		return expertise;
	}

	public void setExpertise(String expertise) {
		this.expertise = expertise;
	}

	public String getExpertName() {
		return expertName;
	}

	public void setExpertName(String expertName) {
		this.expertName = expertName;
	}

	
	
}
