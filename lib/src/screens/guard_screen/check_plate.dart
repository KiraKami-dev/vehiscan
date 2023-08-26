import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehiscan/src/screens/guard_screen/invalid_screen.dart';
import 'package:vehiscan/src/utils/global_methods.dart';
import 'package:vehiscan/src/widgets/appbar.widget.dart';

class CheckPlate extends StatefulWidget {
  CheckPlate({
    super.key,
    required this.imagePath,
  });
  String imagePath;
  @override
  State<CheckPlate> createState() => _CheckPlateState();
}

class _CheckPlateState extends State<CheckPlate> {
  bool plateCheck = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Placeholder(
              child: Container(
                height: 300,
                width: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 1,
                  ),
                ),
                child: widget.imagePath == ""
                    ? const Center(
                        child: Text("Click photo / Select Image"),
                      )
                    : Image.file(File(widget.imagePath)),
              ),
            ),
            const Spacer(flex: 3),
            const Text(
              "Vehicle Number",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(flex: 2),
            const Text("MH48 AH 2002"), // change from static to dynamic
            const SizedBox(
              height: 20,
            ),
            plateCheck ? const Icon(Icons.check) : const Icon(Icons.cancel),
            // const SizedBox(
            //   width: 40,
            // ),
            const Spacer(flex: 4),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const InvalidScreen());
              },
              child: const Text("Invalid vehicle number tap here!"),
            ),
            const Spacer(flex: 1),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                "Go Back",
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
