import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vehiscan/src/models/building_model.dart';
import 'package:vehiscan/src/services/utils.dart';

import '../models/cars_model.dart';
import 'local_storage.dart';

part 'backend.g.dart';

final dio = Dio();
const baseUrl = "http://192.168.43.34:8000/api";

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
Future<List<BuildingModel>> getAllBuild(GetAllBuildRef ref) async {
  final response = await dio.get('$baseUrl/buildings');
  final buildings = jsonDecode(response.data);
  return buildings.map((building) => BuildingModel.fromJson(building)).toList();
}
// print(buildings.data["buildings"][0]["id"]);

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
  print("Json Decode");
  // final jsonData = jsonDecode(getAllcars.data["cars"]);
  // print(jsonDecode(getAllcars.data["cars"]));
  return getAllcars.data["cars"];
}

@riverpod
void addCars(AddCarsRef ref) async {
  final selectedBuiling = LocalStorageService.getSelectedBuilding();
  final addCar = await dio.post(
    "$baseUrl/buildings/64b85141-93c2-42c2-9a86-b2fc8f1bde3c/cars",
    data: {'carNumber': 'MH48AT1232', 'isCar': 'true'},
  );
  print(addCar.data);
}

@riverpod
void removeCars(RemoveCarsRef ref) async {
  final selectedBuiling = LocalStorageService.getSelectedBuilding();
  final removeCar = await dio.delete(
    "$baseUrl/buildings/64b85141-93c2-42c2-9a86-b2fc8f1bde3c/cars/f75a7053-90fc-4488-853b-7419ddec2b70",
    data: {'carNumber': 'MH48AT1232', 'isCar': 'true'},
  );
  print("Car removed : ");
  print(removeCar.data);
}
