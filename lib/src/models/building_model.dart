import 'package:meta/meta.dart';
import 'dart:convert';

class Build {
    final List<BuildingModel> buildings;

    Build({
        required this.buildings,
    });

    factory Build.fromRawJson(String str) => Build.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Build.fromJson(Map<String, dynamic> json) => Build(
        buildings: List<BuildingModel>.from(json["buildings"].map((x) => BuildingModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "buildings": List<dynamic>.from(buildings.map((x) => x.toJson())),
    };
}

class BuildingModel {
    final String id;
    final String name;

    BuildingModel({
        required this.id,
        required this.name,
    });

    factory BuildingModel.fromRawJson(String str) => BuildingModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BuildingModel.fromJson(Map<String, dynamic> json) => BuildingModel(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
