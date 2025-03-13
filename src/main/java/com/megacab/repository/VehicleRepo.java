package com.megacab.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.megacab.model.VehicleModel;

public class VehicleRepo {

    private static final String URL = "jdbc:mysql://127.0.0.1:3306/megacab?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public boolean addVehicle(VehicleModel vehicle) {
        String sql = "INSERT INTO vehicles (vehicle_name, vehicle_model, vehicle_number, vehicle_type, vehicle_rent, vehicle_image) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection con = getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setString(1, vehicle.getVehicleName());
            pst.setString(2, vehicle.getVehicleModel());
            pst.setString(3, vehicle.getVehicleNumber());
            pst.setString(4, vehicle.getVehicleType());
            pst.setDouble(5, vehicle.getVehicleRent());
            pst.setBytes(6, vehicle.getVehicleImage()); // Store image as bytes

            int rowsAffected = pst.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}