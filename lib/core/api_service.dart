import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:webelight_practical/model/vehicle_data_resposne_model.dart';
import 'package:webelight_practical/model/vehicle_response_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<VehicleListResponseModel> fetchVehicles() async {
    try {
      final response = await _dio.get('https://swapi.dev/api/vehicles/?page=2');
      final vehicleListResponse = VehicleListResponseModel.fromJson(response.data);
      return vehicleListResponse;
    } on DioException catch (e) {
      if (e.response != null) {
        // Error with response
        throw Exception('Failed to load vehicles: ${e.response?.statusMessage}');
      } else {
        // Other errors such as network issues
        throw Exception('Failed to load vehicles: ${e.message}');
      }
    }
  }
  Future<VehicleDataResposneModel> fetchVehiclesData(int id) async {
    try {
      final response = await _dio.get('https://swapi.dev/api/vehicles/$id/');
      final vehicleDataResponse = VehicleDataResposneModel.fromJson(response.data);
      return vehicleDataResponse;
    } on DioException catch (e) {
      if (e.response != null) {
        // Error with response
        throw Exception('Failed to load vehicles: ${e.response?.statusMessage}');
      } else {
        // Other errors such as network issues
        throw Exception('Failed to load vehicles: ${e.message}');
      }
    }
  }
}
