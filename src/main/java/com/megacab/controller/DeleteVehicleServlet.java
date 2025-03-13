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

@WebServlet("/DeleteVehicleServlet")
public class DeleteVehicleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int vehicleId = -1;
        try {
            vehicleId = Integer.parseInt(request.getParameter("vehicleId"));
        } catch (NumberFormatException e) {
            response.sendRedirect("admin_dashboard.jsp?error=InvalidID");
            return;
        }

        Connection con = null;
        PreparedStatement pst = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacab", "root", "root");

            String query = "DELETE FROM vehicles WHERE vehicle_id=?";
            pst = con.prepareStatement(query);
            pst.setInt(1, vehicleId);

            int rowsDeleted = pst.executeUpdate();

            if (rowsDeleted > 0) {
                response.sendRedirect("admin_dashboard.jsp?success=Deleted");
            } else {
                response.sendRedirect("admin_dashboard.jsp?error=DeleteFailed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin_dashboard.jsp?error=Exception");
        } finally {
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (Exception ignored) {}
        }
    }
}
