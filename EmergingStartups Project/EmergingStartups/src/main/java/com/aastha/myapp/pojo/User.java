package com.aastha.myapp.pojo;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name="usertable")
@Inheritance(strategy=InheritanceType.JOINED)//TABLE per subclass
public class User {
	
	@Id
	@GeneratedValue
	@Column(name="userID",unique=true,nullable=false)
	private int userID;
	
	@Column(name="username")
	private String username;
	
	@OneToOne(fetch=FetchType.EAGER,mappedBy="user",cascade=CascadeType.ALL)
	private Email email;
	
	@ManyToOne(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	@PrimaryKeyJoinColumn(name="categoryName")
	private Category category;
	
//	@OneToOne(fetch=FetchType.EAGER,mappedBy="user",cascade=CascadeType.ALL)	
	//@JoinColumn(name="locationname")
//	@JoinColumns({
//		  @JoinColumn(name = "locationname"),
//		  @JoinColumn(name = "locationId")
//		})
	
	@ManyToOne(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	@PrimaryKeyJoinColumn(name="locationname")
	private Location location;
	
	@Column(name="gender")
	private String gender;
	
	

	public Category getCategory() {
		return category;
	}


	public void setCategory(Category category) {
		this.category = category;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}
	@Column(name="firstName")
	private String firstName;
	
	@Column(name="lastName")
	private String lastName;
	
	@Column(name="password")
	private String password;
	
	@Column(name="roleType")
	private String roleType;
	
	
	
	public String getRoleType() {
		return roleType;
	}


	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}


	public User() {
    }
	
	
	public int getUserID() {
		return userID;
	}


	public void setUserID(int userID) {
		this.userID = userID;
	}


	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}


	public Email getEmail() {
		return email;
	}


	public void setEmail(Email email) {
		this.email = email;
	}

}
