import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vehiscan/src/models/building_model.dart';
import 'local_storage.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'backend.g.dart';

final dio = Dio();
// const ipAddress = "13.233.186.190";

// const baseUrl = "http://$ipAddress:8000/api";
final baseUrl = dotenv.env['AWS_URL'];

void showSnackBar(BuildContext context, String text, bool success) {
  final snackBar = SnackBar(
    content: Text(text),
    backgroundColor: success ? Colors.green : Colors.redAccent,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

final isAuth = StateProvider<bool>((ref) => true);

@riverpod
Future<List<BuildingModel>> getAllBuild(GetAllBuildRef ref) async {
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


@riverpod
Future<bool> registerBuild(RegisterBuildRef ref, String buildName,
    String password, BuildContext context) async {
  // final dio = Dio(options);
  Map<String, dynamic> body = {
    "buildingName": buildName,
    "password": password,
  };

  print(body);
  final register =
      await dio.post('$baseUrl/buildings/register', data: jsonEncode(body));

  if (register.statusCode == 200) {
    LocalStorageService.saveBuildingName(buildName);
    // showSnackBar(context, "Registered Building!");
    return true;
  } else {
    // showSnackBar(context, "Error while registering!");
    return false;
  }
}

@riverpod
Future<void> loginBuild(LoginBuildRef ref,
    {required String buildName, required String password}) async {
  // final dio = Dio(options);
  Map<String, dynamic> body = {
    "buildingName": buildName,
    "password": password,
  };
  Response response = await dio.post(
    '$baseUrl/buildings/login',
    data: json.encode(body),
    options: Options(
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  if (kDebugMode) {

  }
  if (response.statusCode == 200) {
    LocalStorageService.saveBuildingName(buildName);
    LocalStorageService.setAuthStatus(true);
    ref.read(isAuth.notifier).state = true;

    final checkAuth = ref.watch(isAuth);
    if (kDebugMode) {
      print("This is status : $checkAuth");
    }
  }
   else {
    ref.read(isAuth.notifier).state = false;
  }
}

@riverpod
Future<Response> logoutBuild(LogoutBuildRef ref) async {
  try {
    final logout = await dio.post(
      '$baseUrl/buildings/login',
      data: jsonEncode({'buildingName': "Vasant Vihar", 'password': "21312"}),
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    return logout.data;
  } catch (e) {
    print(e);
    rethrow;
  }
}

@riverpod
Future carsById(CarsByIdRef ref) async {
  final builingId = LocalStorageService.getSelectedId();
  try {
    final getAllcars = await dio.get("$baseUrl/buildings/$builingId/cars");
    return getAllcars.data["cars"];
  } catch (e) {
    throw Exception(e);
  }
}

@riverpod
Future addCars(AddCarsRef ref, String carNumber, bool isCar) async {
  final buildingId = LocalStorageService.getSelectedId();
  final addCar = await dio.post(
    "$baseUrl/buildings/$buildingId/cars",
    data: {'carNumber': carNumber, 'isCar': '$isCar'},
  );
}

@riverpod
Future removeCars(RemoveCarsRef ref, String carId) async {
  final buildingId = LocalStorageService.getSelectedId();
  final removeCar = await dio.delete(
    "$baseUrl/buildings/$buildingId/cars/$carId",
    // data: {'carNumber': '$carNumber', 'isCar': '$isCar'},
  );
}
