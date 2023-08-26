import '../utils/shared_prefs.dart';

class LocalStorageService {
  static Future<void> saveBuildingName(String buildingName) async {
    await prefs()!.setString('buildingName', buildingName);
  }

  static String? getSelectedTv() {
    return prefs()!.getString('buildingName');
  }

  static Future<bool> removeSelectedTv() {
    return prefs()!.remove('buildingName');
  }

  static Future<void> clear() {
    return prefs()!.clear();
  }
}
