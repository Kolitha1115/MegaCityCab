package com.megacab.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.megacab.dto.LoginDTO;
import com.megacab.service.LoginService;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private LoginService loginService = new LoginService();
    private LoginDTO loginDTO; 
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Inside the login controller");
        
        // Get values coming from request
        String userType = request.getParameter("type");
        String userEmail = request.getParameter("name");
        String userPass = request.getParameter("pass");
        RequestDispatcher dispatcher = null;
        
        System.out.println("Username: " + userEmail + ", Password: " + userPass + ", UserType: " + userType);
        
        // Call the login service class
        loginDTO = new LoginDTO(userType, userEmail, userPass);
        String responseBody = loginService.validateUser(loginDTO);
        
        HttpSession session = request.getSession();
        
        if (responseBody.equals("Admin Login Successfully")) {
            session.setAttribute("admin", userEmail);
            dispatcher = request.getRequestDispatcher("admin_dashboard.jsp"); // Redirect admin to dashboard
        } else if (responseBody.equals("User Login Successfully")) {
            session.setAttribute("user", userEmail);
            dispatcher = request.getRequestDispatcher("index.jsp"); // Redirect normal users
        } else {
            request.setAttribute("Response", "failed");
            dispatcher = request.getRequestDispatcher("login.jsp");
        }
        
        dispatcher.forward(request, response);
        System.out.println(responseBody);
    }
}
