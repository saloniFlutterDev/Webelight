import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webelight_practical/bloc/vehicle_cubit.dart';
import 'package:webelight_practical/bloc/vehicle_details_cubit.dart';
import 'package:webelight_practical/screens/vehicle_details_screen.dart';

class HomeScreen extends StatelessWidget {
  final VehicleDetailCubit vehicleDetailCubit = VehicleDetailCubit();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: vehicleDetailCubit,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Vehicles'),
        ),
        body: BlocBuilder<VehicleCubit, VehicleState>(
          builder: (context, state) {
            if (state is VehicleLoading) {
              return Center(child: CircularProgressIndicator());
            }
            else if (state is VehicleLoaded) {
              return ListView.builder(
                itemCount: state.vehicles.results?.length ?? 0,
                itemBuilder: (context, index) {
                  final vehicleIndex = state.vehicles.results?[index];
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16.0),
                      title: Hero(
                        tag: vehicleIndex?.name ?? '',
                        child: Text(
                          vehicleIndex?.name ?? "",
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Model: ${vehicleIndex?.model ?? ""}'),
                          Text('Manufacturer: ${vehicleIndex?.manufacturer ?? ""}'),
                        ],
                      ),
                      onTap: () {
                        vehicleDetailCubit.selectVehicle(vehicleIndex!);


                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => VehicleDetailsScreen(vehicleDetailCubit: vehicleDetailCubit),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            } else if (state is VehicleError) {
              return Center(child: Text('Failed to load vehicles: ${state.message}'));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
