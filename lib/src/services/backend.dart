import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vehiscan/src/models/building_model.dart';
import 'package:vehiscan/src/services/utils.dart';
import 'package:vehiscan/src/utils/global_methods.dart';

import '../models/cars_model.dart';
import 'local_storage.dart';

part 'backend.g.dart';

final dio = Dio();
const baseUrl = "http://192.168.0.105:8000/api";



// void getAllbuilding() async {
//   final userOrder = await dio.get('$baseUrl/buildings');
// }
// flutter pub run build_runner watch
void showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(content: Text(text));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

@riverpod
int count(CountRef ref) => 0;

@riverpod
Future <List<BuildingModel>> getAllBuild(GetAllBuildRef ref) async {
  try {
    final response = await dio.get('$baseUrl/buildings');

    if (response.statusCode == 200) {
      final List<dynamic> buildingList = response.data['buildings'];
      final List<BuildingModel> buildings = buildingList
          .map((buildingJson) => BuildingModel.fromJson(buildingJson))
          .toList();

      return buildings;
    } else {
      throw Exception("Failed to load data");
    }
  } catch (e) {
    throw Exception("Error : $e");
  }
}

// return BuildingModel(id: "123", name: "Select a Building");
// }

@riverpod
Future<bool> registerBuild(RegisterBuildRef ref, String buildName,
    String password, BuildContext context) async {
  final register = await dio.post('$baseUrl/buildings/register',
      data: {'name': "$buildName", 'password': "$password"});

  if (register.statusCode == 200) {
    showSnackBar(context, "Registered Building!");
    LocalStorageService.saveBuildingName(buildName);
    return true;
  } else {
    showSnackBar(context, "Error while registering!");
    return false;
  }
}

@riverpod
Future<bool> loginBuild(LoginBuildRef ref, String buildName, String password,
    BuildContext context) async {
  try {
    final login = await dio.get('$baseUrl/buildings/login',
        data:
            jsonEncode({'buildingName': "$buildName", 'password': "$password"}),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ));
    if (login.statusCode == 200) {
      showSnackBar(context, "Login Successful!");
      LocalStorageService.saveBuildingName(buildName);
      print("Login Successful!");
      return true;
    } else {
      showSnackBar(context, "Error while login!");
      return false;
    }
  } catch (e) {
    print(e);
    rethrow;
  }
}

@riverpod
Future<Response> logoutBuild(LogoutBuildRef ref) async {
  try {
    final login = await dio.post('$baseUrl/buildings/login',
        data: jsonEncode({'buildingName': "Vasant Vihar", 'password': "21312"}),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ));
    return login.data;
  } catch (e) {
    print(e);
    rethrow;
  }
}

@riverpod
Future carsById(CarsByIdRef ref) async {
  final selectedBuiling = LocalStorageService.getSelectedBuilding();
  final getAllcars = await dio
      .get("$baseUrl/buildings/0188edec-1e63-4995-91fc-7308a3f03b31/cars");
  
  return getAllcars.data["cars"];
}

@riverpod
Future addCars(AddCarsRef ref, String carNumber, bool isCar) async {
  final buildingId = LocalStorageService.getSelectedId();
  final addCar = await dio.post(
    "$baseUrl/buildings/0188edec-1e63-4995-91fc-7308a3f03b31/cars",
    data: {'carNumber': '$carNumber', 'isCar': '$isCar'},
  );
  print(addCar.data);
}

@riverpod
Future removeCars(RemoveCarsRef ref, String carId) async {
  final buildingId = LocalStorageService.getSelectedId();
  final removeCar = await dio.delete(
    "$baseUrl/buildings/0188edec-1e63-4995-91fc-7308a3f03b31/cars/$carId",
    // data: {'carNumber': '$carNumber', 'isCar': '$isCar'},
  );
  print("Car removed : ");
  print(removeCar.data);
}
