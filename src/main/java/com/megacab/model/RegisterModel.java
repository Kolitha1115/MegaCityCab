package com.megacab.model;

public class RegisterModel {
	private String userType;
	private String userEmail;
	private String userTel;
	private String uPass;
	private boolean agree;
	
	public RegisterModel(String userType, String userEmail, String userTel, String uPass,boolean agree) {
		super();
		this.userType = userType;
		this.userEmail = userEmail;
		this.userTel = userTel;
		this.uPass = uPass;
		this.agree =agree;
	}
	

	public boolean isAgree() {
		return agree;
	}



	public void setAgree(boolean agree) {
		this.agree = agree;
	}



	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public String getuPass() {
		return uPass;
	}

	public void setuPass(String uPass) {
		this.uPass = uPass;
	}
}
