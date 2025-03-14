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
        // Optionally handle GET request (if needed)
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Inside the register controller");

        // Get values from the request
        String userType = request.getParameter("Name");
        String userEmail = request.getParameter("NIC");
        String userTel = request.getParameter("Address");
        String userPass = request.getParameter("pass");
        boolean agree = request.getParameter("agree") != null;
        
        // Initialize error messages
        StringBuilder errorMessages = new StringBuilder();
        
        // Validate form inputs
        if (userType == null || userType.trim().isEmpty()) {
            errorMessages.append("Name is required.<br>");
        }
        
        // NIC validation (12-character format with optional 'x' at the start)
        if (userEmail == null || userEmail.trim().isEmpty() || !userEmail.matches("^[xX]?[0-9]{9}[VXvx]$")) {
            errorMessages.append("Invalid NIC format or NIC is required. It should be in the format x123456789V or 123456789X.<br>");
        }

        if (userTel == null || userTel.trim().isEmpty()) {
            errorMessages.append("Address is required.<br>");
        }

        if (userPass == null || userPass.trim().isEmpty() || userPass.length() < 6) {
            errorMessages.append("Password must be at least 6 characters.<br>");
        }

        if (!agree) {
            errorMessages.append("You must agree to the terms and conditions.<br>");
        }

        // If there are validation errors, send them back to the form
        if (errorMessages.length() > 0) {
            request.setAttribute("errorMessages", errorMessages.toString());
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Proceed with user registration if no validation errors
        registerDTO = new RegisterDTO(userType, userEmail, userTel, userPass, agree);
        String responseMessage = registerService.registerUser(registerDTO);

        if (responseMessage.equals("Registration Successful")) {
            // Redirect to login page after successful registration
            request.setAttribute("Response", "Registration Successful");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        } else {
            // If registration fails, show the error message
            request.setAttribute("Response", responseMessage);
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
        }
    }
}
