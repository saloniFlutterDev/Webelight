part of 'vehicle_cubit.dart';

@immutable
abstract class VehicleState {}

class VehicleInitial extends VehicleState {}

class VehicleLoading extends VehicleState {}

class VehicleLoaded extends VehicleState {
  final VehicleListResponseModel vehicles;

  VehicleLoaded(this.vehicles);
}

class VehicleError extends VehicleState {
  final String message;

  VehicleError(this.message);
}
