part of 'vehicle_data_cubit.dart';

@immutable
abstract class VehicleDataState {}

class VehicleDataInitial extends VehicleDataState {}

class VehicleDataLoading extends VehicleDataState {}

class VehicleDataLoaded extends VehicleDataState {
  final VehicleDataResposneModel vehicleDataState;

  VehicleDataLoaded(this.vehicleDataState);
}

class VehicleDataError extends VehicleDataState {
  final String message;

  VehicleDataError(this.message);
}
