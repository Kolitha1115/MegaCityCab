package com.megacab.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megacab.dto.RegisterDTO;
import com.megacab.service.RegisterService;

@WebServlet("/Register")

public class RegistraionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private RegisterService registerService = new RegisterService();
	private RegisterDTO registerDTO;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Inside the register controller");

		//get values coming from request
		String userType = request.getParameter("Name").toString();
		String userEmail = request.getParameter("NIC").toString();
		String userTel = request.getParameter("Address").toString();
		String userPass = request.getParameter("pass").toString();
		boolean agree = request.getParameter("agree") != null;
		
		//get values assign from registerDTO
		registerDTO = new RegisterDTO(userType,userEmail,userTel,userPass,agree);
		
		//call the registerService class
		String responseMessage = registerService.registerUser(registerDTO);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		if (dispatcher != null) {
			if(responseMessage.equals("Registration Successful")) {
				request.setAttribute("Response", "Successful");
				dispatcher.forward(request, response);
			}
		} else {
		    // Handle the case where dispatcher is null
		    System.out.println("RequestDispatcher is null. Check the JSP path.");
		}

	}

}
