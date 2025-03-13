package com.megacab.controller;

import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.megacab.model.VehicleModel;
import com.megacab.service.VehicleService;

@WebServlet("/AddVehicleServlet")
@MultipartConfig(maxFileSize = 16177215) // 16MB limit for image upload
public class AddVehicleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VehicleService vehicleService = new VehicleService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String model = request.getParameter("model");
        String number = request.getParameter("number");
        String type = request.getParameter("type");
        double rent = Double.parseDouble(request.getParameter("rent"));

        Part filePart = request.getPart("image");
        InputStream imageStream = filePart.getInputStream();
        byte[] imageBytes = imageStream.readAllBytes(); 

        VehicleModel vehicle = new VehicleModel(name, model, number, type, rent, imageBytes);
        boolean isSuccess = vehicleService.registerVehicle(vehicle);

        if (isSuccess) {
            response.sendRedirect("admin_dashboard.jsp?msg=Vehicle Added Successfully");
        } else {
            response.sendRedirect("add_vehicle.jsp?error=Failed to Add Vehicle");
        }
    }
}
