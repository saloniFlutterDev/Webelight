import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webelight_practical/bloc/vehicle_cubit.dart';
import 'package:webelight_practical/core/api_service.dart';
import 'package:webelight_practical/screens/splash_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VehicleCubit(ApiService())..fetchVehicles(),
        ),
      ],
      child: MaterialApp(
        title: 'Vehicle App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
