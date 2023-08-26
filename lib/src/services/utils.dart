import 'package:flutter/material.dart';

class Utils {
  BuildContext context;

  Utils(this.context);

  static final appTheme = Color(0xFFFFFFFF);
  static final textColor = Color(0xFF000000);

  Size get getScreenSize => MediaQuery.of(context).size;
}