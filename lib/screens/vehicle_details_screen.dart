import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webelight_practical/bloc/vehicle_data_cubit.dart';
import 'package:webelight_practical/bloc/vehicle_details_cubit.dart';
import 'package:webelight_practical/model/vehicle_response_model.dart';

class VehicleDetailsScreen extends StatefulWidget {
  final VehicleDetailCubit vehicleDetailCubit;

  const VehicleDetailsScreen({required this.vehicleDetailCubit});

  @override
  State<VehicleDetailsScreen> createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {

  final VehicleDataCubit vehicleDataCubit = VehicleDataCubit();
  @override
  void initState() {
    super.initState();
    vehicleDataCubit.fetchVehicles(7);
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: vehicleDataCubit,
        ),
        BlocProvider.value(
          value: widget.vehicleDetailCubit,
        ),
      ],
      child:BlocBuilder<VehicleDetailCubit, VehicleResult>(
            builder: (BuildContext context, VehicleResult vehicleState) {
              return Scaffold(
                appBar: AppBar(
                  title: Hero(tag: vehicleState.name ?? '', child: Text(vehicleState.name ?? "")),
                ),
                body:  BlocBuilder<VehicleDataCubit, VehicleDataState>(
                  builder: (BuildContext context, VehicleDataState state) {
                    if (state is VehicleDataLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    else if (state is VehicleDataLoaded) {
                      return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name: ${state.vehicleDataState.name ?? ""}', style: TextStyle(fontSize: 18)),
                              Text('Create: ${state.vehicleDataState.created ?? ""}', style: TextStyle(fontSize: 18)),
                              Text('Cargo Capacity: ${state.vehicleDataState.cargoCapacity ?? ""}', style: TextStyle(fontSize: 18)),
                              Text('Model: ${state.vehicleDataState.model ?? ""}', style: TextStyle(fontSize: 18)),
                            ],
                          ),);
                    } else if (state is VehicleDataError) {
                      return Center(child: Text('Failed to load vehicles: ${state.message}'));
                    }
                    return Container();
                  }
                ),
              );
            },
      ),
    );
  }
}
