package com.megacab.model;

public class VehicleModel {
    private int vehicleId;
    private String vehicleName;
    private String vehicleModel;
    private String vehicleNumber;
    private String vehicleType;
    private double vehicleRent;
    private byte[] vehicleImage;

    // Constructors
    public VehicleModel() {}

    public VehicleModel(String vehicleName, String vehicleModel, String vehicleNumber, String vehicleType, double vehicleRent, byte[] vehicleImage) {
        this.vehicleName = vehicleName;
        this.vehicleModel = vehicleModel;
        this.vehicleNumber = vehicleNumber;
        this.vehicleType = vehicleType;
        this.vehicleRent = vehicleRent;
        this.vehicleImage = vehicleImage;
    }

    // Getters and Setters
    public int getVehicleId() { return vehicleId; }
    public void setVehicleId(int vehicleId) { this.vehicleId = vehicleId; }

    public String getVehicleName() { return vehicleName; }
    public void setVehicleName(String vehicleName) { this.vehicleName = vehicleName; }

    public String getVehicleModel() { return vehicleModel; }
    public void setVehicleModel(String vehicleModel) { this.vehicleModel = vehicleModel; }

    public String getVehicleNumber() { return vehicleNumber; }
    public void setVehicleNumber(String vehicleNumber) { this.vehicleNumber = vehicleNumber; }

    public String getVehicleType() { return vehicleType; }
    public void setVehicleType(String vehicleType) { this.vehicleType = vehicleType; }

    public double getVehicleRent() { return vehicleRent; }
    public void setVehicleRent(double vehicleRent) { this.vehicleRent = vehicleRent; }

    public byte[] getVehicleImage() { return vehicleImage; }
    public void setVehicleImage(byte[] vehicleImage) { this.vehicleImage = vehicleImage; }
}
