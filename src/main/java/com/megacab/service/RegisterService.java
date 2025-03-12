package com.megacab.service;

import com.megacab.dto.RegisterDTO;
import com.megacab.model.RegisterModel;
import com.megacab.repository.RegisterRepo;



public class RegisterService {
	
	private RegisterRepo regiterRepo = new RegisterRepo();
	private RegisterModel registerModel;
	
	public String registerUser(RegisterDTO registerDTO) {
		registerModel = new RegisterModel(registerDTO.getUserType(),registerDTO.getUserEmail(),registerDTO.getUserTel(),registerDTO.getuPass(),registerDTO.isAgree());
		String response = regiterRepo.saveUser(registerModel);
		return response;
	}


}
