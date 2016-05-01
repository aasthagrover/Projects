package com.aastha.myapp.pojo;


import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;


@Entity
@Table(name="location")
public class Location {
	
	
	
	//@GenericGenerator(name="generator",strategy="foreign",parameters=@Parameter(name="property",value="user"))
	//@Id
    
	//@Column(name="locationId",unique=true,nullable=false)
//	@Id
//	@GeneratedValue(strategy=GenerationType.AUTO)
//	@Column(name="locationId",unique=true,nullable=false)
//	private int locationId;
//	
	
	//@GenericGenerator(name="generator",strategy="foreign",parameters=@Parameter(name="property",value="user"))	
	//@GeneratedValue(generator="generator")
	@Id
	@Column(name = "locationname",nullable=false)
	private String locationname;
	
	
	@OneToMany(cascade=CascadeType.ALL, mappedBy="location") 
	//@PrimaryKeyJoinColumn(name="userID")
	private List<User> users;
	
	
//	public int getLocationId() {
//		return locationId;
//	}
//	public void setLocationId(int locationId) {
//		this.locationId = count;
//		count++;
//	}
	
	
	public String getLocationname() {
		return locationname;
	}
//	public void setLocationId(int locationId) {
//		this.locationId = locationId;
//	}


	public void setLocationname(String locationname) {
		this.locationname = locationname;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	
	
	
//	public User getUser() {
//		return user;
//	}
//	public void setUser(User user) {
//		this.user = user;
//	}
	

}
