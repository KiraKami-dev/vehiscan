import 'package:meta/meta.dart';
import 'dart:convert';

class CarModel {
    final List<Car> cars;

    CarModel({
        required this.cars,
    });

    factory CarModel.fromRawJson(String str) => CarModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
        cars: List<Car>.from(json["cars"].map((x) => Car.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cars": List<dynamic>.from(cars.map((x) => x.toJson())),
    };
}

class Car {
    final String id;
    final String buildingid;
    final String carnumber;
    final bool iscar;

    Car({
        required this.id,
        required this.buildingid,
        required this.carnumber,
        required this.iscar,
    });

    factory Car.fromRawJson(String str) => Car.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Car.fromJson(Map<String, dynamic> json) => Car(
        id: json["id"],
        buildingid: json["buildingid"],
        carnumber: json["carnumber"],
        iscar: json["iscar"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "buildingid": buildingid,
        "carnumber": carnumber,
        "iscar": iscar,
    };
}
