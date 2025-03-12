package com.megacab.service;

import com.megacab.dto.LoginDTO;
import com.megacab.model.LoginModel;
import com.megacab.repository.LoginRepo;



public class LoginService {
	
	private LoginRepo loginRepo = new LoginRepo();
	private LoginModel loginModel;
	
	public String validateUser(LoginDTO loginDto) {
		 loginModel = new LoginModel(loginDto.getUserType(),loginDto.getEmail(), loginDto.getPassword());
		 String response = loginRepo.checkUser(loginModel);
		 return response;
	}
	

}
