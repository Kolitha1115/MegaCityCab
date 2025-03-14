package com.megacab.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteBookingServlet")
public class DeleteBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String bookingId = request.getParameter("id");
        response.setContentType("text/plain"); // Set response type

        if (bookingId != null && !bookingId.isEmpty()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacab", "root", "root");

                String sql = "DELETE FROM checkout WHERE id = ?"; // Fixed SQL query
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setInt(1, Integer.parseInt(bookingId));

                int rowsAffected = pst.executeUpdate(); // Executes DELETE query
                
                pst.close();
                con.close();
                
                if (rowsAffected > 0) {
                    response.getWriter().write("success");
                } else {
                    response.getWriter().write("failed");
                }
            } catch (Exception e) {
                e.printStackTrace();  // Logs error to the server console
                response.getWriter().write("error: " + e.getMessage());  // Send error to front-end
            }
        } else {
            response.getWriter().write("invalid");
        }
    }
}
