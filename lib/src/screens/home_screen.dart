import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vehiscan/src/app.dart';
import 'package:vehiscan/src/screens/admin_record.dart/admin_home.dart';
import 'package:vehiscan/src/screens/guard_screen/home_guard.dart';
import 'package:vehiscan/src/services/local_storage.dart';
import 'package:vehiscan/src/widgets/appbar.widget.dart';

import '../services/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const List<String> _kOptions = <String>[
    'Kishor Kunj 5, virar (w)',
    'Kishor Kunj 4, virar (w)',
    'Kishor Kunj 3, virar (w)',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Container(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 200,
              child: Autocomplete<String>(
                initialValue: TextEditingValue(
                    text: LocalStorageService.getSelectedBuilding()),
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return _kOptions.where((String option) {
                    return option
                        .toLowerCase()
                        .contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String buildingName) {
                  setState(
                    () {
                      LocalStorageService.saveBuildingName(buildingName);
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Scan"),
            ),
          ],
        ),
      ),
    );
  }
}
