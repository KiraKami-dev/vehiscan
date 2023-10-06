import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:vehiscan/src/app.dart';
import 'package:vehiscan/src/screens/admin_record.dart/admin_login.dart';
import 'package:vehiscan/src/screens/guard_screen/check_plate.dart';
import 'package:vehiscan/src/services/local_storage.dart';
import 'package:vehiscan/src/widgets/appbar.widget.dart';
import 'package:vehiscan/src/widgets/drawer.dart';

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
      appBar: const AppBarWidget(lead: false),
      endDrawer: NavDrawer(),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.network(
                  "https://img.freepik.com/free-vector/front-car-concept-illustration_114360-7978.jpg?w=1380&t=st=1696513992~exp=1696514592~hmac=14f7a429d85bf7aed10af0579c9f9c1690f829aeb184f6615d31cd37868fe825"),
            ),
            Container(
              width: 260,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                  optionsViewBuilder: (context, onSelected, options) => Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Container(
                        height: 52.0 * options.length,
                        width: 250,
                        child: ListView.builder(
                          itemCount: options.length,
                          padding: EdgeInsets.zero,
                          shrinkWrap: false,
                          itemBuilder: (context, index) {
                            final String item = options.elementAt(index);
                            return InkWell(
                              onTap: () => onSelected(item),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(item),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  fieldViewBuilder: (context, textEditingController, focusNode,
                      onFieldSubmitted) {
                    return TextField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      onEditingComplete: onFieldSubmitted,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.apartment_rounded),
                      ),
                    );
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
            ),
            SizedBox(
              height: 40,
            ),
            // Spacer(flex: 1,),
            Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CheckPlate(),
                    ),
                  );
                },
                icon: Icon(IconlyBold.scan,color: Colors.white70,),
                label: const Text("Scan"),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.purple,
                  elevation: 1,
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
