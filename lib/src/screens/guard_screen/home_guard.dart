import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vehiscan/src/screens/guard_screen/check_plate.dart';
import 'package:vehiscan/src/services/utils.dart';
import 'package:vehiscan/src/utils/global_methods.dart';
import 'package:vehiscan/src/widgets/appbar.widget.dart';

class GuardHome extends StatefulWidget {
  const GuardHome({super.key});

  @override
  State<GuardHome> createState() => _GuardHomeState();
}

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class _GuardHomeState extends State<GuardHome> {
  String dropdownValue = list.first;
  // void dropDown

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
              onPressed: () {},
              child: const Text("Click photo"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Camera roll"),
            ),
          ],
        ),
      ),
    );
  }
}
