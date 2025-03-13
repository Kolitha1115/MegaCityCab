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

@WebServlet("/EditVehicleServlet")
public class EditVehicleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int vehicleId = -1;
        try {
            vehicleId = Integer.parseInt(request.getParameter("vehicleId"));
        } catch (NumberFormatException e) {
            response.sendRedirect("manage_vehicles.jsp?error=InvalidID");
            return;
        }

        String name = request.getParameter("name");
        String model = request.getParameter("model");
        String licensePlate = request.getParameter("licensePlate");
        String type = request.getParameter("type");
        String rentStr = request.getParameter("rent");

        if (name == null || model == null || licensePlate == null || type == null || rentStr == null ||
            name.isEmpty() || model.isEmpty() || licensePlate.isEmpty() || type.isEmpty() || rentStr.isEmpty()) {
            response.sendRedirect("edit_vehicle.jsp?id=" + vehicleId + "&error=EmptyFields");
            return;
        }

        double rent;
        try {
            rent = Double.parseDouble(rentStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("edit_vehicle.jsp?id=" + vehicleId + "&error=InvalidRent");
            return;
        }

        Connection con = null;
        PreparedStatement pst = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacab", "root", "root");

            String query = "UPDATE vehicles SET vehicle_name=?, vehicle_model=?, vehicle_number=?, vehicle_type=?, vehicle_rent=? WHERE vehicle_id=?";
            pst = con.prepareStatement(query);
            pst.setString(1, name);
            pst.setString(2, model);
            pst.setString(3, licensePlate);
            pst.setString(4, type);
            pst.setDouble(5, rent);
            pst.setInt(6, vehicleId);

            int rowsUpdated = pst.executeUpdate();

            if (rowsUpdated > 0) {
                response.sendRedirect("admin_dashboard.jsp?success=1");
            } else {
                response.sendRedirect("edit_vehicle.jsp?id=" + vehicleId + "&error=UpdateFailed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("edit_vehicle.jsp?id=" + vehicleId + "&error=Exception");
        } finally {
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (Exception ignored) {}
        }
    }
}
