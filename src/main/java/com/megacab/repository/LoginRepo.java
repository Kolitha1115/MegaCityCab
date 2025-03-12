package com.megacab.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.megacab.model.LoginModel;

public class LoginRepo {

    // Hardcoded admin credentials
    private static final String ADMIN_USERNAME = "admin";
    private static final String ADMIN_PASSWORD = "123";
    
    // Updated Database connection details
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/megacab?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    public String checkUser(LoginModel loginModel) {
        String responseMessage = "";

        // Check for admin login first
        if (ADMIN_USERNAME.equals(loginModel.getEmail()) && ADMIN_PASSWORD.equals(loginModel.getPassword())) {
            return "Admin Login Successfully";
        }

        String sql = "SELECT * FROM registered_user_details WHERE name = ?";
        
        // Explicitly load the MySQL JDBC driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            return "Error loading database driver: " + e.getMessage();
        }
        
        // Use try-with-resources to automatically close Connection, PreparedStatement, and ResultSet
        try (Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, loginModel.getEmail());
            
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    String dUPass = rs.getString("password");

                    // Check user type and password match
                    if (dUPass.equals(loginModel.getPassword())) {
                        responseMessage = "User Login Successfully";
                    } else {
                        responseMessage = "Invalid Password";
                    }
                } else {
                    responseMessage = "Invalid User Name";
                }
            }
        } catch (SQLException e) {
            responseMessage = "Database error occurred: " + e.getMessage();
        } catch (Exception e) {
            responseMessage = "Unexpected error: " + e.getMessage();
        }

        return responseMessage;
    }
}
