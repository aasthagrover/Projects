package com.aastha.myapp.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="entrepreneur_investor")
public class EntrepreneurInvestor {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int entrepreneur_investor_id;
	
	@ManyToOne
    @JoinColumn(name = "entrepreneurName")
    private EntrepreneurRole entrepreneur;

	@ManyToOne
    @JoinColumn(name = "investorName")
    private InvestorRole investor;
	
	@Column(name="selfInvestmentShare")
	private String selfInvestmentShare;
	
	
	public String getSelfInvestmentShare() {
		return selfInvestmentShare;
	}

	public void setSelfInvestmentShare(String selfInvestmentShare) {
		this.selfInvestmentShare = selfInvestmentShare;
	}

	public EntrepreneurRole getEntrepreneur() {
		return entrepreneur;
	}

	public void setEntrepreneur(EntrepreneurRole entrepreneur) {
		this.entrepreneur = entrepreneur;
	}

	public InvestorRole getInvestor() {
		return investor;
	}

	public void setInvestor(InvestorRole investor) {
		this.investor = investor;
	}
	
	
	
	

}
