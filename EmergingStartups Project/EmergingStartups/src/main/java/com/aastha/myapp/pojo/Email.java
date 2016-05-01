package com.aastha.myapp.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

//import org.hibernate.*;




@Entity
@Table(name="email")
public class Email {
	
	


	@GenericGenerator(name="generator",strategy="foreign",parameters=@Parameter(name="property",value="user"))
	@Id
	@GeneratedValue(generator="generator")
	@Column(name="userID",unique=true,nullable=false)
	private int id;
	
	@Column(name = "emailId")
	private String emailId;
	
//	public Email(String emailId) {
//		this.emailId = emailId;
//	}
	
	public Email() {
		
	}

	@OneToOne
    @PrimaryKeyJoinColumn
	private User user;

	

	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	
}
