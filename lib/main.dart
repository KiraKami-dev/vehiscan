import 'package:flutter/material.dart';
import 'package:vehiscan/src/app.dart';

import 'src/utils/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  runApp(const MyApp());
}
