import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GlobalMethod {
  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
