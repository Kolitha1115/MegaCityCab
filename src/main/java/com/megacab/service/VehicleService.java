package com.megacab.service;

import com.megacab.model.VehicleModel;
import com.megacab.repository.VehicleRepo;

public class VehicleService {
    private VehicleRepo vehicleRepo = new VehicleRepo();

    public boolean registerVehicle(VehicleModel vehicle) {
        return vehicleRepo.addVehicle(vehicle);
    }
}
