import '../utils/shared_prefs.dart';

class LocalStorageService {
  static Future<void> saveBuildingName(String buildingName) async {
    await prefs()!.setString('buildingName', buildingName);
  }

  static Future<void> saveBuildingId(String buildingId) async {
    await prefs()!.setString('buildingId', buildingId);
  }

  static String getSelectedBuilding() {
    return prefs()!.getString('buildingName') ?? "";
  }
  static String getSelectedId() {
    return prefs()!.getString('buildingId') ?? "";
  }

  static Future<bool> removeSelectedBuilding() {
    return prefs()!.remove('buildingName');
  }

  static Future<bool> removeSelectedId() {
    return prefs()!.remove('buildingId');
  }

  static Future<void> clear() {
    return prefs()!.clear();
  }
}
