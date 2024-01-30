import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vehiscan/src/app.dart';
import 'package:vehiscan/src/models/building_model.dart';
import 'package:vehiscan/src/screens/admin_record.dart/admin_login.dart';
import 'package:vehiscan/src/screens/guard_screen/check_plate.dart';
import 'package:vehiscan/src/services/backend.dart';
import 'package:vehiscan/src/services/local_storage.dart';
import 'package:vehiscan/src/widgets/appbar.widget.dart';
import 'package:vehiscan/src/widgets/drawer.dart';

import '../../main.dart';
import '../services/utils.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool selectBuild = false;

  @override
  Widget build(BuildContext context) {    
    final buildings = ref.watch(getAllBuildProvider);
    final getAllCars = ref.watch(carsByIdProvider);
    final selectedBuilding = LocalStorageService.getSelectedBuilding();
    if (selectedBuilding.isEmpty) {
      selectBuild = false;
    } else {
      selectBuild = true;
    }

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: const AppBarWidget(lead: false),
      endDrawer: const NavDrawer(),
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(
              flex: 1,
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset("assets/Logo.jpg")),
            Container(
              width: 260,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildings.when(
                  data: (builds) {
                    return Autocomplete<BuildingModel>(
                      // displayStringForOption: (option) => option.name,
                      initialValue: TextEditingValue(
                        text: selectedBuilding,
                      ),
                      optionsBuilder:
                          (TextEditingValue textEditingValue) async {
                        if (textEditingValue.text == '') {
                          return <BuildingModel>[];
                        }

                        return builds
                            .where((BuildingModel building) => building.name
                                .toLowerCase()
                                .contains(textEditingValue.text.toLowerCase()))
                            .toList();
                      },
                      optionsViewBuilder: (context, onSelected, options) =>
                          Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Container(
                            height: 52.0,
                            width: 250,
                            child: ListView.builder(
                              itemCount: options.length,
                              padding: EdgeInsets.zero,
                              shrinkWrap: false,
                              itemBuilder: (context, index) {
                                final item = options.elementAt(index);
                                return InkWell(
                                  onTap: () {
                                    onSelected(item);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Text(item.name),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      fieldViewBuilder: (context, textEditingController,
                          focusNode, onFieldSubmitted) {
                        return TextField(
                          controller: textEditingController,
                          focusNode: focusNode,
                          onEditingComplete: onFieldSubmitted,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.apartment_rounded),
                          ),
                        );
                      },
                      onSelected: (buildingName) {
                        setState(
                          () {
                            LocalStorageService.saveBuildingName(
                                buildingName.name);

                            LocalStorageService.saveBuildingId(buildingName.id);
                            selectBuild = true;
                          },
                        );
                      },
                    );
                  },
                  error: (error, stackTrace) =>
                      Text('Error: $error $stackTrace'),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Spacer(flex: 1,),
            Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
                onPressed: () {
                  if (!selectBuild) {
                    Fluttertoast.showToast(
                      msg: "Select building first!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CheckPlate(),
                      ),
                    );
                  }
                },
                icon: const Icon(
                  IconlyBold.scan,
                  color: Colors.white70,
                ),
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

            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
