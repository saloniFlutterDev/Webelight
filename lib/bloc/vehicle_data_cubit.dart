import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webelight_practical/model/vehicle_data_resposne_model.dart';

import '../core/api_service.dart';

part 'vehicle_data_state.dart';

class VehicleDataCubit extends Cubit<VehicleDataState> {

  VehicleDataCubit() : super(VehicleDataInitial());

  Future<void> fetchVehicles(int id) async {
    try {
      emit(VehicleDataLoading());
      final vehicleData = await ApiService().fetchVehiclesData(id);
      print("My data in cubit $vehicleData");
      emit(VehicleDataLoaded(vehicleData));
    } catch (e) {
      emit(VehicleDataError(e.toString()));
    }
  }
}
