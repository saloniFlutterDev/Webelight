import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webelight_practical/core/api_service.dart';
import 'package:webelight_practical/model/vehicle_response_model.dart';

class VehicleDetailCubit extends Cubit<VehicleResult> {
  VehicleDetailCubit() : super(VehicleResult());

  void selectVehicle(VehicleResult vehicleResult){
    emit(vehicleResult);
  }
}