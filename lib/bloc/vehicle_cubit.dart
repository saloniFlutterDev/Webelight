import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:webelight_practical/core/api_service.dart';
import 'package:webelight_practical/model/vehicle_response_model.dart';

part 'vehicle_state.dart';

class VehicleCubit extends Cubit<VehicleState> {
  final ApiService apiService;

  VehicleCubit(this.apiService) : super(VehicleInitial());

  Future<void> fetchVehicles() async {
    try {
      emit(VehicleLoading());
      final vehicles = await apiService.fetchVehicles();
      print("My data in cubit $vehicles");
      emit(VehicleLoaded(vehicles));
    } catch (e) {
      emit(VehicleError(e.toString()));
    }
  }
}
