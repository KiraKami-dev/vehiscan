import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vehiscan/src/screens/guard_screen/check_plate.dart';
import 'package:vehiscan/src/services/utils.dart';
import 'package:vehiscan/src/utils/global_methods.dart';
import 'package:vehiscan/src/widgets/appbar.widget.dart';

import '../admin_control.dart/admin_home.dart';

class GuardHome extends StatefulWidget {
  const GuardHome({super.key});

  @override
  State<GuardHome> createState() => _GuardHomeState();
}

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class _GuardHomeState extends State<GuardHome> {
  String dropdownValue = list.first;
  // void dropDown
  File? imageCamera;
  File? imageGallery;

  Future pickImageCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) {
        return;
      } else {
        final imageTemp = File(image.path);
        setState(() => imageCamera = imageTemp);
      }

      // Get.to(()=> )
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      } else {
        final imageTemp = File(image.path);
        setState(() => imageCamera = imageTemp);
      }

      // Get.to(()=> )
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //@TODO get list from Future
            //@TODO store in shared prefs
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                style: TextStyle(color: Utils.textColor),
                icon: const Icon(Icons.home),
                value: dropdownValue,
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await GlobalMethod().pickImageCamera();
                GlobalMethod.imageCamera == null
                    ? Get.to(const GuardHome())
                    : Get.to(
                        () => CheckPlate(
                          imagePath: GlobalMethod.imageCamera!.path,
                        ),
                      );
              },
              child: const Text("Click photo"),
            ),
            ElevatedButton(
              onPressed: () async {
                await GlobalMethod().pickImageGallery();
                GlobalMethod.imageGallery == null
                    ? Get.to(const GuardHome())
                    : Get.to(
                        () => CheckPlate(
                          imagePath: GlobalMethod.imageGallery!.path,
                        ),
                      );
                // Get.to(() => AdminHome());
              },
              child: const Text("Camera roll"),
            ),
            // imageCamera == null? Container():
            // Image.file(File(imageCamera!.path)),
          ],
        ),
      ),
    );
  }
}
