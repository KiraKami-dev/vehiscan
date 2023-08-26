import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class GlobalMethod {
  static File? imageCamera;
  static File? imageGallery;
  //Function to get image from gallery
  Future pickImageCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      
      // setState(() => this.image = imageTemp);
      imageCamera = imageTemp;
    } on PlatformException catch (e) {
      // Get.showSnackbar(GetSnackBar(
      //   title: "Failed to pick Image : $e",
      // ));
    }
  }
    Future pickImageGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      // setState(() => this.image = imageTemp);
      imageGallery = imageTemp;
    } on PlatformException catch (e) {
      // Get.showSnackbar(GetSnackBar(
      //   title: "Failed to pick Image : $e",
      // ));
    }
  }
}
