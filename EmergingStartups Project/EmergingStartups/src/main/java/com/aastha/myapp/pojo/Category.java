package com.aastha.myapp.pojo;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;



@Entity
@Table(name="categorytable")
public class Category {
	
	
//	@Id
//	@GeneratedValue(strategy=GenerationType.AUTO)
//	@Column(name="categoryId")
//	public String categoryId;
	
	@Id
	@Column(name = "categoryName",nullable=false)
	public String categoryName;
	
//	@OneToMany(fetch=FetchType.LAZY,mappedBy="category",cascade=CascadeType.ALL)
//	@JoinColumn(name="entrepreneurId")
//	private Set<EntrepreneurRole> entrepreneurs=new HashSet<EntrepreneurRole>();;
//	
//	
//	@ManyToMany
//	@JoinTable(name = "expert_category",joinColumns = {@JoinColumn(name="categoryId", unique = true)},inverseJoinColumns = {@JoinColumn(name="private String expertId")})
//	private Set<ExpertRole> experts=new HashSet<ExpertRole>();
//	
//	public Set<EntrepreneurRole> getEntrepreneurs() {
//		return entrepreneurs;
//	}
//	public void setEntrepreneurs(Set<EntrepreneurRole> entrepreneurs) {
//		this.entrepreneurs = entrepreneurs;
//	}
	
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	@OneToMany(cascade=CascadeType.ALL, mappedBy="category") 
	//@PrimaryKeyJoinColumn(name="userID")
	private List<User> users;

	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	
	

}
