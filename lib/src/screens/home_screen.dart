import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehiscan/src/app.dart';
import 'package:vehiscan/src/screens/admin_control.dart/admin_home.dart';
import 'package:vehiscan/src/screens/guard_screen/home_guard.dart';
import 'package:vehiscan/src/widgets/appbar.widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(()=>GuardHome());
              },
              child: Text("Guard"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(()=>AdminHome());
              },
              child: Text("Admin"),
            ),
          ],
        ),
      ),
    );
  }
}
